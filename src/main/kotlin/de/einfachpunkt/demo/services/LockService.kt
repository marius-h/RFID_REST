package de.einfachpunkt.demo.services

import de.einfachpunkt.demo.models.Lock
import org.springframework.data.repository.CrudRepository
import javax.transaction.Transactional

@Transactional
interface LockService : CrudRepository<Lock, String> {
	fun findById(id: Int): Lock?
}