#include "usermanager.hpp"

UserManager::UserManager(QObject *parent) : QObject(parent) { }

bool UserManager::registerUser(const QString &username, const QString &password) {
    if (registeredUsers.contains(username)) {
        qDebug() << "User already exists";
        return false;
    }

    registeredUsers.insert(username, password);
    qDebug() << "User registered:" << username;
    return true;
}

bool UserManager::loginUser(const QString &username, const QString &password) {
    if (registeredUsers.value(username) == password) {
        qDebug() << "Login successful!";
        return true;
    }

    qDebug() << "Invalid username or password";
    return false;
}
