<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription Patient | eSanté+</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap');

        * {
            font-family: 'Inter', sans-serif;
        }

        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .gradient-text {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .input-focus {
            transition: all 0.3s ease;
        }

        .input-focus:focus {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.2);
        }

        .fade-in {
            animation: fadeIn 0.8s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .radio-custom:checked + label {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-color: #667eea;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-purple-50 via-white to-indigo-50 min-h-screen">

<!-- Navbar -->
<nav class="bg-white/80 backdrop-blur-lg shadow-sm fixed w-full z-50 fade-in">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <a href="<%= request.getContextPath() %>/" class="flex items-center space-x-3">
                <div class="w-12 h-12 gradient-bg rounded-xl flex items-center justify-center">
                    <i class="fas fa-heartbeat text-white text-2xl"></i>
                </div>
                <span class="text-3xl font-bold gradient-text">eSanté+</span>
            </a>

            <div class="flex items-center space-x-4">
                <span class="text-gray-600">Déjà inscrit ?</span>
                <a href="<%= request.getContextPath() %>/login" class="text-purple-600 hover:text-purple-700 font-semibold transition">
                    Se Connecter
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="min-h-screen flex items-center justify-center px-4 sm:px-6 lg:px-8 pt-28 pb-12">
    <div class="max-w-4xl w-full">

        <!-- Header -->
        <div class="text-center mb-8 fade-in">
            <div class="inline-flex items-center justify-center w-20 h-20 gradient-bg rounded-2xl mb-4">
                <i class="fas fa-user-plus text-white text-3xl"></i>
            </div>
            <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-3">
                Créer un <span class="gradient-text">Compte Patient</span>
            </h1>
            <p class="text-gray-600 text-lg">
                Rejoignez eSanté+ et gérez vos rendez-vous médicaux facilement
            </p>
        </div>

        <!-- Registration Form -->
        <div class="bg-white rounded-3xl shadow-2xl p-8 md:p-12 fade-in">

            <!-- Error Message -->
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null && !errorMessage.isEmpty()) {
            %>
            <div class="mb-6 bg-red-50 border-l-4 border-red-500 p-4 rounded-lg">
                <div class="flex items-center">
                    <i class="fas fa-exclamation-circle text-red-500 mr-3"></i>
                    <p class="text-red-700 font-medium"><%= errorMessage %></p>
                </div>
            </div>
            <% } %>

            <form action="<%= request.getContextPath() %>/register" method="post" class="space-y-6">

                <!-- Section: Informations Personnelles -->
                <div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4 flex items-center">
                        <i class="fas fa-user text-purple-600 mr-3"></i>
                        Informations Personnelles
                    </h3>

                    <div class="grid md:grid-cols-2 gap-6">
                        <!-- Nom Complet -->
                        <div>
                            <label for="nom" class="block text-sm font-semibold text-gray-700 mb-2">
                                Nom Complet <span class="text-red-500">*</span>
                            </label>
                            <input
                                    type="text"
                                    id="nom"
                                    name="nom"
                                    required
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                    placeholder="Jean Dupont"
                            >
                        </div>

                        <!-- CIN -->
                        <div>
                            <label for="cin" class="block text-sm font-semibold text-gray-700 mb-2">
                                CIN (Carte d'Identité)
                            </label>
                            <input
                                    type="text"
                                    id="cin"
                                    name="CIN"
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                    placeholder="AB123456"
                            >
                        </div>

                        <!-- Date de Naissance -->
                        <div>
                            <label for="naissance" class="block text-sm font-semibold text-gray-700 mb-2">
                                Date de Naissance
                            </label>
                            <input
                                    type="date"
                                    id="naissance"
                                    name="naissance"
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                            >
                        </div>

                        <!-- Groupe Sanguin -->
                        <div>
                            <label for="sang" class="block text-sm font-semibold text-gray-700 mb-2">
                                Groupe Sanguin
                            </label>
                            <select
                                    id="sang"
                                    name="sang"
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                            >
                                <option value="">-- Sélectionnez --</option>
                                <option value="O_POSITIVE">O+</option>
                                <option value="O_NEGATIVE">O-</option>
                                <option value="A_POSITIVE">A+</option>
                                <option value="A_NEGATIVE">A-</option>
                                <option value="B_POSITIVE">B+</option>
                                <option value="B_NEGATIVE">B-</option>
                                <option value="AB_POSITIVE">AB+</option>
                                <option value="AB_NEGATIVE">AB-</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Sexe -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-3">
                        Sexe
                    </label>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <input
                                    type="radio"
                                    id="sexe_homme"
                                    name="sexe"
                                    value="Homme"
                                    class="hidden radio-custom"
                            >
                            <label
                                    for="sexe_homme"
                                    class="flex items-center justify-center space-x-3 px-6 py-4 border-2 border-gray-200 rounded-xl cursor-pointer transition hover:border-purple-300 hover:bg-purple-50"
                            >
                                <i class="fas fa-mars text-2xl"></i>
                                <span class="font-semibold">Homme</span>
                            </label>
                        </div>
                        <div>
                            <input
                                    type="radio"
                                    id="sexe_femme"
                                    name="sexe"
                                    value="Femme"
                                    class="hidden radio-custom"
                            >
                            <label
                                    for="sexe_femme"
                                    class="flex items-center justify-center space-x-3 px-6 py-4 border-2 border-gray-200 rounded-xl cursor-pointer transition hover:border-purple-300 hover:bg-purple-50"
                            >
                                <i class="fas fa-venus text-2xl"></i>
                                <span class="font-semibold">Femme</span>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Section: Coordonnées -->
                <div class="pt-6 border-t border-gray-200">
                    <h3 class="text-xl font-bold text-gray-900 mb-4 flex items-center">
                        <i class="fas fa-address-card text-purple-600 mr-3"></i>
                        Coordonnées
                    </h3>

                    <div class="grid md:grid-cols-2 gap-6">
                        <!-- Email -->
                        <div>
                            <label for="email" class="block text-sm font-semibold text-gray-700 mb-2">
                                Adresse Email <span class="text-red-500">*</span>
                            </label>
                            <input
                                    type="email"
                                    id="email"
                                    name="email"
                                    required
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                    placeholder="email@exemple.com"
                            >
                        </div>

                        <!-- Téléphone -->
                        <div>
                            <label for="telephone" class="block text-sm font-semibold text-gray-700 mb-2">
                                Numéro de Téléphone
                            </label>
                            <input
                                    type="tel"
                                    id="telephone"
                                    name="Tel"
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                    placeholder="+212 6XX XXX XXX"
                            >
                        </div>

                        <!-- Adresse -->
                        <div class="md:col-span-2">
                            <label for="adresse" class="block text-sm font-semibold text-gray-700 mb-2">
                                Adresse Complète
                            </label>
                            <input
                                    type="text"
                                    id="adresse"
                                    name="Adresse"
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                    placeholder="123 Rue Exemple, Ville, Code Postal"
                            >
                        </div>
                    </div>
                </div>

                <!-- Section: Sécurité -->
                <div class="pt-6 border-t border-gray-200">
                    <h3 class="text-xl font-bold text-gray-900 mb-4 flex items-center">
                        <i class="fas fa-lock text-purple-600 mr-3"></i>
                        Sécurité du Compte
                    </h3>

                    <div class="grid md:grid-cols-2 gap-6">
                        <!-- Mot de passe -->
                        <div>
                            <label for="password" class="block text-sm font-semibold text-gray-700 mb-2">
                                Mot de passe <span class="text-red-500">*</span>
                            </label>
                            <div class="relative">
                                <input
                                        type="password"
                                        id="password"
                                        name="password"
                                        required
                                        class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                        placeholder="••••••••"
                                >
                                <button
                                        type="button"
                                        onclick="togglePassword('password')"
                                        class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-purple-600 transition"
                                >
                                    <i class="fas fa-eye" id="toggleIcon1"></i>
                                </button>
                            </div>
                            <p class="text-xs text-gray-500 mt-2">
                                Minimum 8 caractères
                            </p>
                        </div>

                        <!-- Confirmer mot de passe -->
                        <div>
                            <label for="confirmPassword" class="block text-sm font-semibold text-gray-700 mb-2">
                                Confirmer le mot de passe <span class="text-red-500">*</span>
                            </label>
                            <div class="relative">
                                <input
                                        type="password"
                                        id="confirmPassword"
                                        name="confirmPassword"
                                        required
                                        class="w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition input-focus"
                                        placeholder="••••••••"
                                >
                                <button
                                        type="button"
                                        onclick="togglePassword('confirmPassword')"
                                        class="absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-purple-600 transition"
                                >
                                    <i class="fas fa-eye" id="toggleIcon2"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Terms and Conditions -->
                <div class="flex items-start space-x-3 pt-4">
                    <input
                            type="checkbox"
                            id="terms"
                            required
                            class="w-5 h-5 mt-1 text-purple-600 border-gray-300 rounded focus:ring-purple-500"
                    >
                    <label for="terms" class="text-sm text-gray-700">
                        J'accepte les <a href="#" class="text-purple-600 hover:text-purple-700 font-semibold">conditions d'utilisation</a>
                        et la <a href="#" class="text-purple-600 hover:text-purple-700 font-semibold">politique de confidentialité</a>
                        d'eSanté+ <span class="text-red-500">*</span>
                    </label>
                </div>

                <!-- Submit Button -->
                <button
                        type="submit"
                        class="w-full bg-gradient-to-r from-purple-600 to-indigo-600 text-white py-4 rounded-xl font-bold text-lg hover:shadow-xl hover:shadow-purple-500/50 transition transform hover:scale-105 flex items-center justify-center space-x-2"
                >
                    <span>Créer mon compte</span>
                    <i class="fas fa-user-check"></i>
                </button>

                <!-- Login Link -->
                <div class="text-center pt-4">
                    <p class="text-gray-600">
                        Vous avez déjà un compte ?
                        <a href="<%= request.getContextPath() %>/login" class="text-purple-600 hover:text-purple-700 font-bold transition">
                            Se connecter
                        </a>
                    </p>
                </div>
            </form>
        </div>

        <!-- Features -->
        <div class="grid md:grid-cols-3 gap-6 mt-8">
            <div class="bg-white/80 backdrop-blur-lg rounded-2xl p-6 text-center">
                <div class="w-12 h-12 gradient-bg rounded-xl flex items-center justify-center mx-auto mb-3">
                    <i class="fas fa-shield-alt text-white"></i>
                </div>
                <h4 class="font-semibold text-gray-900 mb-2">100% Sécurisé</h4>
                <p class="text-sm text-gray-600">Vos données sont protégées et cryptées</p>
            </div>

            <div class="bg-white/80 backdrop-blur-lg rounded-2xl p-6 text-center">
                <div class="w-12 h-12 gradient-bg rounded-xl flex items-center justify-center mx-auto mb-3">
                    <i class="fas fa-calendar-check text-white"></i>
                </div>
                <h4 class="font-semibold text-gray-900 mb-2">Rendez-vous Faciles</h4>
                <p class="text-sm text-gray-600">Prenez rendez-vous en quelques clics</p>
            </div>

            <div class="bg-white/80 backdrop-blur-lg rounded-2xl p-6 text-center">
                <div class="w-12 h-12 gradient-bg rounded-xl flex items-center justify-center mx-auto mb-3">
                    <i class="fas fa-headset text-white"></i>
                </div>
                <h4 class="font-semibold text-gray-900 mb-2">Support 24/7</h4>
                <p class="text-sm text-gray-600">Une équipe à votre écoute</p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-white border-t border-gray-100 py-6">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col md:flex-row justify-between items-center">
            <p class="text-gray-600 text-sm">© 2025 eSanté+. Tous droits réservés.</p>
            <div class="flex space-x-6 mt-4 md:mt-0">
                <a href="#" class="text-gray-500 hover:text-purple-600 text-sm transition">Confidentialité</a>
                <a href="#" class="text-gray-500 hover:text-purple-600 text-sm transition">Conditions</a>
                <a href="#" class="text-gray-500 hover:text-purple-600 text-sm transition">Aide</a>
            </div>
        </div>
    </div>
</footer>

<script>
    function togglePassword(fieldId) {
        const passwordField = document.getElementById(fieldId);
        const toggleIcon = document.getElementById(fieldId === 'password' ? 'toggleIcon1' : 'toggleIcon2');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }

    // Validation du formulaire
    document.querySelector('form').addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            e.preventDefault();
            alert('Les mots de passe ne correspondent pas !');
            return false;
        }

        if (password.length < 8) {
            e.preventDefault();
            alert('Le mot de passe doit contenir au moins 8 caractères !');
            return false;
        }
    });
</script>

</body>
</html>