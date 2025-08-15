<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
        $query = Customer::query();

        if ($request->input('include') === 'orders') {
            $query->with('orders');
        }

        return response()->json($query->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name'  => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:customers,email'],
        ]);

        $customer = Customer::create($data);

        return response()->json($customer, 201);
    }

    public function show(Request $request, $id)
    {
        $query = Customer::query();

        if ($request->input('include') === 'orders') {
            $query->with('orders');
        }

        $customer = $query->findOrFail($id);

        return response()->json($customer);
    }

    public function update(Request $request, $id)
    {
        $customer = Customer::findOrFail($id);

        $data = $request->validate([
            'name'  => ['sometimes', 'string', 'max:255'],
            'email' => [
                'sometimes', 'email', 'max:255',
                Rule::unique('customers', 'email')->ignore($customer->id)
            ],
        ]);

        $customer->update($data);

        return response()->json($customer);
    }

    public function destroy($id)
    {
        $customer = Customer::findOrFail($id);
        $customer->delete();

        return response()->noContent(); // 204
    }
}
