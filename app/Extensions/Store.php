<?php

namespace App\Extensions;

class Store
{
    public array $items = [];

    public function store(mixed $value, ?string $key = null): void
    {
        if (!is_null($key)) {
            $this->items[$key] = $value;
        } else {
            $this->items[] = $value;
        }
    }
}
