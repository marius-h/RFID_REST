package de.einfachpunkt.demo.controllers

import de.einfachpunkt.demo.models.Group
import de.einfachpunkt.demo.models.Lock
import de.einfachpunkt.demo.models.User
import org.springframework.data.domain.Example
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.web.bind.annotation.*
import javax.websocket.server.PathParam

interface UserRepository : JpaRepository<User, Int>

interface LockRepository : JpaRepository<Lock, Int>

interface GroupRepository: JpaRepository<Group, Int>

interface UserGroupRepository : JpaRepository<Int, Int>

@RestController
@RequestMapping(value = ["/user"])
class UserController(val userRepository: UserRepository) {

	@GetMapping(value = ["/all"])
	fun getAll(): List<User> = userRepository.findAll()

	@GetMapping(value = ["/{id}"])
	fun getUser(@PathVariable id: Int) = userRepository.findById(id)

	@GetMapping(value = ["/key/{key}"])
	fun getUser(@PathVariable key: String): User? {
		val users = userRepository.findAll()
		for (u in users) {
			if (u.password != null && u.password == key) {
				return u
			}
		}
		return null
	}

	@PostMapping(value = ["/"])
	fun addUser(@RequestBody user: User) = userRepository.save(user)

	@DeleteMapping(value = ["/{id}"])
	fun deleteUser(@PathVariable id: Int) = userRepository.deleteById(id)

	@PutMapping(value = ["/{id}"])
	fun updateUser(@PathVariable id: Int, @RequestBody user: User): User {
		val toUpdate: User = userRepository.findById(id).orElseThrow { Exception("server error") }
		toUpdate.firstname = user.firstname
		toUpdate.lastname = user.lastname
		toUpdate.mail = user.mail
		toUpdate.password = user.password
		return userRepository.save(toUpdate)
	}

	// TODO doorid und key durch parameter ersetzen
	@GetMapping(value = ["/open"])
	fun open(): String {
		val doorid = 1
		val key = "3843be5f-b5db-4517-9efe-7d1b5cbae0d9"

		val user = getUser(key)

		if (user != null) {
			val userid = user.iduser!!

			if (groupHasAccess(userid, doorid)) return "true"
			if (userHasAccess(userid)) return "true"
		}

		return "false"
	}

	fun groupHasAccess(userid: Int, lockid: Int) : Boolean {
		/*
		TODO
		1. In welcher Gruppe ist der User?
		2. Für welche Locks hat die Gruppe Zugang?
		3. Wenn die Gruppe Zugang auf die Lock hat, öffne Tür => return true
		 */
		return false
	}


	fun userHasAccess(userid: Int) : Boolean {
		/*
		TODO
		1. Für welche Locks hat der User Zugang?
		3. Wenn der User Zugang auf die Lock hat, öffne Tür => return true
		 */
		return false
	}
}