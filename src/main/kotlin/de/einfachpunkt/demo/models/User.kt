package de.einfachpunkt.demo.models

import java.io.Serializable
import javax.persistence.*

@Entity
@Table(name = "user")
data class User(@Id @GeneratedValue(strategy = GenerationType.AUTO) var iduser: Int? = 0,
				@Column(nullable = false) var surname: String? = null,
				@Column(nullable = false) var lastname: String? = null,
				@Column(nullable = false) var mail: String? = null,
				@Column(nullable = false) var password: String? = null) : Serializable {
	protected constructor() : this(iduser = null, surname = null, lastname = null, mail = null, password = null)
}