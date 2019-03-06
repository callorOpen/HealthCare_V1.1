<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천운동 목록</title>
<style>
  	
	#div-sports {
		margin: 0px auto; 
		padding-top: 35px;
		display: flex;
		flex-direction: column;
		width: 100%;
		border: 3px solid #ccc;
		height: 750px;
		overflow: auto;
	}
	
	#view-kcal {
		flex: 2
		width: 450px;
		margin: 0px auto;
	}
	
	#for-center-div {
		flex: 8
		width: 450px;
		margin: 0px auto;
	}
	
	#sports-ptag {
		font-size: 13pt;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#btn-submit").click(function(){
		var kg = ${WEIGHT}
		var kcal = ${OVERKCAL}
		var num = $("#activitylist").val()
		
		$.ajax({
			url:"<c:url value='/sports_AJAX' />",
			method: "POST",
			data:{kG:kg,kCAL:kcal,num:num},
			success:function(result){
				$(".workspace").text(result)
			},
			error:function(){
				
			}
		})
	})
})
</script>
<div id="div-sports">
	<div id="view-kcal">
		<p>하루 권장칼로리 : ${STANDKCAL}</p>
		<p>하루동안 먹은칼로리 : ${TOTALKCAL}</p>
		<p>오버된 칼로리 : ${OVERKCAL}</p>
	</div>
	<div id="for-center-div">
		<form action="activity_list" method="POST">
			<fieldset id="activity">
				<label for="activitylist">운동목록</label>
					<select id="activitylist"  name="activitylist">
						<option value="0">걷기</option>
						<option value="1">등산</option>
						<option value="2">싸이클</option>
						<option value="3">훌라후프</option>
						<option value="4">자전거</option>
						<option value="5">줄넘기</option>
						<option value="6">달리기</option>
						<option value="7">윗몸일으키기</option>
						<option value="8">스쿼트</option>
						<option value="9">런닝머신</option>
						<option value="10">요가</option>
						<option value="11">계단</option>
					</select><br />
					
					<label></label>
					
				<button type="button" id="btn-submit" class="button-submit">확인</button>
				<button type="button" id="btn-reset" class="button-reset">취소</button>
			</fieldset>
		</form>
	</div>
	<div class="">
		<p class="workspace"></p>
	</div>
</div>
