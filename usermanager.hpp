// UserManager.h
#ifndef USERMANAGER_H
#define USERMANAGER_H

#include <QMap>
#include <QDebug>
#include <QObject>
#include <QString>

class UserManager : public QObject {
    Q_OBJECT
public:
    explicit UserManager(QObject *parent = nullptr);

    Q_INVOKABLE bool registerUser(const QString &username, const QString &password);
    Q_INVOKABLE bool loginUser(const QString &username, const QString &password);

private:
    QMap<QString, QString> registeredUsers;
};

#endif // USERMANAGER_H
