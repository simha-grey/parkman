<?php

use Parkman\App\ParkmanRoute;
use PHPUnit\Framework\TestCase;
class ParkmanTestCase extends TestCase
{
    protected $app;
    public function setUp():void
    {
        $this->app = (new ParkmanRoute())->get();
    }
    public function testParkmanGet() {
        $reqFactory = new \Slim\Psr7\Factory\RequestFactory();
        $request = $reqFactory->createRequest('GET', '/');
        $response = $this->app->handle($request);
        $this->assertSame($response->getStatusCode(), 200);
        $this->assertSame((string)$response->getBody(), "Hello world!");
    }
}