<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="/final/css/mypage.css">
	</head>
	<body>
		<c:set var="content" value="${content}"></c:set>
		<c:if test="${content == 0 }">
			<div class="conts-container plan">
				<div class="bigHeader">여행일정</div>
				<div class="conts-box-list">
				     <div class="inner-box">
				     <c:forEach var="schedule" items="${list}" begin="0" end="1">
				     	<div class="plan-contents">
						    <a href="/plan/5af6eeb7a7245a0c" target="_blank">
						        <div class="cover-img">
						            <img src="https://thumb-wishbeen.akamaized.net/6nOka6tz7O2cenpDTHEUzawJXPo=/390x150/smart/img-wishbeen.akamaized.net/plan/1462948625627_cover.jpg" alt="">
						            <div class="cover-bg"></div>
						            <div class="tit">
						                <p>${schedule.schedule_subject}</p>
						                <div class="desc">
						                    <span>제주도</span>
						                    <span>3일</span>
						                    <span>여행 후</span>
						                </div>
						            </div>
						        </div>
						    </a>
						</div>
				     </c:forEach>
					 <div class="clear"></div>
					 <div class="clear"></div>
				    </div>
				</div>
			</div>
			<div class="conts-container plan">
				<div class="bigHeader">여행스토리</div>
				<div class="conts-box-list">
				     <div class="inner-box">
				     <c:forEach var="schedule" items="${list}" begin="0" end="1">
						<div class="plan-contents">
						    <a href="/plan/5af6eeb7a7245a0c" target="_blank">
						        <div class="cover-img">
						            <img src="https://thumb-wishbeen.akamaized.net/wIq3GQVktTNYGxfQsrX7Ce92D_A=/390x150/smart/img-wishbeen.akamaized.net/plan/1411550254627_%EC%9C%84%EC%8B%9C%EB%B9%88_%ED%94%BD_%ED%8C%8C%EB%A6%AC2.jpg" alt="">
						            <div class="cover-bg"></div>
						            <div class="tit">
						                <p>${schedule.schedule_subject}</p>
						                <div class="desc">
						                    <span>한국</span>
						                    <span>1일</span>
						                    <span>여행 전</span>
						                </div>
						            </div>
						        </div>
						    </a>
						</div>
					</c:forEach>
						<div class="clear"></div>
						<div class="clear"></div>
				     </div>
				</div>
			</div>
		</c:if>
		<c:if test="${content == 1 }">
			<div class="conts-container plan">
				<div class="bigHeader">여행일정</div>
				<div class="conts-box-list">
				     <div class="inner-box">
				     <c:forEach var="schedule" items="${list}" begin="0" end="3">
						<div class="plan-contents">
						    <a href="/plan/5af6eeb7a7245a0c" target="_blank">
						        <div class="cover-img">
						            <img src="https://thumb-wishbeen.akamaized.net/wIq3GQVktTNYGxfQsrX7Ce92D_A=/390x150/smart/img-wishbeen.akamaized.net/plan/1411550254627_%EC%9C%84%EC%8B%9C%EB%B9%88_%ED%94%BD_%ED%8C%8C%EB%A6%AC2.jpg" alt="">
						            <div class="cover-bg"></div>
						            <div class="tit">
						                <p>${schedule.schedule_subject}</p>
						                <div class="desc">
						                    <span>한국</span>
						                    <span>1일</span>
						                    <span>여행 전</span>
						                </div>
						            </div>
						        </div>
						    </a>
						</div>
					</c:forEach>
						<div class="clear"></div>
						<div class="clear"></div>
				     </div>
				</div>
			</div>
		</c:if>
		<c:if test="${content == 2}">
			<div class="conts-container plan">
				<div class="bigHeader">여행스토리</div>
				<div class="conts-box-list">
				     <div class="inner-box">
				     <c:forEach var="schedule" items="${list}" begin="0" end="3">
						<div class="plan-contents">
						    <a href="/plan/5af6eeb7a7245a0c" target="_blank">
						        <div class="cover-img">
						            <img src="https://thumb-wishbeen.akamaized.net/wIq3GQVktTNYGxfQsrX7Ce92D_A=/390x150/smart/img-wishbeen.akamaized.net/plan/1411550254627_%EC%9C%84%EC%8B%9C%EB%B9%88_%ED%94%BD_%ED%8C%8C%EB%A6%AC2.jpg" alt="">
						            <div class="cover-bg"></div>
						            <div class="tit">
						                <p>${schedule.schedule_subject}</p>
						                <div class="desc">
						                    <span>한국</span>
						                    <span>1일</span>
						                    <span>여행 전</span>
						                </div>
						            </div>
						        </div>
						    </a>
						</div>
					</c:forEach>
						<div class="clear"></div>
						<div class="clear"></div>
				     </div>
				</div>
			</div>
		</c:if>
		<c:if test="${content == 3 }">
			<div class="conts-container plan">
				<div class="bigHeader">받은 댓글 목록</div>
				<div class="conts-box-list">
				     <div class="inner-box">
				     <c:forEach var="schedule" items="${list}" begin="0" end="3">
						<div class="plan-contents">
						    <a href="/plan/5af6eeb7a7245a0c" target="_blank">
						        <div class="cover-img">
						            <img src="https://thumb-wishbeen.akamaized.net/wIq3GQVktTNYGxfQsrX7Ce92D_A=/390x150/smart/img-wishbeen.akamaized.net/plan/1411550254627_%EC%9C%84%EC%8B%9C%EB%B9%88_%ED%94%BD_%ED%8C%8C%EB%A6%AC2.jpg" alt="">
						            <div class="cover-bg"></div>
						            <div class="tit">
						                <p>${schedule.schedule_subject}</p>
						                <div class="desc">
						                    <span>한국</span>
						                    <span>1일</span>
						                    <span>여행 전</span>
						                </div>
						            </div>
						        </div>
						    </a>
						</div>
					</c:forEach>
						<div class="clear"></div>
						<div class="clear"></div>
				     </div>
				</div>
			</div>
		</c:if>
	</body>
</html>