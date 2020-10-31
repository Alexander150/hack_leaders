import { getContext } from 'svelte';
import Cookies from 'js-cookie';

const server_url = getContext('server_url');

export function getUser() {


	// let response = await fetch(`${server_url}user/`, {
	// 	method: "GET",
	// 	headers: headers
	// });
	// if (response.ok) {
	// 	let result = await response.json();
	// 	if (token in result) {
	// 		Cookies.set('token', result.token);
	// 		user_store.update(result.user);
	// 		return;
	// 	}
	// }

	return false;

}

export function tokenizeHeaders(headers) {
	headers['Authorization'] = `Bearer ${Cookies.get('token')}`;
	return headers;
}