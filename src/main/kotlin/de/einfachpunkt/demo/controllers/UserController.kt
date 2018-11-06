package de.einfachpunkt.demo.controllers

import de.einfachpunkt.demo.models.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.config.annotation.EnableWebMvc

interface UserRepository : JpaRepository<User, Int>

@RestController
@RequestMapping(value = ["/user"])
@EnableWebMvc
class UserController(val userRepository: UserRepository) {

	@GetMapping(value = ["/"])
	fun getAll(): List<User> = userRepository.findAll()

	@GetMapping(value = ["/{id}"])
	fun getUser(@PathVariable id: Int) = userRepository.findById(id)

	@PostMapping(value = ["/"])
	fun addUser(@RequestBody user: User) = userRepository.save(user)

	@DeleteMapping(value = ["/{id}"])
	fun deleteUser(@PathVariable id: Int) = userRepository.deleteById(id)

	@PutMapping(value = ["/{id}"])
	fun updateUser(@PathVariable id: Int, @RequestBody user: User): User {
		val toUpdate: User = userRepository.findById(id).orElseThrow { Exception("server error") }
		toUpdate.surname = user.surname
		toUpdate.lastname = user.lastname
		toUpdate.mail = user.mail
		toUpdate.password = user.password
		return userRepository.save(toUpdate)
	}
}