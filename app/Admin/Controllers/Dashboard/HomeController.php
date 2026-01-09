<?php

namespace App\Admin\Controllers\Dashboard;

use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function index()
    {
        return view('dashboard.index');
    }
}