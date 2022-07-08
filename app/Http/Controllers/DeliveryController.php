<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\Sale;
use App\City;
use App\Product_Sale;
use App\Product;
use App\ProductVariant;
use App\Delivery;
use App\DeliveryStatus;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use DB;
use Auth;
use App\Mail\UserNotification;
use Illuminate\Support\Facades\Mail;

class DeliveryController extends Controller
{
	public function index()
	{
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('delivery')) {
    		if(Auth::user()->role_id > 2 && config('staff_access') == 'own')
                $lims_delivery_all = Delivery::orderBy('id', 'desc')->where('sold_by', Auth::id())->get();
            else
                $lims_delivery_all = Delivery::orderBy('id', 'desc')->get();
    		return view('delivery.index', compact('lims_delivery_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
	}
    public function create($id){
    	$lims_delivery_data = Delivery::where('sale_id', $id)->first();
    	$lims_sale_data = Sale::where('id', $id)->first();
        $lims_city_data = City::where('id', $lims_sale_data->customer_city)->first();
    	if($lims_delivery_data){
            $delivery_data[] = $lims_delivery_data->reference_no;
            $delivery_data[] = $lims_sale_data->reference_no;
            $delivery_data[] = $lims_sale_data->customer_name;          //Customer Name
    		$delivery_data[] = $lims_sale_data->customer_tel;           //Customer Tel
    		$delivery_data[] = $lims_sale_data->customer_address;       //Customer Address
            $delivery_data[] = $lims_city_data->name;                   //Customer City
    		$delivery_data[] = $lims_delivery_data->delivered_by;
    		$delivery_data[] = $lims_delivery_data->note;
            $delivery_data[] = date('d/m/Y H:i:s');
    	}
    	else{ //Première livraison
    		$delivery_data[] = 'dr-' . date("dmy") . '-'. date("His");  //Delivery reference
    		$delivery_data[] = $lims_sale_data->reference_no;           //Sale reference
    		$delivery_data[] = $lims_sale_data->customer_name;          //Customer Name
    		$delivery_data[] = $lims_sale_data->customer_tel;           //Customer Tel
    		$delivery_data[] = $lims_sale_data->customer_address;       //Customer Address
            $delivery_data[] = $lims_city_data->name;                   //Customer City
    		$delivery_data[] = '';                                      //Delivered By
    		$delivery_data[] = '';                                      //Note 
    		$delivery_data[] = date('d/m/Y H:i:s');                    
    	}

    	return $delivery_data;
    }

    public function store(Request $request)
    {
        //dd($request);
        $data = $request->all();
        $delivery = Delivery::firstOrNew(['reference_no' => $data['reference_no'] ]);
        if ($delivery->exists) {
            $delivery->delivered_by = $data['delivered_by'];
            $delivery->note = $data['note'];
            $delivery->save();
        } else {
            $delivery->reference_no = $data['reference_no'];
            $delivery->sale_id = $data['sale_id'];
            $delivery->user_id = Auth::id();
            $lims_sale_data = Sale::find($data['sale_id']);
            $delivery->sold_by = $lims_sale_data->user_id;
            $delivery->delivered_by = $data['delivered_by'];
            $delivery->note = $data['note'];
            $delivery->save();
        }
        $deliveries = new DeliveryStatus();
        $deliveries->reference_no = $data['reference_no'];
        $deliveries->status = $data['status'];
        $deliveries->status_date = $data['status_date'];
        $deliveries->save();

        $message = 'Delivery created successfully';
        return redirect('sales')->with('message', $message);
    }

    public function productDeliveryData($id)
    {
        $lims_delivery_data = Delivery::find($id);
        //return 'madarchod';
        $lims_product_sale_data = Product_Sale::where('sale_id', $lims_delivery_data->sale->id)->get();

        foreach ($lims_product_sale_data as $key => $product_sale_data) {
            $product = Product::select('name', 'code')->find($product_sale_data->product_id);
            if($product_sale_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                $product->code = $lims_product_variant_data->item_code;
            }

            $product_sale[0][$key] = $product->code;
            $product_sale[1][$key] = $product->name;
            $product_sale[2][$key] = $product_sale_data->qty;
        }
        return $product_sale;
    }

    public function sendMail(Request $request)
    {
        $data = $request->all();
        $lims_delivery_data = Delivery::find($data['delivery_id']);
        $lims_sale_data = Sale::find($lims_delivery_data->sale->id);
        $lims_product_sale_data = Product_Sale::where('sale_id', $lims_delivery_data->sale->id)->get();
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        if($lims_customer_data->email) {
            //collecting male data
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['date'] = date(config('date_format'), strtotime($lims_delivery_data->created_at->toDateString()));
            $mail_data['delivery_reference_no'] = $lims_delivery_data->reference_no;
            $mail_data['sale_reference_no'] = $lims_sale_data->reference_no;
            $mail_data['status'] = $lims_delivery_data->status;
            $mail_data['customer_name'] = $lims_customer_data->name;
            $mail_data['address'] = $lims_customer_data->address . ', '.$lims_customer_data->city;
            $mail_data['phone_number'] = $lims_customer_data->phone_number;
            $mail_data['note'] = $lims_delivery_data->note;
            $mail_data['prepared_by'] = $lims_delivery_data->user->name;
            if($lims_delivery_data->delivered_by)
                $mail_data['delivered_by'] = $lims_delivery_data->delivered_by;
            else
                $mail_data['delivered_by'] = 'N/A';
            if($lims_delivery_data->recieved_by)
                $mail_data['recieved_by'] = $lims_delivery_data->recieved_by;
            else
                $mail_data['recieved_by'] = 'N/A';
            //return $mail_data;

            foreach ($lims_product_sale_data as $key => $product_sale_data) {
                $lims_product_data = Product::select('code', 'name')->find($product_sale_data->product_id);
                $mail_data['codes'][$key] = $lims_product_data->code;
                $mail_data['name'][$key] = $lims_product_data->name;
                if($product_sale_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                    $mail_data['codes'][$key] = $lims_product_variant_data->item_code;
                }
                $mail_data['qty'][$key] = $product_sale_data->qty;
            }

            //return $mail_data;

            // try{
            //     Mail::send( 'mail.delivery_challan', $mail_data, function( $message ) use ($mail_data)
            //     {
            //         $message->to( $mail_data['email'] )->subject( 'Delivery Challan' );
            //     });
            //     $message = 'Mail sent successfully';
            // }
            // catch(\Exception $e){
            //     $message = 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            // }
        }
        else
            $message = 'Customer does not have email!';
        
        return redirect()->back()->with('message', $message);
    }

    public function edit($id)
    {
    	$lims_delivery_data = Delivery::find($id);
    	$customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $lims_delivery_data->sale_id)->select('sales.reference_no','customers.name')->get();

    	$delivery_data[] = $lims_delivery_data->reference_no;
		$delivery_data[] = $customer_sale[0]->reference_no;
		$delivery_data[] = $lims_delivery_data->status;
		$delivery_data[] = $lims_delivery_data->delivered_by;
		$delivery_data[] = $lims_delivery_data->recieved_by;
		$delivery_data[] = $customer_sale[0]->name;
		$delivery_data[] = $lims_delivery_data->address;
		$delivery_data[] = $lims_delivery_data->note;
    	return $delivery_data;
    }

    public function update(Request $request)
    {
    	$input = $request->except('file');
        //return $input;
    	$lims_delivery_data = Delivery::find($input['delivery_id']);
    	$document = $request->file;
        if ($document) {
            $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
            $documentName = $input['reference_no'] . '.' . $ext;
            $document->move('public/documents/delivery', $documentName);
            $input['file'] = $documentName;
        }
    	$lims_delivery_data->update($input);
        $lims_sale_data = Sale::find($lims_delivery_data->sale_id);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $message = 'Delivery updated successfully';
        // if($lims_customer_data->email && $input['status'] != 1){
        //     $mail_data['email'] = $lims_customer_data->email;
        //     $mail_data['customer'] = $lims_customer_data->name;
        //     $mail_data['sale_reference'] = $lims_sale_data->reference_no;
        //     $mail_data['delivery_reference'] = $lims_delivery_data->reference_no;
        //     $mail_data['status'] = $input['status'];
        //     $mail_data['address'] = $input['address'];
        //     $mail_data['delivered_by'] = $input['delivered_by'];
        //     try{
        //         Mail::send( 'mail.delivery_details', $mail_data, function( $message ) use ($mail_data)
        //         {
        //             $message->to( $mail_data['email'] )->subject( 'Delivery Details' );
        //         });
        //     }
        //     catch(\Exception $e){
        //         $message = 'Delivery updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        //     }   
        // }
    	return redirect('delivery')->with('message', $message);
    }

    public function deleteBySelection(Request $request)
    {
        $delivery_id = $request['deliveryIdArray'];
        foreach ($delivery_id as $id) {
            $lims_delivery_data = Delivery::find($id);
            $lims_delivery_data->delete();
        }
        return 'Delivery deleted successfully';
    }

    public function delete($id)
    {
    	$lims_delivery_data = Delivery::find($id);
    	$lims_delivery_data->delete();
    	return redirect('delivery')->with('not_permitted', 'Delivery deleted successfully');
    }
}
