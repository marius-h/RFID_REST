package de.einfachpunkt.demo.models

import java.io.Serializable
import javax.persistence.*

@Entity
@Table(name = "lock_has_user")
data class LockUser(@Id @Column(nullable = false) var lock: Int? = null,
					@Id @Column(nullable = false) var user: Int? = null) : Serializable {
	protected constructor() : this(lock = null, user = null)
}