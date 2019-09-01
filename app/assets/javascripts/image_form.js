//= require turbolinks
$(function() {
  var dropzone = $(".upload-box__dropbox__container__frame__explain");
  var preview = $("#preview");

  var images = [];
  var new_image_files = [];

  $(".upload-box__dropbox").on("change", 'input[type= "file"]#upload-image', function() {
    var file = $(this).prop("files")[0];
    new_image_files.push(file);
    var reader = new FileReader();

    var img = $(`<div class="add_img">
                  <div class="img_area">
                    <img class="image">
                  </div>
                </div>`);
    var btn_wrapper = $(`<div class="btn_wrapper">
                          <a class="btn_delete">全削除</a>
                        </div>`);
    img.append(btn_wrapper);


    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });
    };
    reader.readAsDataURL(file);
    images.push(img);

    if (images.length <= 5) {
      $("#preview").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      });
    }
  })

  $(".upload-box__dropbox").on("click", ".btn_delete", function() {

    var target_image = $(this).parent().parent();
    var target_image_num = target_image.data("image");

    target_image.remove();
    images.splice(target_image_num, 1);
    new_image_files.splice(target_image_num, 1);

    if(images.length == 0) {
      $('input[type= "file"]#upload-image').attr({
        "data-image": 0
      })
    }
    if (images.length <= 5) {
      $("#preview").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      })
    }
  })

  $(".new_images").on("submit", function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    if (new_image_files.length == 0) {
      formData.append("new_images[images][]", " ");
    } else {
      new_image_files.forEach(function(file) {
        formData.append("new_images[images][]", file);
      });
    }
    $.ajax({
      url:         "/shares",
      type:        "POST",
      data:        formData,
      contentType: false,
      processData: false,
    })
    // return false;
  });
});