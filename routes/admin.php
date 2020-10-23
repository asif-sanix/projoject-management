<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function() {
    return redirect()->route('admin.login.form');
    //return view('admin.dashboard');
});

Route::group(['middleware' => 'admin.guest', 'as' => 'admin.'], function() {
    Route::get('login', 'Auth\LoginController@showLoginForm')->name('login.form');
    Route::post('login', 'Auth\LoginController@login')->name('login.post');

    Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
    Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail');

    Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
    Route::post('password/reset', 'Auth\ResetPasswordController@reset')->name('password.request');

    Route::get('new-password/{id}', 'Auth\ResetPasswordController@newPasswordForm')->name('password.newPassword');

    Route::post('password/set-password/{id}', 'Auth\ResetPasswordController@sepPassword')->name('password.setPassword');

   
});





Route::group(['middleware' => 'admin','as' => 'admin.'], function() { 


    Route::get('logout', 'Auth\LoginController@logout')->name('logout.get');
    Route::post('logout', 'Auth\LoginController@logout')->name('logout.post');
    

    Route::get('dashboard', 'DashboardController@index')->name('dashboard.index')->middleware('can:browse_dashboard');



    Route::get('bread', 'BreadController@index')->name('bread.index');
    Route::get('bread/create', 'BreadController@create')->name('bread.create');
    Route::get('bread/{slug}/edit', 'BreadController@edit')->name('bread.edit');
    Route::put('bread/{bread}/update', 'BreadController@update')->name('bread.update');
    Route::delete('bread/{slug}/delete', 'BreadController@destroy')->name('bread.destroy');
    Route::post('bread', 'BreadController@store')->name('bread.store');


    Route::get('role', 'RoleController@index')->name('role.index');
    Route::get('role/create', 'RoleController@create')->name('role.create');
    Route::get('role/{role}/edit', 'RoleController@edit')->name('role.edit');
    Route::post('role', 'RoleController@store')->name('role.store');
    Route::put('role/{role}', 'RoleController@update')->name('role.update');


    Route::get('menu', 'MenuController@index')->name('menu.index');
    Route::get('menu/create', 'MenuController@create')->name('menu.create');
    Route::get('menu/{menu}/edit', 'MenuController@edit')->name('menu.edit');
    Route::post('menu', 'MenuController@store')->name('menu.store');
    Route::put('menu/{menu}', 'MenuController@update')->name('menu.update');
    Route::delete('menu/{menu}', 'MenuController@destroy')->name('menu.destroy');

    Route::get('setting', 'MenuController@index')->name('setting.index');
    Route::get('site-setting', 'SiteSettingController@index')->name('site-setting.index')->middleware('can:browse_site_setting');

});