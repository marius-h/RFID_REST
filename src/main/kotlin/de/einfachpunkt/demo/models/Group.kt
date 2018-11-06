package de.einfachpunkt.demo.models

import java.io.Serializable
import javax.persistence.*

@Entity
@Table(name = "group")
data class Group(@Id @GeneratedValue(strategy = GenerationType.AUTO) var idgroup: Int? = 0,
				@Column(nullable = false) var name: String? = null,
				@Column(nullable = false) var desc: String? = null) : Serializable {
	protected constructor() : this(idgroup = null, name = null, desc = null)
}