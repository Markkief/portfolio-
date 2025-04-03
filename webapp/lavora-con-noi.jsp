<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<title>CasaNova - Lavora con noi</title>
<%@ include file="css.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<%@ include file="navbar.jsp" %>

<% String errore = request.getParameter("errore"); %>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card shadow-sm border-0">
                <div class="card-body p-4 p-md-5">
                    <div class="text-center mb-5">
                        <h1 class="h2 mb-3">Lavora con noi</h1>
                        <p class="text-muted">Unisciti al nostro team e contribuisci a rendere CasaNova ancora migliore</p>
                    </div>

                    <% if (errore != null) { %>
                        <div class="alert alert-danger">
                            <i class="bi bi-exclamation-triangle me-2"></i>Errore: credenziali non valide!
                        </div>
                    <% } %>

                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-4">
                            <div class="card customcard">
                                <h3 class="text-center py-3">Admin</h3>
                                <div class="img">
                                    <img src="https://img.freepik.com/free-vector/admin-concept-illustration_114360-2332.jpg?w=740&t=st=1695598793~exp=1695599393~hmac=acf112d57735534bd9cd0feb382e414555d160dbee35754e13efd865cc92ac60" class="card-img-top" alt="Admin">
                                </div>
                                <div class="card-body">
                                  <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem consequatur, repudiandae eum quasi commodi placeat expedita reiciendis tenetur quia quaerat libero dolorem blanditiis reprehenderit aliquam molestias modi. Cum, exercitationem ratione.</p>
                                </div>
                              </div>
                        </div>
                        <div class="col-2"></div>
                        <div class="col-4">
                            <div class="card customcard">
                                <h3 class="text-center py-3">Revisor</h3>
                                <div class="img">
                                    <img src="https://img.freepik.com/free-vector/audit-service-assistance-financial-report-bookkeeping-analysis-company-finances-management-financier-making-corporate-expenses-assessment_335657-2317.jpg?w=740&t=st=1695599648~exp=1695600248~hmac=c41ad8ee4174ecfb1382610c7376dcf887420dbdcb429ab2a38aaad7053cd553" class="card-img-top" alt="Revisor">
                                </div>
                                <div class="card-body">
                                  <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem consequatur, repudiandae eum quasi commodi placeat expedita reiciendis tenetur quia quaerat libero dolorem blanditiis reprehenderit aliquam molestias modi. Cum, exercitationem ratione.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container mb-4">
    <div class="col-12">
        <div class=" p-3">
        <div class="row">
            <h2 class="text-center py-5">Candidati qui!</h2>
        </div>
        <form action="requestrole" method="post">
            <div class="form-group">
                <div class="mb-3">
                    <label class="form-label" for="username">Username</label>
                    <input class="form-control" type="text" name="username" id="username" placeholder="User1">
                </div>
                <div class="mb-3">
                    <label class="form-label" for="roles">Ruoli</label>
                    <select class="form-select" name="roles" id="roles">
                        <option value="ADMIN">Admin</option>
                        <option value="REVISOR">Revisor</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="user-description">Perchè dovremmo assumerti?</label>
                    <textarea class="form-control" name="message" id="user-description" rows="3" placeholder="Parlaci di te in questa sezione..."></textarea>
                </div>
                <div class="btn">
                    <button type="submit" class="btn btn-primary">Candidati</button>
                </div>
            </div>
        </form>
    </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
<%@ include file="js.jsp" %>
</body>
</html>
