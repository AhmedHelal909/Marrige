<?php


use Illuminate\Support\Facades\Auth;

use Illuminate\Support\Facades\Route;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;


Auth::routes();



Route::group(['middleware' => ['guest']], function () {
    Route::get('/', function () {
        return view('auth.login');
    });


});


Route::group(
    [
        'prefix'     => LaravelLocalization::setLocale(),
        'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath'],
    ],
    function () {


        Route::get('/dashboard/home','HomeController@index')->name('dashboard.home');
        Route::prefix('dashboard')->namespace('Dashboard')->middleware(['auth'])->name('dashboard.')->group(function () {

         
          Route::resource('users', 'UserController');
          Route::resource('roles', 'RoleController');
          Route::resource('husbands', 'HusbandController');
        



        });

    });

Route::get('/home', 'HomeController@index')->name('home');
