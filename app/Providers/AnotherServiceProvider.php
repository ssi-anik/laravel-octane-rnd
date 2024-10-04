<?php

namespace App\Providers;

use App\Extensions\Store;
use Carbon\Laravel\ServiceProvider;

class AnotherServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind(Store::class, fn ($app) => new Store());
    }
}
