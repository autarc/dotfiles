<? #PHP decleration

    // ToDo: Ausgabe welches zuletzt bearbeite, anordnung in der Reihenfolge

    function getDirs($dir){

        $dirs = array();
        $entries = scandir($dir);

        foreach( $entries as $entry ) {

            if ( !is_dir($entry) ) {

                $dirs[] = $entry . '.dev';
            }
        }

        return $dirs;
    }

    $paths = getDirs('../sites/');

