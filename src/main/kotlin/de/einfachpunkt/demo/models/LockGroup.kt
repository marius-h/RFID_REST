package de.einfachpunkt.demo.models

import java.io.Serializable
import javax.persistence.*

@Entity
@Table(name = "lock_has_group")
data class LockGroup(@Id @Column(nullable = false) var lock: Int? = null,
					 @Id @Column(nullable = false) var group: Int? = null) : Serializable {
	protected constructor() : this(lock = null, group = null)
}