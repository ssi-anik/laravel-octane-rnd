<?php

namespace App\Console\Commands;

use Anik\Amqp\ConsumableMessage;
use Anik\Laravel\Amqp\Facades\Amqp;
use Illuminate\Console\Command;

class Consumer extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:consumer';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        while(true) {
            Amqp::consume(function(ConsumableMessage $message) {
                var_dump($message->getMessageBody());
                $message->ack();
            });
        }
    }
}
