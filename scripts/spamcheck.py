import sys
import subprocess

def check_spam(email_content):
    result = subprocess.run(
        ['spamc', '-d', 'spamassassin', '-p', '783'],
        input=email_content.encode('utf-8'),
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    output = result.stdout.decode('utf-8')
    return 'X-Spam-Flag: YES' in output

if __name__ == "__main__":
    content = sys.stdin.read()
    is_spam = check_spam(content)
    print("SPAM" if is_spam else "OK")
