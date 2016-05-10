<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="tem">
		<div class="tems">
			<div class="temm">
				<strong>天气预报</strong>
			</div>
			<div class="teml">
				<iframe width="800" scrolling="no" height="120" float="right"
					frameborder="0" allowtransparency="true"
					src="http://i.tianqi.com/index.php?c=code&id=19&icon=1&temp=1&num=3"></iframe>
			</div>
		</div>

		<form action="message_submit" method="post">
			<div class="mess">
				<h5>Message:</h5>
				<br>
				<textarea id="message" name="message"
					placeholder="Write down your message bytengxing"></textarea>

				<input type="button" class="submit" id="buttons" value="OK" />

			</div>
		</form>
	</div>