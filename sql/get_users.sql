select ut.user_type_id, u.user_id, u.first_name, u.last_name from tvp.users as u
inner join tvp.users_type as ut
on u.user_type_id = ut.user_type_id
where u.user_type_id = 1;