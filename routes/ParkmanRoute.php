<?php
namespace Parkman\App;
use App\Models\Db;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use Slim\Factory\AppFactory;
class ParkmanRoute
{
    /**
    * Stores an instance of the Slim application.
    *
    * @var \Slim\App
    */
    private $app;
    public function __construct() {
        $app = AppFactory::create();

        $app->get('/', function (Request $request, Response $response, $args) {
            $response->getBody()->write("Hello world!");
            return $response;
        });

        $app->get('/owners/all', function (Request $request, Response $response) {
            $sql = "SELECT * FROM owners";

            try {
                $db = new Db();
                $conn = $db->connect();
                $stmt = $conn->query($sql);
                $owners = $stmt->fetchAll(\PDO::FETCH_OBJ);
                $db = null;

                $response->getBody()->write(json_encode($owners));
                return $response
                    ->withHeader('content-type', 'application/json')
                    ->withStatus(200);
            } catch (\PDOException $e) {
                $error = array(
                    "message" => $e->getMessage()
                );

                $response->getBody()->write(json_encode($error));
                return $response
                    ->withHeader('content-type', 'application/json')
                    ->withStatus(500);
            }
        });
        $app->get('/garages/all', function (Request $request, Response $response) {
            $sql = "SELECT
                        garages.id garage_id,
                        garages.name,
                        price hourly_price,
                        currencies.name currency,
                        email contact_email,
                        CONCAT_WS(' ',latitude,longitude) as point,
                        countries.name as country,
                        owner_id,
                        owners.name garage_owner
                    FROM garages
                    INNER JOIN countries on countries.id = garages.country_id
                    INNER JOIN currencies ON garages.currency_id = currencies.id
                    INNER JOIN owners ON owners.id = garages.owner_id";

            try {
                $db = new Db();
                $conn = $db->connect();
                $stmt = $conn->query($sql);
                $garages = $stmt->fetchAll(\PDO::FETCH_OBJ);
                $db = null;

                $response->getBody()->write(json_encode($garages));
                return $response
                    ->withHeader('content-type', 'application/json')
                    ->withStatus(200);
            } catch (\PDOException $e) {
                $error = array(
                    "message" => $e->getMessage()
                );

                $response->getBody()->write(json_encode($error));
                return $response
                    ->withHeader('content-type', 'application/json')
                    ->withStatus(500);
            }
        });
        $this->app = $app;
    }
    /**
     * Get an instance of the application.
     *
     * @return \Slim\App
     */
    public function get()
    {
        return $this->app;
    }
}