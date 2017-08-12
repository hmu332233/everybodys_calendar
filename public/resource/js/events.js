
$(document).ready(function () {

  // initCalendar();
	
  $('#search').click(function () {
    alert('test');
    $.ajax({
      method: "GET",
      url: `/calendars/1/events/hash_tags/테스트, 감자튀김`,
      dataType : "json",
      contentType: "application/json; charset=utf-8",
      success: function(data){
        alert("success");
        for(var i in data){
          var event = data[i];
          console.log(event);
          event.url = `/events/${event.id}`
        }
        updateEvents(data);
      },
      error: function(){
        alert("fail");
      }
    });   
  });

  // 편집 종료
  $('#close').click(function () {
    if(confirm('편집을 종료하시겠습니까?')) {
      /* 편집 종료 구현 */
	  $('#editorzone').css('display','none');
    }
  });
});


//달력 초기화
function initCalendar(_calendar_id){
  $.ajax({
    method: "GET",
    url: `/calendars/${_calendar_id}/events`,
    dataType : "json",
    contentType: "application/json; charset=utf-8",
    success: function(data){
      // alert("success");
      for(var i in data){
        var event = data[i];
        console.log(event);
        event.url = `/events/${event.id}`
      }
      setCalendar(data);
    },
    error: function(){
      alert("fail");
    }
  });   
};

//달력 셋팅
function setCalendar(data){
  $('#calendar').fullCalendar({
  	dayClick: function() {
		alert('a day has been clicked!');
	},
  // 	defaultDate: '2014-11-12',
  	lang: 'ko',
  	editable: true,
    events: data
  });
};

//이벤트 
function updateEvents(data){
  // $('#calendar').html('');
  // setCalendar(data);
  $('#calendar').fullCalendar( 'removeEvents' );
  $('#calendar').fullCalendar( 'addEventSource', data );
  // $('#calendar').fullCalendar( 
  //   'refetchEventSources', 
  //   data 
  // );
};