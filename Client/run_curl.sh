while true; do
    curl -4  10.0.1.20:8000;
    sleep 2;
    echo "";
    echo "--`date`--";
done
