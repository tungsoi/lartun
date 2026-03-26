<?php

namespace App\Admin\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\GlobalConfig;

class HomeController extends Controller
{
    public function index()
    {
        $configs = GlobalConfig::all()->pluck('value', 'code');
        return view('dashboard.index', compact(["configs"]));
    }
}