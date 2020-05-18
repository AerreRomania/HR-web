<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Right navigation -->
<button type="button" class="right-toggle" onclick="rgtForce()">
	<span class="bullet one"></span>
	<span class="bullet two"></span>
	<span class="bullet three"></span>
</button>
<div class="user">
	<img src="${pageContext.request.contextPath}/dashboard/images/user-demo.png" alt="icon">
	<span>Carlo Alberto della Siega</span>
	<a href="#" class="btn btn-wire">Logout</a>
</div>
<nav class="user-navi">
	<ul>
		<li>
			<a href="#">Il mio profilo</a>
		</li>
		<li>
			<a href="#">Impostazioni</a>
		</li>
		<li>
			<a href="#">Contatta l'assistenza</a>
		</li>
		<li>
			<a href="#">Preferenze</a>
		</li>
	</ul>
</nav>
<footer>
	<small>© 2017 ONLYOU </small>
	<nav class="footer-navi">
		<ul>
			<li>
				<a href="#">Termini e Condizioni</a>
			</li>
			<li>
				<a href="#">Policy</a>
			</li>
			<li>
				<a href="#">Cookie</a>
			</li>
		</ul>
	</nav>
</footer>