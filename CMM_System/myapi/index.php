<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';
require 'db.php';
$app = new \Slim\App;

// API #0 root doc
$app->get('/', function (Request $request, Response $response, array $args) {
    $response->getBody()->write("Hello there from root");
    return $response;
});

// API GET #1-all user
$app->get('/user', function (Request $request, Response $response, array $args) {
    // $response->getBody()->write("get all user");
    // return $response;
    $sql = "SELECT * FROM user";

    try {
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->query($sql);
        $user = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($user);
    } catch (PDOException $e) {
        $data = array(
            "status" => "fail"
        );
        echo json_encode($data);
    }
});

// API GET #2-single user
$app->get('/user/{id}', function (Request $request, Response $response, array $args) {
    $id = $args['id'];
    // $response->getBody()->write("get single user based on id=$id");
    // return $response;
    $sql = "SELECT * FROM user WHERE id = $id";

    try {
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->query($sql);
        $user = $stmt->fetch(PDO::FETCH_OBJ);
        $db = null;
        echo json_encode($user);
    } catch (PDOException $e) {
        $data = array(
            "status" => "fail"
        );
        echo json_encode($data);
    }
});

// API #3 POST
$app->post('/user', function (Request $request, Response $response, array $args) {
    // $allPostPutVars = $request->getParsedBody();
    // $name = $_POST["name"];
    // $id = $allPostPutVars['id'];
    // $email = $allPostPutVars['email'];
    // $post = $allPostPutVars['post'];

    $name = $_POST["name"];
    $role = $_POST["role"];
    $matricNum = $_POST["matricNum"];
    $icNum = $_POST["icNum"];
    $merit = $_POST["merit"];
    $progid = $_POST["progid"];

    // $inputJSON = file_get_contents('php://input');
    // $input = json_decode($inputJSON, TRUE);
    // $name = $input["name"];
    // $id = $input["id"];
    // $email = $input["email"];
    // $post = $input["post"];

    // $inputJSON = file_get_contents('php://input');
    // $input = json_decode($inputJSON, TRUE);
    // $name = $input["name"];
    // $id = $input["id"];
    // $email = $input["email"];
    // $post = $input["post"];

    try {
        $sql = "INSERT INTO merit (name,role,matricNum,icNum,merit,progid) VALUES (:name,:role,:matricNum,:icNum,:merit,:progid)";
        $db = new db();
        // Connect
        $db = $db->connect();
        $stmt = $db->prepare($sql);
        $stmt->bindValue(':name', $name);
        $stmt->bindValue(':role', $role);
        $stmt->bindValue(':matricNum', $matricNum);
        $stmt->bindValue(':icNum', $icNum);
        $stmt->bindValue(':merit', $merit);
        $stmt->bindValue(':progid', $progid);
    
        $stmt->execute();
        $count = $stmt->rowCount();
        $db = null;
    
        $data = array(
            "status" => "success",
            "rowcount" =>$count
        );
        echo json_encode($data);
    } catch (PDOException $e) {
        $data = array(
            "status" => "fail"
        );
        echo json_encode($data);
    }
});

// API #4 UPDATE
//guna la json
$app->put('/user/{id}', function (Request $request, Response $response, array $args) {
    $id = $args['id'];
    // $id = $_POST["id"];
    // $response->getBody()->write("api to update a user with id=$id");
    // return $response;
    // $id = $args["id"];
    
    // $name = $_POST["name"];
    // $email = $_POST["email"];
    // $post = $_POST["post"];


    $inputJSON = file_get_contents('php://input');
    $input = json_decode($inputJSON, TRUE);
    $name = $input["name"];
    $email = $input["email"];
    $post = $input["post"];

    $sql = "UPDATE user SET
				name 	= :name,
                email		= :email,
                post 	= :post
			WHERE id = $id";

    try {
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->prepare($sql);

        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':post', $post);

        $stmt->execute();
        $count = $stmt->rowCount();

        $data = array(
            "rowAffected" => $count,
            "status" => "success"
        );
        echo json_encode($data);
    } catch (PDOException $e) {
        $data = array(
            "status" => "fail"
        );
        echo json_encode($data);
    }
});

// API #5 DELETE
$app->delete('/user/{id}', function (Request $request, Response $response, array $args) {
    $id = $args['id'];
    // $response->getBody()->write("api to delete a user with id=$id");
    // return $response;

    $sql = "DELETE FROM user WHERE id = $id";

    try {
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->prepare($sql);
        $stmt->execute();
        $count = $stmt->rowCount();

        $db = null;
        $data = array(
            "rowAffected" => $count,
            "status" => "success"
        );
        echo json_encode($data);
    } catch (PDOException $e) {
        $data = array(
            "status" => "fail"
        );
        echo json_encode($data);
    }
});

$app->run();
