<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style type="text/css">
.blue {
	background: #3379FE;
}

.red {
	background: #FF0000;
}

.green {
	background: #008000;
}
.button {
	color: #ffffff;
	font-size: 1.2em;
	padding: 0.3em 0.5em;
	margin-right: 0.1em;
}
</style>
<body>
	<section id="blog" class="blog">
		<div class="container aos-init aos-animate" data-aos="fade-up">
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8 entries">
					<article class="entry">
						<h2 class="entry-title">
							<a>${list.title}</a>
						</h2>

						<div class="entry-meta">
							<ul>
								<li class="d-flex align-items-center"><i
									class="icofont-user"></i>${list.id}</li>
								<li class="d-flex align-items-center"><i
									class="icofont-wall-clock"></i>${list.regtime}</li>
								<li class="d-flex align-items-center"><i
									class="icofont-comment"></i> notice ${list.no}</li>
							</ul>
						</div>

						<div class="entry-content">
							<br>
							<p>${list.content}</p>
						</div>

					</article>
				</div>
				<div class="col-lg-4"></div>
			</div>
			<div class="form-group" align="center">
				<c:if test="${userDto != null}">
					<a href="${root}/notice/mvmodify?no=${list.no}" class="button blue">수정</a>
					<a href="${root}/notice/delete?no=${list.no}" class="button red">삭제</a>
				</c:if>
				<a href="${root}/notice/list?pg=1" class="button green">목록</a>
			</div>
		</div>
	</section>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>