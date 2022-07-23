i=2
while (( $i < 42 ))
do
    echo json/$i.json
    image=`cat json/$i.json| jq .image | tr -d \"`
    image_filename=`basename $image`
    echo $image
    curl $image > images/$image_filename
    video=`cat json/$i.json| jq .animation_url | tr -d \"`
    video_filename=`basename $video`
    echo $video
    curl $video > videos/$video_filename
    i=$((i+1))
done

