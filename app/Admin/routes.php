<?php

use Illuminate\Routing\Router;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Route;

Admin::routes();

Route::group([
    'prefix' => config('admin.route.prefix'),
    'namespace' => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
    'as' => config('admin.route.prefix') . '.',
], function (Router $router) {
    $router->get('/', 'HomeController@index')->name('home');
});

Route::group([
    'prefix' => config('admin.route_dashboard.prefix'),
    'namespace' => config('admin.route_dashboard.namespace'),
    'middleware' => config('admin.route_dashboard.middleware'),
    'as' => config('admin.route_dashboard.prefix') . '.',
], function (Router $router) {
    $router->get('/', 'HomeController@index')->name('home');
});
