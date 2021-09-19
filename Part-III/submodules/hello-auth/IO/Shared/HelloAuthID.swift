//
//  HelloAuthID.swift
//  HelloAuth
//
//  Created by Boardy on 6/1/21.
//
//

import Boardy

public enum HelloAuthID {
    /// Login & Register
    public static let authenticate: BoardID = .pubAuthenticate

    /// Get current logged in user
    public static let currentUser: BoardID = .pubCurrentUser

    /// Logout
    public static let logout: BoardID = .pubLogout

    /// Get current user, If not logged in, login required
    public static let signOnUser: BoardID = .pubSignOnUser
}
