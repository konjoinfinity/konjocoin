// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KONJOCOIN_QT_KONJOCOINADDRESSVALIDATOR_H
#define KONJOCOIN_QT_KONJOCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class KonjocoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit KonjocoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Konjocoin address widget validator, checks for a valid konjocoin address.
 */
class KonjocoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit KonjocoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // KONJOCOIN_QT_KONJOCOINADDRESSVALIDATOR_H
