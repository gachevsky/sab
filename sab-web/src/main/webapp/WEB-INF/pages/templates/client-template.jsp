<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script id="mainClientsView-Template" type="text/template">
<div class="tabbable" id="clientsMainView">
	<ul class="nav nav-tabs container-fluid" id="tabHeaders">
		<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
	</ul>
	<div class="tab-content container-fluid tab-dashboard-content" id="tabContent">
		<div class="tab-pane active container-fluid" id="home">
		
      <!-- Create Dashboard Modal Form -->
		  <div id="createClientModal" class="modal hide fade" tabindex="-1" role="dialog" 
            aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-header">
		      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		      <h3 id="myModalLabel">Crear Nuevo Cliente</h3>
		    </div>
            <form>
		      <div class="modal-body">
                <fieldset>
                  <label>Nombre <span class="required">*</span> </label>
                    <input id="ClientName" type="text">
                  <label>Descripcion</label>
                    <textarea id="ClientDescription" placeholder="short description" rows="3"></textarea>
			      <label>Direccion</label>
                    <input id="Address" type="text">
				  <label>NIT</label>
                    <input id="Nit" type="text">
				  <label>Contacto</label>
                    <input id="ContactName" type="text">
				  <label>Telefonos</label>
                    <input id="Phone" type="text">
                </fieldset>
              </div>
            </form>

		    <div class="modal-footer">
		      <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
		      <button id="btnCreateClient" class="btn btn-primary">Crear</button>
		    </div>
		  </div>

		  <h1>Clientes</h1>
		  <hr/>
		  <div class="container" id="ClientsListContainer">
		  </div>
		</div>
	</div>
</div>
</script>

<script id="clientsListView-Template" type="text/template">
		<table class="table">
		    <thead>
		      <tr>
		        <th>Nombre</th>
		        <th>Descripcion</th>
				<th>Contacto</th>
                <th>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createClientModal"><i class="icon-plus"></i></button>
                </th>
		      </tr>
		    </thead>
		    <tbody>
		      <?
		      if(clients!==null && clients.length>0){ _.each(clients, function(item) { ?>
		        <tr>
		          <td><?= item.get('name') ?></td>
		          <td><?= item.get('description') ?></td>
				  <td><?= item.get('contactName') ?></td>
		          <td>
		            <div>
		              <button type="button" id="Load_<?= item.get('name').split(' ').join('_') ?>" data-dashboard-id="<?= item.id ?>" 
		                  class="btn btn-small btn-primary btnLoad">Cargar</button>
		              <button type="button" id="Delete_<?= item.get('name').split(' ').join('_') ?>" data-dashboard-id="<?= item.id ?>" 
		                  class="btn btn-small btn-danger btnDelete">Borrar</button>
		            </div>
		          </td>
		        </tr>
		      <?
		       }); } 
                else { ?>
                <tr>
		          <td colspan="4">No hay clientes registrados</td>
                </tr>
              <? } ?>
		    </tbody>
		  </table>
      <div id="confirmDelete"></div>
</script>