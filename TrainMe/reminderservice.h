#ifndef REMINDERSERVICE_H
#define REMINDERSERVICE_H

#include <QTime>
#include <QList>
#include <QPair>

class ReminderService
{
public:
	typedef QList<QPair<QTime, bool>> ReminderList;

	inline virtual ~ReminderService() {}

	virtual void addReminder(const QTime &time, bool intense) = 0;
	virtual void removeReminder(const QTime &time) = 0;

	virtual ReminderList listReminders() = 0;
};

#endif // REMINDERSERVICE_H