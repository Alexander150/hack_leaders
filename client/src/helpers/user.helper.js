import { getContext } from 'svelte';
import { user_store } from '../stores/user.store.js';
import Cookies from 'js-cookie';

export function getUser(d) {

	fetch(`${d.server_url}auto_login/`, {
		method: "GET",
		headers: d.headers
	}).then(response => {
		if (response.ok)
			return response.json();
		else
			return {'error': 'Возникла ошибка при загрузке данных'}
	}).then(data => {
		if (!data.error)
			user_store.update(state => data);
		else {
			alert("Возникла ошибка! ");
		}
	});

}

export function tokenizeHeaders(headers) {
	headers['Authorization'] = `Bearer ${Cookies.get('token')}`;
	return headers;
}