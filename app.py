from flask import Flask, render_template_string
import yaml

app = Flask(__name__)

@app.route('/')
def hello():
    return "This is a placeholder application to demonstrate supply-chain vulnerabilities."

# @app.route('/unsafe')
# def unsafe():
#     # This route demonstrates potential security vulnerabilities
#     user_input = request.args.get('input', '')
    
#     # Unsafe YAML loading (potential RCE)
#     yaml_data = yaml.load(user_input)
    
#     # Unsafe template rendering (potential XSS)
#     template = f"&lt;h1&gt;Hello, {user_input}!&lt;/h1&gt;"
#     return render_template_string(template)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')