<!-- PHP scripts -->
<? include('php/index.php') ?>

<!DOCTYPE html>
<html lang="en">
<head>

	<title>localhost - 127.0.0.1</title>
	<meta charset="utf-8" />

	<meta http-equiv="X-UA-Compatible" content="chrome=1" />
	<meta name="title" content="Draft" />
	<meta name="description" content="Just the localhost site link reference." />

	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

     <style>

        body {

            font-size: 1.6em;

            background-color:  #f5f5f5;
        }

        li {

            list-style: none;

            float: left;

            margin: 10px;

            border: 1px solid #333;
            padding: 5px;
            background-color: #f2f2f2;
        }


        a {

            text-decoration: none;

            color: #3311ff;

            transition: all 1sec ease-in-out;
        }


        a:hover{ text-decoration: underline; }


    </style>


</head>
<body>

    <div>

        <p>Current Projects:</p>

        <ul>

            <?foreach( $paths as $link ):?>

                <li>
                    <a href="http://<?=$link?>"><?=$link?></a>
                </li>

            <?endforeach?>

        </ul>

    </div>

</body>
</html>
