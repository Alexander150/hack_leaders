import { getContext } from 'svelte';

const server_url = getContext('server_url');

let headers = {
	'Accept': 'application/json',
    'Content-Type': 'application/json'
};

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