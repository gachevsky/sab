<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/template" id="user-list-template">
  <h1> User Management </h1>
	<a href="#/administration/users/new" class="btn btn-primary">Add User</a>
	<hr />
	<table class="table striped">
		<thead>
			<tr>
				<th>Full Name</th>
				<th>Username</th>
				<th>Email</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<? _.each(users, function(user) { ?>
			<tr>
				<td><?= user.get('fullName') ?></td>
				<td><?= user.get('username') ?></td>
				<td><?= user.get('email') ?></td>
				<td>
          <a class="btn btn-warning" href="#/administration/users/edit/<?= user.id ?>">Edit</a>
          <button data-user-id="<?= user.id ?>" class="btn btn-danger deleteUser">Delete</button>
        </td>
			</tr>
			<? }); ?>
		</tbody>
	</table>
</script>

<script type="text/template" id="user-edit-template">
	<form class="user-edit-form">
	  <legend><?= user ? 'Edit' : 'New' ?> User</legend>
	    <label>Full Name</label>
	    <input name="fullName" id="UserFullName" type="text" value="<?= user ? user.get('fullName') : '' ?>">
	    <label>Username</label>
	    <input name="username" id="UserUsername" type="text" value="<?= user ? user.get('username') : '' ?>">
	    <label>Email</label>
	    <input name="email" id="UserEmail" type="text" value="<?= user ? user.get('email') : '' ?>">
      <label>Password</label>
      <input type="password" id="UserPassword" name="password" <?= user ? 'value=\"*****\" disabled' : '' ?>/>
	    <hr />
	   <button type="submit" class="btn btn-primary"><?= user ? 'Update' : 'Create' ?></button>
     <a href="#/administration/users" class="btn">Cancel</a>
	   <? if(user) { ?>
	    <input type="hidden" name="id" value="<?= user.id ?>" />
	    <button type="button" data-user-id="<?= user.id ?>" class="btn btn-danger delete">Delete</button>
	   <? }; ?>
	</form>
</script>