// 1. **Basic Syntax and Usage**: Regex patterns are enclosed between two forward slashes.
const regex = /hello/;
console.log(regex.test('hello world')); // true
console.log(regex.test('hi world'));    // false

// 2. **Matching Characters**: Regex allows matching specific characters.
const matchLetters = /[a-zA-Z]/; // Matches any letter
console.log('abc123'.match(matchLetters)); // ['a']

// 3. **Character Classes**: 
// - `\d`: matches any digit (0-9)
// - `\D`: matches any non-digit
// - `\w`: matches any word character (alphanumeric and underscore)
// - `\W`: matches any non-word character
// - `\s`: matches any whitespace character
// - `\S`: matches any non-whitespace character

const hasDigits = /\d+/;
console.log('abc123'.match(hasDigits)); // ['123']

const hasSpaces = /\s+/;
console.log('hello world'.match(hasSpaces)); // [' ']

// 4. **Anchors**: 
// - `^`: matches the beginning of the string
// - `$`: matches the end of the string

const startsWithHello = /^hello/;
console.log('hello world'.match(startsWithHello)); // ['hello']

const endsWithWorld = /world$/;
console.log('hello world'.match(endsWithWorld)); // ['world']

// 5. **Quantifiers**: Specify the number of times a pattern should be matched.
// - `*`: 0 or more
// - `+`: 1 or more
// - `?`: 0 or 1
// - `{n}`: exactly n times
// - `{n,}`: n or more
// - `{n,m}`: between n and m times

const oneOrMoreDigits = /\d+/;
console.log('123abc'.match(oneOrMoreDigits)); // ['123']

const threeDigits = /\d{3}/;
console.log('123abc'.match(threeDigits)); // ['123']

// 6. **Groups and Capturing**: Use parentheses to group patterns and capture matched parts.
const fullNameRegex = /(\w+)\s(\w+)/;
const result = 'John Doe'.match(fullNameRegex);
console.log(result); // ['John Doe', 'John', 'Doe']

// 7. **Non-Capturing Groups**: Use `(?:...)` to group patterns without capturing.
const nonCapturingGroup = /(?:\d{3})-\d{2}-\d{4}/;
console.log('123-45-6789'.match(nonCapturingGroup)); // ['123-45-6789']

// 8. **Alternation (OR)**: The pipe symbol `|` allows alternation between patterns.
const pattern = /cat|dog/;
console.log('I have a cat'.match(pattern)); // ['cat']
console.log('I have a dog'.match(pattern)); // ['dog']

// 9. **Global Flag (`g`)**: Match all occurrences in the string.
const allDigits = /\d+/g;
console.log('abc123def456'.match(allDigits)); // ['123', '456']

// 10. **Case Insensitivity (`i`)**: Match letters case-insensitively.
const caseInsensitive = /hello/i;
console.log('HELLO'.match(caseInsensitive)); // ['HELLO']

// 11. **Dot (.)**: The dot matches any character except newlines.
const matchAnyCharacter = /a.b/;
console.log('acb'.match(matchAnyCharacter)); // ['acb']

// 12. **Escape Sequences**: Escape special characters using backslashes.
const regexWithEscape = /\d\.\d/; // Matches "1.1" but not "11"
console.log('1.1'.match(regexWithEscape)); // ['1.1']

// 13. **Replacing with Regex**: Use `replace()` method with regular expressions.
const replaceSpaces = /\s+/g;
const resultString = 'hello    world'.replace(replaceSpaces, ' ');
console.log(resultString); // 'hello world'

// 14. **Lookahead**: Check for a pattern that is followed by another pattern.
const lookaheadRegex = /\d(?=\D)/;
console.log('123a'.match(lookaheadRegex)); // ['3']

// 15. **Lookbehind**: Check for a pattern that is preceded by another pattern.
const lookbehindRegex = /(?<=@)\w+/;
console.log('user@example.com'.match(lookbehindRegex)); // ['example']

// 16. **Flags Summary**:
// - `g`: Global search (match all occurrences)
// - `i`: Case-insensitive search
// - `m`: Multiline search
// - `s`: Dotall (allow `.` to match newline characters)
// - `u`: Unicode (for Unicode matching)
// - `y`: Sticky matching (matches only at the current position)

const multilineText = `hello
world`;

const multilineRegex = /^hello/m;
console.log(multilineText.match(multilineRegex)); // ['hello']

// 17. **Regex with String Methods**:
// - `match()`: Returns matched groups as an array.
// - `search()`: Returns the index of the first match.
// - `replace()`: Replaces matched text with a new value.
const str = 'The price is 500 dollars';

const found = str.match(/\d+/);
console.log(found); // ['500']

const position = str.search(/\d+/);
console.log(position); // 14 (index of the first match)

const newStr = str.replace(/\d+/, '1000');
console.log(newStr); // 'The price is 1000 dollars'
