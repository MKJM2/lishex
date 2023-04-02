#ifndef MOVE_H_
#define MOVE_H_

/* Inspired by
** https://www.chessprogramming.org/Encoding_Moves
*/

class Move {
    Move (int from, int to);
    Move (int from, int to, int flags);

    unsigned short getTo() const;
    unsigned short getFrom() const;
    unsigned short getFlags() const;
    //bool isCapture() const;

    void setTo(unsigned int to);
    void setFrom(unsigned int from);

    void operator=(Move& other);
    bool operator==(Move a) const;
    bool operator!=(Move a) const;

    unsigned short asShort() const;
protected:
    unsigned short move;
};

#endif // MOVE_H_
