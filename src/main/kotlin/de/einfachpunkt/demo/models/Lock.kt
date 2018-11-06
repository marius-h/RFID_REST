package de.einfachpunkt.demo.models

import java.io.Serializable
import javax.persistence.*

@Entity
@Table(name = "lock")
data class Lock(@Id @GeneratedValue(strategy = GenerationType.AUTO) var idlock: Int? = 0,
				@Column(nullable = false) var key: String? = null,
				@Column(nullable = false) var room: String? = null,
				@Column(nullable = false) var failed_counter: Int? = 0) : Serializable {
	protected constructor() : this(idlock = null, key = null, room = null, failed_counter = null)
}