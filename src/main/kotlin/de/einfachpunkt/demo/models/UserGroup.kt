package de.einfachpunkt.demo.models

import java.io.Serializable
import javax.persistence.*

@Entity
@Table(name = "user_has_group")
data class UserGroup(@Id @Column(nullable = false) var user: Int? = null,
					 @Id @Column(nullable = false) var group: Int? = null) : Serializable {
	protected constructor() : this(user = null, group = null)
}