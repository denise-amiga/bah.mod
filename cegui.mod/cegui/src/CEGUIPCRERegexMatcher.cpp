/***********************************************************************
    filename:   CEGUIPCRERegexMatcher.cpp
    created:    Mon Jul 27 2009
    author:     Paul D Turner <paul@cegui.org.uk>
*************************************************************************/
/***************************************************************************
 *   Copyright (C) 2004 - 2009 Paul D Turner & The CEGUI Development Team
 *
 *   Permission is hereby granted, free of charge, to any person obtaining
 *   a copy of this software and associated documentation files (the
 *   "Software"), to deal in the Software without restriction, including
 *   without limitation the rights to use, copy, modify, merge, publish,
 *   distribute, sublicense, and/or sell copies of the Software, and to
 *   permit persons to whom the Software is furnished to do so, subject to
 *   the following conditions:
 *
 *   The above copyright notice and this permission notice shall be
 *   included in all copies or substantial portions of the Software.
 *
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 *   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 *   IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *   OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 *   ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 *   OTHER DEALINGS IN THE SOFTWARE.
 ***************************************************************************/
#include "CEGUIPCRERegexMatcher.h"
#include "CEGUIExceptions.h"

// Start of CEGUI namespace section
namespace CEGUI
{
//----------------------------------------------------------------------------//
PCRERegexMatcher::PCRERegexMatcher() :
    d_regex(0)
{
}

//----------------------------------------------------------------------------//
PCRERegexMatcher::~PCRERegexMatcher()
{
    release();
}

//----------------------------------------------------------------------------//
void PCRERegexMatcher::setRegexString(const String& regex)
{
    // release old regex string.
    release();
    d_string.clear();
    // try to compile this new regex string
    const char* prce_error;
    int pcre_erroff;
    d_regex = pcre16_compile(regex.data16(), PCRE_UTF16,
                           &prce_error, &pcre_erroff, 0);

    // handle failure
    if (!d_regex)
        CEGUI_THROW(InvalidRequestException("PCRERegexMatcher::setRegexString: "
            "Bad RegEx set: '" + regex + "'.  Additional Information: " +
            prce_error));

    // set this last so that upon failure object is in consistant state.
    d_string = regex;
}

//----------------------------------------------------------------------------//
const String& PCRERegexMatcher::getRegexString() const
{
    return d_string;
}

//----------------------------------------------------------------------------//
bool PCRERegexMatcher::matchRegex(const String& str) const
{
    // if the regex is not valid, then an exception is thrown
    if (!d_regex)
        CEGUI_THROW(InvalidRequestException("PCRERegexMatcher::matchRegex: "
            "Attempt to use invalid RegEx '" + d_string + "'."));

    int match[3];
	int len = 0;
    const uint16* utf16_str = str.data16(&len);
    //const int len = static_cast<int>(strlen(utf16_str));
    const int result = pcre16_exec(d_regex, 0, utf16_str, len, 0, 0, match, 3);

    // a match must be for the entire string
    if (result >= 0)
        return (match[1] - match[0] == len);
    // no match found or if test string or regex is 0
    else if ((result == PCRE_ERROR_NOMATCH) || (result == PCRE_ERROR_NULL))
        return false;
    // anything else is an error
    else
        CEGUI_THROW(InvalidRequestException("PCRERegexMatcher::matchRegex: "
            "An internal error occurred while attempting to match the RegEx '" +
            d_string + "'."));
}

//----------------------------------------------------------------------------//
void PCRERegexMatcher::release()
{
    if (d_regex)
    {
        pcre16_free(d_regex);
        d_regex = 0;
    }
}

} // End of  CEGUI namespace section
