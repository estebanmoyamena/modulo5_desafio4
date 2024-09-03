<%@page import="java.util.List"%>
<%@page import="model.Habitacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="business.HabitacionBusiness"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Librerias Requeridas
    HabitacionBusiness eventob = new HabitacionBusiness();

// listado de Habitaciones
    List<Habitacion> listaHabitacion = eventob.gethabitaciones();
%>

<!DOCTYPE html>
<html>
<%@ include file="assets/html/head.jsp"%>


<body>


    <%@include file="assets/html/header.jsp"%>


    <%@include file="assets/html/footer.jsp"%>

    <form method="post" action="proceso.jsp">

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">

                <div class="row justify-content-center">
                    <h1>
                        Habitaciones Disponibles (<%=listaHabitacion.size()%>)
                    </h1>
                    <hr/>
                </div>

                <div
                        class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <%
                        for (int x = 0; x < listaHabitacion.size(); x++) {
                    %>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top"
                                 src="<%=listaHabitacion.get(x).getImagen()%>"
                                 alt="<%=listaHabitacion.get(x).getNombre()%>" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder"><%=listaHabitacion.get(x).getNombre()%></h5>
                                    <p><%=listaHabitacion.get(x).getDescripcion()%></p>
                                    CL$
                                    <%=listaHabitacion.get(x).getPrecio()%>
                                </div>
                            </div>
                            <input type="radio" id="html" name="idhabitacion"
                                   value="<%=listaHabitacion.get(x).getId()%>" checked>  
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">

                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>

                </div>
            </div>
        </section>

        <!--  Formulario -->
        <section>

            <div class="container px-4 px-lg-5 mt-5">

                <h1>Información de Reserva Habitación</h1>
                <hr />

                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="nombre" class="form-label">Nombre</label> <input
                            type="text" class="form-control" id="nombre" name="nombre"
                            value="Arturo Erasmo">
                    </div>
                    <div class="col-md-6">
                        <label for="apellido" class="form-label">Apellido</label> <input
                            type="text" class="form-control" id="apellido" name="apellido"
                            value="Vidal Pardo">
                    </div>

                    <div class="col-md-6">
                        <label for="email" class="form-label">email</label> <input
                            type="text" class="form-control" id="email" name="email"
                            value="arturo.vidal@anfp.cl">
                    </div>

                    <div class="col-md-2">
                        <label for="medio_pago" class="form-label">Medio de pago</label>
                        <select id="medio_pago" name="medio_pago" class="form-select">
                            <option value="Debito"> Debito</option>
                            <option value="Credito"> Credito </option>
                            <option value="Transferencias"> Transferencias</option>

                        </select>
                    </div>

                    <div class="col-md-2">
                        <label for="dias" class="form-label">Días
                        </label>
                            <select id="dias" name="dias" class="form-select">
                            <%
                            for (int x = 0; x < 31; x++) {
                             %>
                            <option value="<%=x + 1%>"><%=x + 1%> Días(s)
                             </option>
                            <%
                                }
                            %>
                            </select>
                    </div>

                    <div class="col-md-2">
                        <label for="fecha_entrada" class="form-label">Fecha de entrada</label>
                        <input
                            type="date" class="form-select" id="fecha_entrada" name="fecha_entrada"
                            value="">
                    </div>

                    <div class="col-12">
                        <hr />
                        <button type="submit" class="btn btn-primary">Enviar
                            Solicitud de Compra</button>
                    </div>
                </div>

            </div>

        </section>

        <br>  </br>

    </form>
</body>

</html>