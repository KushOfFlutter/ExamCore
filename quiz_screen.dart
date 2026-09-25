import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_pract/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});


  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

  class _QuizScreenState extends State<QuizScreen> {

  List<QuizScreen> buildQuiz(
    Map<String, List<QuizScreen>> bank,
    List<String> selectedSubjects,
  ) {
    final quiz = <QuizScreen>[];
    for (final subject in selectedSubjects) {
      final limit = subject.toLowerCase() == 'english' ? 60 : 40;
      final pool = List<QuizScreen>.from(bank[subject] ?? [])..shuffle();
      quiz.addAll(pool.take(limit));
    }
    return quiz;
  }

  int selectedMinutes = 20;

  // ================= QUESTION BANK =================


 final Map<String, List<Map<String, dynamic>>> questionBank = {
  "Physics":[
    {
      "id":"PHY001",
      "topic":"Units and Measurements",
      "question":"The SI unit of force is the ____.",
      "options":["Newton","Joule","Watt","Pascal"],
      "answer":"Newton"},
    {"id":"PHY002",
      "topic":"Motion - Kinematics",
      "question":"A body moving with uniform velocity has ____ acceleration.",
      "options":["Zero","Constant non-zero","Increasing","Decreasing"],
      "answer":"Zero"},
   {"id":"PHY003",
      "topic":"Forces and Dynamics",
      "question":"Newton's first law of motion is also known as the law of ____.",
      "options":["Inertia","Conservation of energy","Gravitation","Action and reaction"],
      "answer":"Inertia"},
   {"id":"PHY004",
      "topic":"Waves",
      "question":"The distance between two successive crests of a wave is called the ____.",
      "options":["Wavelength","Amplitude","Frequency","Period"],
      "answer":"Wavelength"},
{"id":"PHY005","topic":"Electricity - Current","question":"The SI unit of electric current is the ____.","options":["Ampere","Volt","Ohm","Coulomb"],"answer":"Ampere"},
{"id":"PHY006","topic":"Heat and Thermodynamics","question":"Heat always flows from a body of ____ temperature to one of ____ temperature.","options":["Higher; lower","Lower; higher","Equal; equal","Constant; variable"],"answer":"Higher; lower"},
{"id":"PHY007","topic":"Optics","question":"The image formed by a plane mirror is ____.","options":["Virtual, upright and same size","Real, inverted and magnified","Virtual, inverted and diminished","Real, upright and same size"],"answer":"Virtual, upright and same size"},
{"id":"PHY008","topic":"Units and Measurements","question":"Which instrument is used to measure the diameter of a small sphere accurately?","options":["Micrometer screw gauge","Metre rule","Tape rule","Protractor"],"answer":"Micrometer screw gauge"},
{"id":"PHY009","topic":"Motion - Kinematics","question":"A car accelerates uniformly from rest to 20 m/s in 4 seconds. Find its acceleration.","options":["5 m/s²","4 m/s²","80 m/s²","0.2 m/s²"],"answer":"5 m/s²"},
{"id":"PHY010","topic":"Forces and Dynamics","question":"The force of gravity acting on a body is called its ____.","options":["Weight","Mass","Density","Momentum"],"answer":"Weight"},
{"id":"PHY011","topic":"Electricity - Circuits","question":"In a series circuit, the current at every point is ____.","options":["The same","Different","Zero","Maximum at the source only"],"answer":"The same"},
{"id":"PHY012","topic":"Waves","question":"Sound waves are examples of ____ waves.","options":["Longitudinal","Transverse","Electromagnetic","Standing"],"answer":"Longitudinal"},
{"id":"PHY013","topic":"Heat and Thermodynamics","question":"The transfer of heat through a vacuum occurs by ____.","options":["Radiation","Conduction","Convection","Diffusion"],"answer":"Radiation"},
{"id":"PHY014","topic":"Energy and Work","question":"The SI unit of work done is the ____.","options":["Joule","Newton","Watt","Pascal"],"answer":"Joule"},
{"id":"PHY015","topic":"Optics","question":"A converging lens is also known as a ____ lens.","options":["Convex","Concave","Cylindrical","Plane"],"answer":"Convex"},
{"id":"PHY016","topic":"Magnetism","question":"Like magnetic poles ____ each other.","options":["Repel","Attract","Neutralize","Have no effect on"],"answer":"Repel"},
{"id":"PHY017","topic":"Motion - Kinematics","question":"Find the distance covered by a body moving at a constant speed of 15 m/s for 6 seconds.","options":["90 m","21 m","2.5 m","9 m"],"answer":"90 m"},
{"id":"PHY018","topic":"Forces and Dynamics","question":"According to Newton's third law, for every action there is an equal and opposite ____.","options":["Reaction","Force","Momentum","Motion"],"answer":"Reaction"},
{"id":"PHY019","topic":"Units and Measurements","question":"Which of the following is a fundamental (base) quantity?","options":["Mass","Speed","Force","Energy"],"answer":"Mass"},
{"id":"PHY020","topic":"Electricity - Ohm's Law","question":"According to Ohm's law, V = IR. If I = 2A and R = 5Ω, find V.","options":["10 V","2.5 V","7 V","3 V"],"answer":"10 V"},
{"id":"PHY021","topic":"Waves","question":"The number of complete waves passing a point per second is called the wave's ____.","options":["Frequency","Wavelength","Amplitude","Speed"],"answer":"Frequency"},
{"id":"PHY022","topic":"Heat and Thermodynamics","question":"The temperature at which water boils at standard atmospheric pressure is ____.","options":["100°C","0°C","273°C","50°C"],"answer":"100°C"},
{"id":"PHY023","topic":"Energy and Work","question":"Kinetic energy is the energy possessed by a body due to its ____.","options":["Motion","Position","Mass alone","Temperature"],"answer":"Motion"},
{"id":"PHY024","topic":"Optics","question":"The bending of light as it passes from one medium to another is called ____.","options":["Refraction","Reflection","Diffraction","Dispersion"],"answer":"Refraction"},
{"id":"PHY025","topic":"Magnetism","question":"A material that can be strongly magnetized is called ____.","options":["Ferromagnetic","Diamagnetic","Paramagnetic","Non-magnetic"],"answer":"Ferromagnetic"},
{"id":"PHY026","topic":"Motion - Projectile","question":"A projectile launched horizontally undergoes ____ motion vertically.","options":["Free fall (uniform acceleration)","Uniform velocity","Zero acceleration","Circular motion"],"answer":"Free fall (uniform acceleration)"},
{"id":"PHY027","topic":"Forces and Dynamics","question":"Momentum is defined as the product of ____.","options":["Mass and velocity","Mass and acceleration","Force and distance","Force and time squared"],"answer":"Mass and velocity"},
{"id":"PHY028","topic":"Units and Measurements","question":"Which of the following is an example of a scalar quantity?","options":["Speed","Velocity","Displacement","Force"],"answer":"Speed"},
{"id":"PHY029","topic":"Electricity - Circuits","question":"In a parallel circuit, the voltage across each branch is ____.","options":["The same","Different","Zero","Additive"],"answer":"The same"},
{"id":"PHY030","topic":"Waves","question":"Which of the following is NOT a property common to all waves?","options":["Mass","Reflection","Refraction","Diffraction"],"answer":"Mass"},
{"id":"PHY031","topic":"Heat and Thermodynamics","question":"The amount of heat needed to raise the temperature of 1kg of a substance by 1°C is called its ____.","options":["Specific heat capacity","Latent heat","Thermal conductivity","Heat capacity"],"answer":"Specific heat capacity"},
{"id":"PHY032","topic":"Energy and Work","question":"The law of conservation of energy states that energy can neither be created nor ____.","options":["Destroyed","Transferred","Measured","Divided"],"answer":"Destroyed"},
{"id":"PHY033","topic":"Optics","question":"The focal length of a concave mirror is ____ its radius of curvature.","options":["Half","Twice","Equal to","One-third of"],"answer":"Half"},
{"id":"PHY034","topic":"Magnetism","question":"The region around a magnet where its magnetic force can be detected is called the magnetic ____.","options":["Field","Pole","Axis","Line"],"answer":"Field"},
{"id":"PHY035","topic":"Motion - Kinematics","question":"A body starting from rest attains a velocity of 30 m/s after accelerating at 5 m/s². Find the time taken.","options":["6 s","5 s","150 s","0.17 s"],"answer":"6 s"},
{"id":"PHY036","topic":"Forces and Dynamics","question":"The tendency of a body to resist changes in its state of motion is called ____.","options":["Inertia","Momentum","Weight","Friction"],"answer":"Inertia"},
{"id":"PHY037","topic":"Units and Measurements","question":"Which of the following instruments is used to measure time intervals?","options":["Stopwatch","Thermometer","Barometer","Ammeter"],"answer":"Stopwatch"},
{"id":"PHY038","topic":"Electricity - Ohm's Law","question":"The resistance of a wire is 10Ω when the current is 0.5A. Find the voltage.","options":["5 V","20 V","10.5 V","0.05 V"],"answer":"5 V"},
{"id":"PHY039","topic":"Waves","question":"The maximum displacement of a wave from its rest position is called its ____.","options":["Amplitude","Wavelength","Period","Frequency"],"answer":"Amplitude"},
{"id":"PHY040","topic":"Heat and Thermodynamics","question":"The process by which a liquid changes to a gas below its boiling point is called ____.","options":["Evaporation","Condensation","Sublimation","Fusion"],"answer":"Evaporation"},
{"id":"PHY041","topic":"Energy and Work","question":"Power is defined as the rate of doing ____.","options":["Work","Force","Mass","Distance"],"answer":"Work"},
{"id":"PHY042","topic":"Optics","question":"A ray of light passing through the centre of curvature of a concave mirror is reflected ____.","options":["Along the same path","At 90°","Parallel to the axis","Through the focus"],"answer":"Along the same path"},
{"id":"PHY043","topic":"Magnetism","question":"Which of the following materials cannot be magnetized?","options":["Wood","Iron","Nickel","Cobalt"],"answer":"Wood"},
{"id":"PHY044","topic":"Motion - Circular Motion","question":"The force that keeps a body moving in a circular path is called ____ force.","options":["Centripetal","Centrifugal","Frictional","Gravitational"],"answer":"Centripetal"},
{"id":"PHY045","topic":"Forces and Dynamics","question":"Which of the following is an example of a contact force?","options":["Friction","Gravitational force","Magnetic force","Electrostatic force"],"answer":"Friction"},
{"id":"PHY046","topic":"Units and Measurements","question":"Which of these is a derived unit?","options":["Newton","Metre","Kilogram","Second"],"answer":"Newton"},
{"id":"PHY047","topic":"Electricity - Circuits","question":"Find the total resistance of two 4Ω resistors connected in series.","options":["8 Ω","2 Ω","4 Ω","16 Ω"],"answer":"8 Ω"},
{"id":"PHY048","topic":"Waves","question":"The relationship between wave speed (v), frequency (f) and wavelength (λ) is ____.","options":["v = fλ","v = f/λ","v = f + λ","v = f - λ"],"answer":"v = fλ"},
{"id":"PHY049","topic":"Heat and Thermodynamics","question":"Which type of thermometer is best for measuring very high temperatures?","options":["Pyrometer","Mercury thermometer","Alcohol thermometer","Clinical thermometer"],"answer":"Pyrometer"},
{"id":"PHY050","topic":"Energy and Work","question":"A machine that converts one form of energy to another with no loss is said to be ____.","options":["100% efficient (ideal)","50% efficient","Zero efficient","Overloaded"],"answer":"100% efficient (ideal)"},
{"id":"PHY051","topic":"Optics","question":"The splitting of white light into its component colours is called ____.","options":["Dispersion","Refraction","Reflection","Diffraction"],"answer":"Dispersion"},
{"id":"PHY052","topic":"Magnetism","question":"The process of making a magnetic material lose its magnetism is called ____.","options":["Demagnetization","Induction","Polarization","Saturation"],"answer":"Demagnetization"},
{"id":"PHY053","topic":"Motion - Kinematics","question":"A ball is thrown vertically upward with a velocity of 20 m/s. Find the time to reach maximum height. (g = 10 m/s²)","options":["2 s","4 s","1 s","20 s"],"answer":"2 s"},
{"id":"PHY054","topic":"Forces and Dynamics","question":"The rate of change of momentum is equal to the applied ____.","options":["Force","Velocity","Acceleration alone","Mass"],"answer":"Force"},
{"id":"PHY055","topic":"Units and Measurements","question":"Which of the following pairs consists only of vector quantities?","options":["Force and velocity","Mass and speed","Time and distance","Energy and temperature"],"answer":"Force and velocity"},
{"id":"PHY056","topic":"Electricity - Power","question":"Electrical power is given by P = VI. Find the power when V = 12V and I = 2A.","options":["24 W","6 W","14 W","10 W"],"answer":"24 W"},
{"id":"PHY057","topic":"Waves","question":"Which of the following waves does NOT require a medium for propagation?","options":["Electromagnetic waves","Sound waves","Water waves","Seismic waves"],"answer":"Electromagnetic waves"},
{"id":"PHY058","topic":"Heat and Thermodynamics","question":"Which of the following best describes conduction?","options":["Transfer of heat through matter without movement of the matter itself","Transfer of heat through empty space","Transfer of heat by the movement of fluid particles","Transfer of light energy"],"answer":"Transfer of heat through matter without movement of the matter itself"},
{"id":"PHY059","topic":"Energy and Work","question":"Potential energy stored in a stretched spring is called ____ energy.","options":["Elastic potential","Kinetic","Chemical","Thermal"],"answer":"Elastic potential"},
{"id":"PHY060","topic":"Optics","question":"The angle of incidence is equal to the angle of ____ in reflection.","options":["Reflection","Refraction","Deviation","Dispersion"],"answer":"Reflection"},
{"id":"PHY061","topic":"Magnetism","question":"A compass needle points towards the Earth's ____ pole.","options":["Magnetic north","Geographic east","Magnetic south only","Equator"],"answer":"Magnetic north"},
{"id":"PHY062","topic":"Motion - Kinematics","question":"Which of the following graphs represents uniform acceleration?","options":["A straight line on a velocity-time graph","A curved line on a distance-time graph only","A horizontal line on a velocity-time graph","A vertical line on any graph"],"answer":"A straight line on a velocity-time graph"},
{"id":"PHY063","topic":"Forces and Dynamics","question":"Friction between two surfaces can be reduced by using ____.","options":["A lubricant","Rough surfaces","More weight","Increased contact area"],"answer":"A lubricant"},
{"id":"PHY064","topic":"Units and Measurements","question":"What is the SI unit of density?","options":["kg/m³","kg/m²","g/cm","N/m²"],"answer":"kg/m³"},
{"id":"PHY065","topic":"Electricity - Circuits","question":"Which device is used to measure electric current in a circuit?","options":["Ammeter","Voltmeter","Ohmmeter","Galvanometer only"],"answer":"Ammeter"},
{"id":"PHY066","topic":"Waves","question":"Which phenomenon explains the bending of waves around obstacles?","options":["Diffraction","Reflection","Refraction","Polarization"],"answer":"Diffraction"},
{"id":"PHY067","topic":"Heat and Thermodynamics","question":"The change of state from solid directly to gas is called ____.","options":["Sublimation","Evaporation","Condensation","Melting"],"answer":"Sublimation"},
{"id":"PHY068","topic":"Energy and Work","question":"Which of the following is a renewable source of energy?","options":["Solar energy","Coal","Petroleum","Natural gas"],"answer":"Solar energy"},
{"id":"PHY069","topic":"Optics","question":"The power of a lens is measured in ____.","options":["Dioptres","Watts","Newtons","Joules"],"answer":"Dioptres"},
{"id":"PHY070","topic":"Magnetism","question":"Which method is used to magnetize a steel bar using a coil carrying current?","options":["Electrical method","Single touch method","Divided touch method","Hammering method"],"answer":"Electrical method"},
{"id":"PHY071","topic":"Motion - Kinematics","question":"A body falls freely from rest. Find its velocity after 3 seconds. (g = 10 m/s²)","options":["30 m/s","10 m/s","3 m/s","13 m/s"],"answer":"30 m/s"},
{"id":"PHY072","topic":"Forces and Dynamics","question":"According to the principle of moments, for a body in equilibrium, the sum of clockwise moments equals the sum of ____.","options":["Anticlockwise moments","Forces","Reactions","Weights"],"answer":"Anticlockwise moments"},
{"id":"PHY073","topic":"Units and Measurements","question":"Which of the following is used to measure atmospheric pressure?","options":["Barometer","Manometer","Thermometer","Hydrometer"],"answer":"Barometer"},
{"id":"PHY074","topic":"Electricity - Power","question":"A device rated 100W operates for 2 hours. Find the energy consumed in Wh.","options":["200 Wh","50 Wh","102 Wh","20 Wh"],"answer":"200 Wh"},
{"id":"PHY075","topic":"Waves","question":"Radio waves are part of the ____ spectrum.","options":["Electromagnetic","Sound","Mechanical","Seismic"],"answer":"Electromagnetic"},
{"id":"PHY076","topic":"Heat and Thermodynamics","question":"Which law states that the pressure of a fixed mass of gas is directly proportional to its temperature at constant volume?","options":["Pressure law (Gay-Lussac's law)","Boyle's law","Charles's law","Avogadro's law"],"answer":"Pressure law (Gay-Lussac's law)"},
{"id":"PHY077","topic":"Energy and Work","question":"The efficiency of a machine is given by the ratio of ____ to input energy.","options":["Useful output energy","Total energy","Wasted energy","Force applied"],"answer":"Useful output energy"},
{"id":"PHY078","topic":"Optics","question":"An object placed beyond the centre of curvature of a concave mirror forms an image that is ____.","options":["Real, inverted and diminished","Virtual, upright and magnified","Real, upright and magnified","Virtual, inverted and diminished"],"answer":"Real, inverted and diminished"},
{"id":"PHY079","topic":"Magnetism","question":"Magnetic field lines emerge from the ____ pole of a magnet.","options":["North","South","Centre","Equator"],"answer":"North"},
{"id":"PHY080","topic":"Motion - Projectile","question":"The horizontal component of velocity in projectile motion (ignoring air resistance) remains ____.","options":["Constant","Increasing","Decreasing","Zero"],"answer":"Constant"},
{"id":"PHY081","topic":"Forces and Dynamics","question":"Which of Newton's laws explains why passengers lurch forward when a moving bus stops suddenly?","options":["First law (inertia)","Second law","Third law","Law of gravitation"],"answer":"First law (inertia)"},
{"id":"PHY082","topic":"Units and Measurements","question":"1 kilometre is equal to how many metres?","options":["1000","100","10000","10"],"answer":"1000"},
{"id":"PHY083","topic":"Electricity - Circuits","question":"Which component in a circuit stores electrical charge?","options":["Capacitor","Resistor","Inductor only","Diode"],"answer":"Capacitor"},
{"id":"PHY084","topic":"Waves","question":"Echo is an example of ____ of sound.","options":["Reflection","Refraction","Diffraction","Interference"],"answer":"Reflection"},
{"id":"PHY085","topic":"Heat and Thermodynamics","question":"Which of the following is a good conductor of heat?","options":["Copper","Wood","Rubber","Air"],"answer":"Copper"},
{"id":"PHY086","topic":"Energy and Work","question":"When a ball is thrown upward, its kinetic energy is converted to ____ energy at maximum height.","options":["Potential","Chemical","Thermal","Sound"],"answer":"Potential"},
{"id":"PHY087","topic":"Optics","question":"The human eye focuses light using the ____.","options":["Lens","Retina","Cornea only","Iris only"],"answer":"Lens"},
{"id":"PHY088","topic":"Magnetism","question":"Soft iron is used in electromagnets because it is ____.","options":["Easily magnetized and demagnetized","Permanently magnetic","Non-magnetic","A good insulator"],"answer":"Easily magnetized and demagnetized"},
{"id":"PHY089","topic":"Motion - Kinematics","question":"Find the average speed of a body that travels 100m in 20 seconds.","options":["5 m/s","20 m/s","2000 m/s","0.2 m/s"],"answer":"5 m/s"},
{"id":"PHY090","topic":"Forces and Dynamics","question":"The upward force exerted by a fluid on a submerged object is called ____.","options":["Upthrust","Weight","Friction","Tension"],"answer":"Upthrust"},
{"id":"PHY091","topic":"Units and Measurements","question":"Which quantity is measured in Pascals?","options":["Pressure","Force","Energy","Power"],"answer":"Pressure"},
{"id":"PHY092","topic":"Electricity - Ohm's Law","question":"A resistor has a current of 4A flowing through it when 8V is applied. Find its resistance.","options":["2 Ω","0.5 Ω","32 Ω","12 Ω"],"answer":"2 Ω"},
{"id":"PHY093","topic":"Waves","question":"The phenomenon where two waves combine to produce a resultant wave is called ____.","options":["Interference","Reflection","Absorption","Polarization"],"answer":"Interference"},
{"id":"PHY094","topic":"Heat and Thermodynamics","question":"Which of the following describes convection?","options":["Transfer of heat by movement of fluid particles","Transfer of heat through empty space","Transfer of heat through solids only","Transfer of light energy"],"answer":"Transfer of heat by movement of fluid particles"},
{"id":"PHY095","topic":"Energy and Work","question":"Which principle states that energy in an isolated system remains constant?","options":["Conservation of energy","Conservation of momentum","Archimedes' principle","Pascal's principle"],"answer":"Conservation of energy"},
{"id":"PHY096","topic":"Optics","question":"Which type of lens is used to correct short-sightedness (myopia)?","options":["Concave lens","Convex lens","Cylindrical lens","Bifocal lens only"],"answer":"Concave lens"},
{"id":"PHY097","topic":"Magnetism","question":"The imaginary lines showing the direction of a magnetic field are called ____.","options":["Magnetic field lines","Electric field lines","Flux lines only","Force lines"],"answer":"Magnetic field lines"},
{"id":"PHY098","topic":"Motion - Circular Motion","question":"A satellite orbiting the Earth experiences ____ force directed towards the Earth.","options":["Centripetal","Centrifugal","Frictional","Magnetic"],"answer":"Centripetal"},
{"id":"PHY099","topic":"Forces and Dynamics","question":"The SI unit of pressure is the ____.","options":["Pascal","Newton","Joule","Watt"],"answer":"Pascal"},
{"id":"PHY100","topic":"Units and Measurements","question":"Which of the following is used to measure very small time intervals accurately?","options":["Digital stopwatch","Sundial","Pendulum clock","Hourglass"],"answer":"Digital stopwatch"},
{"id":"PHY101","topic":"Electricity - Circuits","question":"Find the equivalent resistance of two 6Ω resistors connected in parallel.","options":["3 Ω","12 Ω","6 Ω","2 Ω"],"answer":"3 Ω"},
{"id":"PHY102","topic":"Waves","question":"The period of a wave is the reciprocal of its ____.","options":["Frequency","Wavelength","Amplitude","Speed"],"answer":"Frequency"},
{"id":"PHY103","topic":"Heat and Thermodynamics","question":"Which scale of temperature has its zero point at absolute zero?","options":["Kelvin","Celsius","Fahrenheit","Reaumur"],"answer":"Kelvin"},
{"id":"PHY104","topic":"Energy and Work","question":"The unit of power is the ____.","options":["Watt","Joule","Newton","Pascal"],"answer":"Watt"},
{"id":"PHY105","topic":"Optics","question":"Total internal reflection occurs when light travels from a ____ medium to a ____ medium at an angle greater than the critical angle.","options":["Denser; less dense","Less dense; denser","Equal; equal","Vacuum; vacuum"],"answer":"Denser; less dense"},
{"id":"PHY106","topic":"Magnetism","question":"Which of the following best describes an electromagnet?","options":["A temporary magnet produced by current flowing through a coil","A permanent magnet made of steel","A magnet found in nature","A non-magnetic material"],"answer":"A temporary magnet produced by current flowing through a coil"},
{"id":"PHY107","topic":"Motion - Kinematics","question":"A body moves with initial velocity 5 m/s and accelerates at 2 m/s² for 4 seconds. Find the final velocity.","options":["13 m/s","20 m/s","8 m/s","10 m/s"],"answer":"13 m/s"},
{"id":"PHY108","topic":"Forces and Dynamics","question":"Which quantity remains constant in an elastic collision?","options":["Total kinetic energy and momentum","Only momentum","Only kinetic energy","Neither momentum nor energy"],"answer":"Total kinetic energy and momentum"},
{"id":"PHY109","topic":"Units and Measurements","question":"Which of the following represents an error due to the observer's position when taking a reading?","options":["Parallax error","Zero error","Systematic error","Random error only"],"answer":"Parallax error"},
{"id":"PHY110","topic":"Electricity - Power","question":"Find the cost of using a 2000W heater for 5 hours if electricity costs ₦50 per kWh.","options":["₦500","₦100","₦1000","₦250"],"answer":"₦500"},
{"id":"PHY111","topic":"Waves","question":"Which of the following properties of waves does NOT change when a wave passes into a new medium?","options":["Frequency","Speed","Wavelength","Amplitude"],"answer":"Frequency"},
{"id":"PHY112","topic":"Heat and Thermodynamics","question":"The quantity of heat required to change a substance from solid to liquid without a change in temperature is called ____.","options":["Latent heat of fusion","Specific heat capacity","Latent heat of vaporization","Thermal capacity"],"answer":"Latent heat of fusion"},
{"id":"PHY113","topic":"Energy and Work","question":"Which of these is an example of chemical potential energy?","options":["Energy stored in a battery","Energy of a moving car","Heat from the sun","Sound from a speaker"],"answer":"Energy stored in a battery"},
{"id":"PHY114","topic":"Optics","question":"Which of the following describes a real image?","options":["An image that can be formed on a screen","An image that cannot be formed on a screen","An image that is always upright","An image formed only by plane mirrors"],"answer":"An image that can be formed on a screen"},
{"id":"PHY115","topic":"Magnetism","question":"The strength of a magnetic field is measured using a ____.","options":["Magnetometer","Ammeter","Voltmeter","Galvanometer"],"answer":"Magnetometer"},
{"id":"PHY116","topic":"Motion - Kinematics","question":"Displacement differs from distance in that displacement is a ____ quantity.","options":["Vector","Scalar","Constant","Fundamental"],"answer":"Vector"},
{"id":"PHY117","topic":"Forces and Dynamics","question":"Which of the following best explains why a rocket can move in space despite the absence of air?","options":["Newton's third law (action-reaction)","Air resistance pushes it","Gravity pulls it forward","Friction with space particles"],"answer":"Newton's third law (action-reaction)"},
{"id":"PHY118","topic":"Units and Measurements","question":"Which of the following is a correct example of a base SI unit?","options":["Kelvin","Newton","Joule","Watt"],"answer":"Kelvin"},
{"id":"PHY119","topic":"Electricity - Circuits","question":"Fuses are used in electrical circuits mainly to ____.","options":["Protect against excess current","Increase voltage","Store charge","Reduce resistance"],"answer":"Protect against excess current"},
{"id":"PHY120","topic":"Waves","question":"Which of the following is true about ultrasonic waves?","options":["They have frequencies above the range of human hearing","They have frequencies below human hearing","They are visible light waves","They cannot travel through air"],"answer":"They have frequencies above the range of human hearing"},
{"id":"PHY121","topic":"Heat and Thermodynamics","question":"Which of these best explains why a bimetallic strip bends when heated?","options":["The two metals expand at different rates","Both metals contract equally","One metal melts","The metals become magnetic"],"answer":"The two metals expand at different rates"},
{"id":"PHY122","topic":"Energy and Work","question":"Which of the following statements about a simple pendulum is true?","options":["Its total mechanical energy remains constant (ignoring friction)","Its kinetic energy is always zero","Its potential energy is always maximum","It gains energy as it swings"],"answer":"Its total mechanical energy remains constant (ignoring friction)"},
{"id":"PHY123","topic":"Optics","question":"Which of the following defects of vision is corrected using a convex lens?","options":["Long-sightedness (hypermetropia)","Short-sightedness (myopia)","Astigmatism only","Colour blindness"],"answer":"Long-sightedness (hypermetropia)"},
{"id":"PHY124","topic":"Magnetism","question":"Which rule is used to determine the direction of the magnetic field around a current-carrying conductor?","options":["Right-hand grip rule","Left-hand rule only","Fleming's rule only","Lenz's rule only"],"answer":"Right-hand grip rule"},
{"id":"PHY125","topic":"Motion - Projectile","question":"The maximum height reached by a projectile depends on the ____ component of its initial velocity.","options":["Vertical","Horizontal","Both equally","Neither"],"answer":"Vertical"},
{"id":"PHY126","topic":"Forces and Dynamics","question":"A body of mass 5kg experiences a force of 20N. Find its acceleration.","options":["4 m/s²","100 m/s²","0.25 m/s²","25 m/s²"],"answer":"4 m/s²"},
{"id":"PHY127","topic":"Units and Measurements","question":"Which of the following errors can be reduced by taking multiple readings and averaging?","options":["Random error","Zero error","Systematic error","Parallax error only"],"answer":"Random error"},
{"id":"PHY128","topic":"Electricity - Ohm's Law","question":"Which graph represents Ohm's law for a fixed resistor at constant temperature?","options":["A straight line through the origin (V vs I)","A curve","A horizontal line","A vertical line"],"answer":"A straight line through the origin (V vs I)"},
{"id":"PHY129","topic":"Waves","question":"Which of the following best describes polarization of light?","options":["Restriction of light vibrations to a single plane","Splitting of light into colours","Bending of light around obstacles","Bouncing of light off a surface"],"answer":"Restriction of light vibrations to a single plane"},
{"id":"PHY130","topic":"Heat and Thermodynamics","question":"Which of the following gas laws relates pressure and volume at constant temperature?","options":["Boyle's law","Charles's law","Pressure law","Avogadro's law"],"answer":"Boyle's law"},
{"id":"PHY131","topic":"Energy and Work","question":"A machine with an efficiency of 80% converts 500J of input energy. Find the useful output energy.","options":["400 J","100 J","500 J","80 J"],"answer":"400 J"},
{"id":"PHY132","topic":"Optics","question":"Which colour of light has the longest wavelength in the visible spectrum?","options":["Red","Violet","Blue","Green"],"answer":"Red"},
{"id":"PHY133","topic":"Magnetism","question":"Which of the following materials is diamagnetic?","options":["Bismuth","Iron","Nickel","Cobalt"],"answer":"Bismuth"},
{"id":"PHY134","topic":"Motion - Kinematics","question":"Which of the following best describes acceleration?","options":["The rate of change of velocity","The rate of change of displacement","The product of mass and velocity","The total distance covered per unit time"],"answer":"The rate of change of velocity"},
{"id":"PHY135","topic":"Forces and Dynamics","question":"A lift accelerates upward. The apparent weight of a person inside the lift ____.","options":["Increases","Decreases","Remains the same","Becomes zero"],"answer":"Increases"},
{"id":"PHY136","topic":"Units and Measurements","question":"Which of the following is the correct order of magnitude prefix from smallest to largest: milli, kilo, micro?","options":["Micro, milli, kilo","Milli, micro, kilo","Kilo, milli, micro","Micro, kilo, milli"],"answer":"Micro, milli, kilo"},
{"id":"PHY137","topic":"Electricity - Power","question":"Which of the following devices converts electrical energy into mechanical energy?","options":["Electric motor","Generator","Battery","Transformer"],"answer":"Electric motor"},
{"id":"PHY138","topic":"Waves","question":"Which of the following best explains why the sky appears blue?","options":["Scattering of shorter wavelengths of light","Absorption of red light only","Reflection of blue light from the ground","Refraction of sound waves"],"answer":"Scattering of shorter wavelengths of light"},
{"id":"PHY139","topic":"Heat and Thermodynamics","question":"Which of the following describes an adiabatic process?","options":["A process in which no heat is exchanged with the surroundings","A process at constant temperature","A process at constant pressure","A process at constant volume"],"answer":"A process in which no heat is exchanged with the surroundings"},
{"id":"PHY140","topic":"Energy and Work","question":"Which of the following best describes the principle of conservation of momentum?","options":["Total momentum before collision equals total momentum after collision, in a closed system","Momentum increases after every collision","Momentum is always lost in collisions","Momentum only applies to elastic collisions"],"answer":"Total momentum before collision equals total momentum after collision, in a closed system"},
{"id":"PHY141","topic":"Optics","question":"Which instrument uses a combination of lenses to magnify distant objects?","options":["Telescope","Microscope","Periscope","Camera"],"answer":"Telescope"},
{"id":"PHY142","topic":"Magnetism","question":"When a current-carrying conductor is placed in a magnetic field, it experiences a force according to ____.","options":["Fleming's left-hand rule","Fleming's right-hand rule","Lenz's law only","Ohm's law"],"answer":"Fleming's left-hand rule"},
{"id":"PHY143","topic":"Motion - Circular Motion","question":"Angular velocity is measured in ____.","options":["Radians per second","Metres per second","Newtons","Joules"],"answer":"Radians per second"},
{"id":"PHY144","topic":"Forces and Dynamics","question":"The coefficient of friction between two surfaces depends on the ____.","options":["Nature of the surfaces in contact","Speed of motion only","Colour of the surfaces","Mass of the object only"],"answer":"Nature of the surfaces in contact"},
{"id":"PHY145","topic":"Units and Measurements","question":"Which of the following best defines accuracy in measurement?","options":["Closeness of a measured value to the true value","Consistency of repeated measurements","The smallest unit an instrument can measure","The number of significant figures used"],"answer":"Closeness of a measured value to the true value"},
{"id":"PHY146","topic":"Electricity - Circuits","question":"Which of the following describes electromotive force (e.m.f.)?","options":["The energy supplied by a source per unit charge","The current flowing through a circuit","The resistance of a circuit","The power dissipated in a resistor"],"answer":"The energy supplied by a source per unit charge"},
{"id":"PHY147","topic":"Waves","question":"Which of the following best explains the Doppler effect?","options":["Apparent change in frequency due to relative motion between source and observer","Bending of waves around obstacles","Splitting of light into colours","Combination of two waves"],"answer":"Apparent change in frequency due to relative motion between source and observer"},
{"id":"PHY148","topic":"Heat and Thermodynamics","question":"Which of the following best describes the first law of thermodynamics?","options":["Energy supplied to a system equals the increase in internal energy plus work done by the system","Heat always flows from cold to hot","Entropy of an isolated system decreases","Volume of a gas is inversely proportional to pressure"],"answer":"Energy supplied to a system equals the increase in internal energy plus work done by the system"},
{"id":"PHY149","topic":"Energy and Work","question":"Which of the following is an example of energy transformation from chemical to electrical?","options":["A battery in use","A light bulb glowing","A moving car","A falling object"],"answer":"A battery in use"},
{"id":"PHY150","topic":"Optics","question":"Which lens defect causes different colours of light to focus at different points?","options":["Chromatic aberration","Spherical aberration","Astigmatism","Diffraction"],"answer":"Chromatic aberration"},
{"id":"PHY151","topic":"Magnetism","question":"Which of the following best describes electromagnetic induction?","options":["Production of an e.m.f. due to a changing magnetic field","Attraction between two magnets","Repulsion between like poles","Loss of magnetism in a material"],"answer":"Production of an e.m.f. due to a changing magnetic field"},
{"id":"PHY152","topic":"Motion - Kinematics","question":"A body decelerates uniformly from 25 m/s to rest in 5 seconds. Find the deceleration.","options":["5 m/s²","25 m/s²","0.2 m/s²","125 m/s²"],"answer":"5 m/s²"},
{"id":"PHY153","topic":"Forces and Dynamics","question":"Which of the following best describes elastic potential energy in a spring?","options":["Energy stored due to deformation","Energy due to motion","Energy due to height","Energy due to temperature"],"answer":"Energy stored due to deformation"},
{"id":"PHY154","topic":"Units and Measurements","question":"Which of the following best describes precision in measurement?","options":["The consistency of repeated measurements","The closeness of a value to the true value","The unit used for measurement","The instrument used"],"answer":"The consistency of repeated measurements"},
{"id":"PHY155","topic":"Electricity - Power","question":"Which of the following best explains why appliances are connected in parallel in homes?","options":["Each appliance can operate independently at the same voltage","It reduces total current","It increases total resistance","It requires less wiring"],"answer":"Each appliance can operate independently at the same voltage"},
{"id":"PHY156","topic":"Waves","question":"Which of the following correctly orders electromagnetic waves from longest to shortest wavelength?","options":["Radio, infrared, visible light, gamma rays","Gamma rays, visible light, infrared, radio","Visible light, radio, gamma rays, infrared","Infrared, gamma rays, radio, visible light"],"answer":"Radio, infrared, visible light, gamma rays"},
{"id":"PHY157","topic":"Heat and Thermodynamics","question":"Which of the following best describes the term 'entropy'?","options":["A measure of the disorder of a system","A measure of temperature","A measure of pressure","A measure of volume"],"answer":"A measure of the disorder of a system"},
{"id":"PHY158","topic":"Energy and Work","question":"Which of the following best illustrates the conversion of gravitational potential energy to kinetic energy?","options":["A ball rolling down a hill","A stretched rubber band","A charged battery","A heated metal rod"],"answer":"A ball rolling down a hill"},
{"id":"PHY159","topic":"Optics","question":"Which of the following best describes the function of the retina in the human eye?","options":["It converts light into nerve impulses","It controls the amount of light entering the eye","It focuses light onto the back of the eye","It protects the eye from injury"],"answer":"It converts light into nerve impulses"},
{"id":"PHY160","topic":"Magnetism","question":"Which of the following describes Lenz's law?","options":["The induced current opposes the change producing it","The induced current always flows in the same direction as the field","Magnetic poles always attract","Current flows from high to low potential"],"answer":"The induced current opposes the change producing it"},
{"id":"PHY161","topic":"Motion - Projectile","question":"The time of flight of a projectile depends mainly on its ____ velocity component and the acceleration due to gravity.","options":["Vertical","Horizontal","Resultant","Angular"],"answer":"Vertical"},
{"id":"PHY162","topic":"Forces and Dynamics","question":"Which of the following best describes torque?","options":["The turning effect of a force","The force applied over a distance","The resistance to motion","The rate of change of momentum"],"answer":"The turning effect of a force"},
{"id":"PHY163","topic":"Units and Measurements","question":"Which of the following best describes a systematic error?","options":["A consistent error that affects all readings in the same way","A random variation in readings","An error caused by parallax only","An error due to human reaction time only"],"answer":"A consistent error that affects all readings in the same way"},
{"id":"PHY164","topic":"Electricity - Circuits","question":"Which of the following best explains why a potentiometer is used to measure e.m.f. accurately?","options":["It draws negligible current from the source when balanced","It has very low resistance","It always draws maximum current","It short-circuits the source"],"answer":"It draws negligible current from the source when balanced"},
{"id":"PHY165","topic":"Waves","question":"Which of the following best describes resonance?","options":["A system vibrating at its natural frequency due to an external force of the same frequency","A system vibrating at random frequencies","The complete absorption of a wave","The scattering of light"],"answer":"A system vibrating at its natural frequency due to an external force of the same frequency"},
{"id":"PHY166","topic":"Heat and Thermodynamics","question":"Which of the following best explains why a gas exerts pressure on the walls of its container?","options":["Continuous collision of gas molecules with the walls","Gravity pulling molecules to the walls","Chemical reactions inside the container","Heat escaping through the walls"],"answer":"Continuous collision of gas molecules with the walls"},
{"id":"PHY167","topic":"Energy and Work","question":"Which of the following best describes an isolated system in physics?","options":["A system with no exchange of matter or energy with its surroundings","A system with constant temperature","A system with constant pressure","A system with no internal energy"],"answer":"A system with no exchange of matter or energy with its surroundings"},
{"id":"PHY168","topic":"Optics","question":"Which of the following best explains why a stick appears bent when partly immersed in water?","options":["Refraction of light at the water surface","Reflection of light from the stick","Dispersion of light","Diffraction of light"],"answer":"Refraction of light at the water surface"},
{"id":"PHY169","topic":"Magnetism","question":"Which of the following best describes the working principle of a transformer?","options":["Mutual induction between two coils","Direct current flow between coils","Friction between coils","Chemical reaction between coils"],"answer":"Mutual induction between two coils"},
{"id":"PHY170","topic":"Motion - Kinematics","question":"Which of the following best describes terminal velocity?","options":["The constant maximum velocity reached when resistive force equals gravitational force","The initial velocity of a falling object","The velocity at the highest point of a projectile","The velocity just before impact only"],"answer":"The constant maximum velocity reached when resistive force equals gravitational force"},
{"id":"PHY171","topic":"Forces and Dynamics","question":"Which of the following best explains why it is easier to loosen a tight nut using a longer spanner?","options":["A longer spanner increases the moment arm, increasing torque for the same force","A longer spanner reduces friction","A longer spanner increases the nut's weight","A longer spanner changes the nut's material"],"answer":"A longer spanner increases the moment arm, increasing torque for the same force"},
{"id":"PHY172","topic":"Units and Measurements","question":"Which of the following best describes the term 'significant figures'?","options":["Digits in a number that carry meaning contributing to its precision","The total number of digits in a number","Only the digits after the decimal point","The first digit of a number only"],"answer":"Digits in a number that carry meaning contributing to its precision"},
{"id":"PHY173","topic":"Electricity - Ohm's Law","question":"Which of the following best explains why the resistance of a metallic conductor increases with temperature?","options":["Increased vibration of atoms impedes electron flow","Decreased vibration of atoms allows more electron flow","The conductor becomes magnetic","The conductor loses electrons permanently"],"answer":"Increased vibration of atoms impedes electron flow"},
{"id":"PHY174","topic":"Waves","question":"Which of the following best describes the difference between transverse and longitudinal waves?","options":["Transverse waves vibrate perpendicular to propagation direction; longitudinal waves vibrate parallel to it","Transverse waves need a medium; longitudinal waves do not","Longitudinal waves are always faster","Transverse waves cannot be reflected"],"answer":"Transverse waves vibrate perpendicular to propagation direction; longitudinal waves vibrate parallel to it"},
{"id":"PHY175","topic":"Heat and Thermodynamics","question":"Which of the following best describes why sweating cools the body?","options":["Evaporation of sweat absorbs latent heat from the skin","Sweat conducts heat away rapidly","Sweat reflects sunlight","Sweat increases blood flow"],"answer":"Evaporation of sweat absorbs latent heat from the skin"},
{"id":"PHY176","topic":"Energy and Work","question":"Which of the following best describes the relationship between work done and energy?","options":["Work done on a system equals the energy transferred to it","Work done is always greater than energy transferred","Energy transferred is unrelated to work done","Work done always converts to heat only"],"answer":"Work done on a system equals the energy transferred to it"},
{"id":"PHY177","topic":"Optics","question":"Which of the following best explains why a convex lens can be used as a magnifying glass?","options":["It produces a virtual, upright and magnified image when the object is within its focal length","It always produces a real image","It reduces the size of the object","It reverses the image orientation"],"answer":"It produces a virtual, upright and magnified image when the object is within its focal length"},
{"id":"PHY178","topic":"Magnetism","question":"Which of the following best describes the function of a commutator in a DC motor?","options":["It reverses the current direction to maintain continuous rotation","It increases the voltage supplied","It stores magnetic energy","It measures the current"],"answer":"It reverses the current direction to maintain continuous rotation"},
{"id":"PHY179","topic":"Motion - Circular Motion","question":"Which of the following best explains why passengers feel pushed outward when a car turns sharply?","options":["Inertia causes the body to continue in a straight line while the car turns","Centripetal force pushes passengers outward","Gravity increases during the turn","Friction decreases during the turn"],"answer":"Inertia causes the body to continue in a straight line while the car turns"},
{"id":"PHY180","topic":"Forces and Dynamics","question":"Which of the following best describes the principle behind hydraulic machines?","options":["Pressure applied to an enclosed fluid is transmitted equally in all directions (Pascal's principle)","Pressure decreases with depth in a fluid","Force is lost when transmitted through fluids","Fluids cannot transmit force"],"answer":"Pressure applied to an enclosed fluid is transmitted equally in all directions (Pascal's principle)"},
{"id":"PHY181","topic":"Units and Measurements","question":"Which of the following instruments would best measure the volume of an irregularly shaped solid?","options":["Displacement (eureka) can","Metre rule","Vernier calipers","Spring balance"],"answer":"Displacement (eureka) can"},
{"id":"PHY182","topic":"Electricity - Power","question":"Which of the following best explains why thick wires are used for high-current appliances?","options":["Thick wires have lower resistance, reducing heat loss","Thick wires increase resistance for safety","Thick wires are cheaper","Thick wires reduce voltage"],"answer":"Thick wires have lower resistance, reducing heat loss"},
{"id":"PHY183","topic":"Waves","question":"Which of the following best explains why musical instruments produce different qualities of sound (timbre) even at the same pitch?","options":["Differences in the harmonics/overtones produced","Differences in wave speed only","Differences in wavelength only","Differences in amplitude only"],"answer":"Differences in the harmonics/overtones produced"},
{"id":"PHY184","topic":"Heat and Thermodynamics","question":"Which of the following best describes why ice floats on water?","options":["Ice is less dense than liquid water","Ice is heavier than water","Ice has a higher temperature than water","Ice conducts heat better than water"],"answer":"Ice is less dense than liquid water"},
{"id":"PHY185","topic":"Energy and Work","question":"Which of the following best explains energy loss in real machines?","options":["Friction converts some energy to heat, reducing efficiency","Energy is destroyed during operation","Energy increases due to motion","Energy is stored permanently in the machine"],"answer":"Friction converts some energy to heat, reducing efficiency"},
{"id":"PHY186","topic":"Optics","question":"Which of the following best explains the working of an optical fibre?","options":["Total internal reflection allows light to travel along the fibre","Refraction bends light out of the fibre","Diffraction spreads light along the fibre","Dispersion separates light into colours inside the fibre"],"answer":"Total internal reflection allows light to travel along the fibre"},
{"id":"PHY187","topic":"Magnetism","question":"Which of the following best describes the effect of increasing the number of turns in a solenoid on its magnetic field strength?","options":["The magnetic field strength increases","The magnetic field strength decreases","The magnetic field strength remains unchanged","The solenoid loses its magnetism"],"answer":"The magnetic field strength increases"},
{"id":"PHY188","topic":"Motion - Kinematics","question":"Which of the following best describes the area under a velocity-time graph?","options":["The displacement of the body","The acceleration of the body","The force acting on the body","The mass of the body"],"answer":"The displacement of the body"},
{"id":"PHY189","topic":"Forces and Dynamics","question":"Which of the following best explains why a body in equilibrium under three forces can be represented by a closed triangle?","options":["The vector sum of the forces is zero","The forces are all equal in magnitude","The forces act in the same direction","The body is stationary regardless of forces"],"answer":"The vector sum of the forces is zero"},
{"id":"PHY190","topic":"Units and Measurements","question":"Which of the following best explains the purpose of calibrating an instrument before use?","options":["To ensure accurate and reliable readings","To increase the instrument's sensitivity permanently","To change the instrument's unit of measurement","To reduce the instrument's range"],"answer":"To ensure accurate and reliable readings"},
{"id":"PHY191","topic":"Electricity - Circuits","question":"Which of the following best explains why resistors are used in series with LEDs in a circuit?","options":["To limit the current flowing through the LED and prevent damage","To increase the voltage across the LED","To store charge for the LED","To reverse the current direction"],"answer":"To limit the current flowing through the LED and prevent damage"},
{"id":"PHY192","topic":"Waves","question":"Which of the following best explains why stringed musical instruments produce different notes when the string length is changed?","options":["Shorter strings vibrate at higher frequencies, producing higher pitched notes","Longer strings always produce louder notes","String length does not affect frequency","Shorter strings produce lower pitched notes"],"answer":"Shorter strings vibrate at higher frequencies, producing higher pitched notes"},
{"id":"PHY193","topic":"Heat and Thermodynamics","question":"Which of the following best explains why a pressure cooker cooks food faster?","options":["Increased pressure raises the boiling point of water, allowing higher cooking temperatures","Decreased pressure lowers the boiling point","The cooker adds extra heat energy directly to food","The cooker removes moisture from food"],"answer":"Increased pressure raises the boiling point of water, allowing higher cooking temperatures"},
{"id":"PHY194","topic":"Energy and Work","question":"Which of the following best describes why a pendulum eventually stops swinging in air?","options":["Air resistance and friction at the pivot dissipate its mechanical energy as heat","The pendulum gains potential energy over time","The string becomes heavier","Gravity decreases over time"],"answer":"Air resistance and friction at the pivot dissipate its mechanical energy as heat"},
{"id":"PHY195","topic":"Optics","question":"Which of the following best explains why rainbows form after rainfall?","options":["Refraction and dispersion of sunlight by water droplets","Reflection of sunlight by clouds only","Diffraction of sunlight by dust particles","Absorption of sunlight by water vapour"],"answer":"Refraction and dispersion of sunlight by water droplets"},
{"id":"PHY196","topic":"Magnetism","question":"Which of the following best explains why the core of a transformer is made of laminated soft iron rather than a solid block?","options":["To reduce eddy current losses","To increase the weight of the transformer","To make the transformer permanently magnetic","To reduce the number of turns needed"],"answer":"To reduce eddy current losses"},
{"id":"PHY197","topic":"Motion - Projectile","question":"Which of the following best explains why a projectile follows a parabolic path?","options":["Constant horizontal velocity combined with uniformly accelerated vertical motion","Constant velocity in both horizontal and vertical directions","Uniformly accelerated motion in both directions","Zero acceleration in both directions"],"answer":"Constant horizontal velocity combined with uniformly accelerated vertical motion"},
{"id":"PHY198","topic":"Forces and Dynamics","question":"Which of the following best explains why it is harder to push a loaded wheelbarrow than an empty one?","options":["Greater mass requires greater force to produce the same acceleration","Greater mass reduces the force needed","Friction decreases with more load","Weight has no effect on the force required"],"answer":"Greater mass requires greater force to produce the same acceleration"},
{"id":"PHY199","topic":"Units and Measurements","question":"Which of the following best explains why scientists use standard units of measurement?","options":["To ensure consistency and comparability of measurements globally","To make calculations more difficult","To restrict measurements to specific countries","To eliminate the need for instruments"],"answer":"To ensure consistency and comparability of measurements globally"},
{"id":"PHY200","topic":"Electricity - Power","question":"Which of the following best explains why transformers are used to step up voltage for long-distance power transmission?","options":["Higher voltage reduces current, minimizing power loss due to resistance in transmission lines","Higher voltage increases current, improving efficiency","Higher voltage reduces the need for insulation","Higher voltage eliminates resistance in wires"],"answer":"Higher voltage reduces current, minimizing power loss due to resistance in transmission lines"},
  {
    "id": "PHY201",
    "topic": "Measurements and Units",
    "question": "Which of the following is a fundamental physical quantity?",
    "options": ["Force", "Energy", "Mass", "Pressure"],
    "answer": "Mass"
  },
  {
    "id": "PHY202",
    "topic": "Measurements and Units",
    "question": "The SI unit of electric current is",
    "options": ["Volt", "Ampere", "Ohm", "Coulomb"],
    "answer": "Ampere"
  },
  {
    "id": "PHY203",
    "topic": "Measurements and Units",
    "question": "Which instrument is most suitable for measuring the diameter of a thin wire?",
    "options": ["Metre rule", "Measuring cylinder", "Micrometer screw gauge", "Beam balance"],
    "answer": "Micrometer screw gauge"
  },
  {
    "id": "PHY204",
    "topic": "Measurements and Units",
    "question": "The SI unit of pressure is",
    "options": ["Newton", "Joule", "Pascal", "Watt"],
    "answer": "Pascal"
  },
  {
    "id": "PHY205",
    "topic": "Measurements and Units",
    "question": "Which of the following is a derived quantity?",
    "options": ["Length", "Time", "Temperature", "Velocity"],
    "answer": "Velocity"
  },
  {
    "id": "PHY206",
    "topic": "Scalars and Vectors",
    "question": "Which of the following is a scalar quantity?",
    "options": ["Velocity", "Force", "Displacement", "Speed"],
    "answer": "Speed"
  },
  {
    "id": "PHY207",
    "topic": "Scalars and Vectors",
    "question": "Which of the following quantities has both magnitude and direction?",
    "options": ["Mass", "Time", "Force", "Temperature"],
    "answer": "Force"
  },
  {
    "id": "PHY208",
    "topic": "Scalars and Vectors",
    "question": "Two perpendicular forces of 3 N and 4 N act on a body. Their resultant is",
    "options": ["1 N", "5 N", "7 N", "12 N"],
    "answer": "5 N"
  },
  {
    "id": "PHY209",
    "topic": "Motion",
    "question": "A car travels 120 m in 10 s. Its average speed is",
    "options": ["10 m/s", "12 m/s", "20 m/s", "1200 m/s"],
    "answer": "12 m/s"
  },
  {
    "id": "PHY210",
    "topic": "Motion",
    "question": "A body moving with constant velocity has",
    "options": ["Constant acceleration", "Zero acceleration", "Increasing acceleration", "Decreasing speed"],
    "answer": "Zero acceleration"
  },
  {
    "id": "PHY211",
    "topic": "Motion",
    "question": "A body starts from rest and accelerates uniformly at 2 m/s² for 5 s. Its final velocity is",
    "options": ["5 m/s", "7 m/s", "10 m/s", "25 m/s"],
    "answer": "10 m/s"
  },
  {
    "id": "PHY212",
    "topic": "Motion",
    "question": "A car moving at 20 m/s comes to rest in 5 s. Its acceleration is",
    "options": ["−4 m/s²", "−2 m/s²", "4 m/s²", "5 m/s²"],
    "answer": "−4 m/s²"
  },
  {
    "id": "PHY213",
    "topic": "Motion",
    "question": "The area under a velocity-time graph represents",
    "options": ["Acceleration", "Distance travelled", "Speed", "Force"],
    "answer": "Distance travelled"
  },
  {
    "id": "PHY214",
    "topic": "Motion",
    "question": "The slope of a velocity-time graph represents",
    "options": ["Distance", "Displacement", "Acceleration", "Momentum"],
    "answer": "Acceleration"
  },
  {
    "id": "PHY215",
    "topic": "Motion",
    "question": "A stone is dropped from rest. Ignoring air resistance, its velocity after 3 s is approximately",
    "options": ["9.8 m/s", "19.6 m/s", "29.4 m/s", "39.2 m/s"],
    "answer": "29.4 m/s"
  },
  {
    "id": "PHY216",
    "topic": "Motion",
    "question": "A projectile is launched horizontally from a height. Its horizontal velocity, neglecting air resistance, is",
    "options": ["Constant", "Increasing", "Decreasing", "Zero"],
    "answer": "Constant"
  },
  {
    "id": "PHY217",
    "topic": "Motion",
    "question": "The acceleration due to gravity near the Earth's surface is approximately",
    "options": ["0.98 m/s²", "9.8 m/s²", "98 m/s²", "980 m/s²"],
    "answer": "9.8 m/s²"
  },
  {
    "id": "PHY218",
    "topic": "Newton's Laws of Motion",
    "question": "Newton's first law of motion is also known as the law of",
    "options": ["Acceleration", "Inertia", "Momentum", "Gravitation"],
    "answer": "Inertia"
  },
  {
    "id": "PHY219",
    "topic": "Newton's Laws of Motion",
    "question": "A force of 20 N acts on a mass of 5 kg. The acceleration produced is",
    "options": ["2 m/s²", "4 m/s²", "5 m/s²", "100 m/s²"],
    "answer": "4 m/s²"
  },
  {
    "id": "PHY220",
    "topic": "Newton's Laws of Motion",
    "question": "Newton's third law states that action and reaction are",
    "options": ["Equal and in the same direction", "Equal and opposite", "Unequal and opposite", "Independent"],
    "answer": "Equal and opposite"
  },
  {
    "id": "PHY221",
    "topic": "Newton's Laws of Motion",
    "question": "A force of 50 N acts on a body of mass 10 kg. The acceleration is",
    "options": ["2 m/s²", "5 m/s²", "10 m/s²", "500 m/s²"],
    "answer": "5 m/s²"
  },
  {
    "id": "PHY222",
    "topic": "Momentum",
    "question": "The momentum of a body is the product of its",
    "options": ["Mass and acceleration", "Mass and velocity", "Force and distance", "Weight and velocity"],
    "answer": "Mass and velocity"
  },
  {
    "id": "PHY223",
    "topic": "Momentum",
    "question": "A 4 kg body moves with a velocity of 5 m/s. Its momentum is",
    "options": ["0.8 kg m/s", "9 kg m/s", "20 kg m/s", "25 kg m/s"],
    "answer": "20 kg m/s"
  },
  {
    "id": "PHY224",
    "topic": "Momentum",
    "question": "Impulse is equal to the change in",
    "options": ["Energy", "Momentum", "Velocity", "Mass"],
    "answer": "Momentum"
  },
  {
    "id": "PHY225",
    "topic": "Momentum",
    "question": "In an isolated system, total linear momentum is",
    "options": ["Destroyed", "Constant", "Always zero", "Increasing"],
    "answer": "Constant"
  },
  {
    "id": "PHY226",
    "topic": "Work, Energy and Power",
    "question": "Work is done when a force causes",
    "options": ["Mass to increase", "Displacement in the direction of the force", "Temperature to decrease", "Time to stop"],
    "answer": "Displacement in the direction of the force"
  },
  {
    "id": "PHY227",
    "topic": "Work, Energy and Power",
    "question": "The SI unit of work is",
    "options": ["Watt", "Newton", "Joule", "Pascal"],
    "answer": "Joule"
  },
  {
    "id": "PHY228",
    "topic": "Work, Energy and Power",
    "question": "A force of 10 N moves an object through 5 m in its direction. The work done is",
    "options": ["2 J", "15 J", "50 J", "100 J"],
    "answer": "50 J"
  },
  {
    "id": "PHY229",
    "topic": "Work, Energy and Power",
    "question": "The kinetic energy of a body is given by",
    "options": ["mv", "mgh", "1/2mv²", "F/t"],
    "answer": "1/2mv²"
  },
  {
    "id": "PHY230",
    "topic": "Work, Energy and Power",
    "question": "A 2 kg object moves at 4 m/s. Its kinetic energy is",
    "options": ["4 J", "8 J", "16 J", "32 J"],
    "answer": "16 J"
  },
  {
    "id": "PHY231",
    "topic": "Work, Energy and Power",
    "question": "The gravitational potential energy of a body of mass m at height h is",
    "options": ["mg/h", "mgh", "mh/g", "mg+h"],
    "answer": "mgh"
  },
  {
    "id": "PHY232",
    "topic": "Work, Energy and Power",
    "question": "A machine does 600 J of work in 20 s. Its power is",
    "options": ["20 W", "30 W", "300 W", "12000 W"],
    "answer": "30 W"
  },
  {
    "id": "PHY233",
    "topic": "Work, Energy and Power",
    "question": "The efficiency of a machine is the ratio of",
    "options": ["Input energy to output energy", "Useful output energy to input energy", "Power to time", "Force to distance"],
    "answer": "Useful output energy to input energy"
  },
  {
    "id": "PHY234",
    "topic": "Machines",
    "question": "Mechanical advantage is defined as",
    "options": ["Effort/load", "Load/effort", "Load × effort", "Load + effort"],
    "answer": "Load/effort"
  },
  {
    "id": "PHY235",
    "topic": "Machines",
    "question": "A machine lifts a load of 400 N using an effort of 100 N. Its mechanical advantage is",
    "options": ["0.25", "2", "4", "5"],
    "answer": "4"
  },
  {
    "id": "PHY236",
    "topic": "Machines",
    "question": "The velocity ratio of a machine is the ratio of",
    "options": ["Load to effort", "Distance moved by effort to distance moved by load", "Effort to load", "Work output to work input"],
    "answer": "Distance moved by effort to distance moved by load"
  },
  {
    "id": "PHY237",
    "topic": "Machines",
    "question": "A machine has a mechanical advantage of 5 and velocity ratio of 10. Its efficiency is",
    "options": ["5%", "25%", "50%", "200%"],
    "answer": "50%"
  },
  {
    "id": "PHY238",
    "topic": "Friction",
    "question": "Friction acts in a direction",
    "options": ["Same as motion", "Opposite to relative motion", "Vertically upward only", "Vertically downward only"],
    "answer": "Opposite to relative motion"
  },
  {
    "id": "PHY239",
    "topic": "Friction",
    "question": "Which of the following is an advantage of friction?",
    "options": ["Wear of machine parts", "Heating of bearings", "Walking", "Energy loss"],
    "answer": "Walking"
  },
  {
    "id": "PHY240",
    "topic": "Friction",
    "question": "Lubrication reduces friction by",
    "options": ["Increasing roughness", "Separating surfaces with a fluid layer", "Increasing weight", "Increasing normal reaction"],
    "answer": "Separating surfaces with a fluid layer"
  },
  {
    "id": "PHY241",
    "topic": "Equilibrium",
    "question": "For a body to be in translational equilibrium, the resultant force must be",
    "options": ["Maximum", "Minimum", "Zero", "Constant but non-zero"],
    "answer": "Zero"
  },
  {
    "id": "PHY242",
    "topic": "Equilibrium",
    "question": "The turning effect of a force about a point is called",
    "options": ["Pressure", "Moment", "Impulse", "Power"],
    "answer": "Moment"
  },
  {
    "id": "PHY243",
    "topic": "Equilibrium",
    "question": "The moment of a force is calculated as",
    "options": ["Force × perpendicular distance", "Force ÷ distance", "Mass × velocity", "Force × time"],
    "answer": "Force × perpendicular distance"
  },
  {
    "id": "PHY244",
    "topic": "Equilibrium",
    "question": "A force of 20 N acts at a perpendicular distance of 0.5 m from a pivot. Its moment is",
    "options": ["5 Nm", "10 Nm", "20 Nm", "40 Nm"],
    "answer": "10 Nm"
  },
  {
    "id": "PHY245",
    "topic": "Centre of Gravity",
    "question": "The centre of gravity of a uniform circular disc is located at its",
    "options": ["Circumference", "Centre", "Top edge", "Bottom edge"],
    "answer": "Centre"
  },
  {
    "id": "PHY246",
    "topic": "Centre of Gravity",
    "question": "A body is more stable when its centre of gravity is",
    "options": ["High", "Low", "Outside the body", "Moving rapidly"],
    "answer": "Low"
  },
  {
    "id": "PHY247",
    "topic": "Gravitation",
    "question": "The force of gravitational attraction between two bodies depends on their",
    "options": ["Masses and separation", "Colours", "Temperatures only", "Volumes only"],
    "answer": "Masses and separation"
  },
  {
    "id": "PHY248",
    "topic": "Gravitation",
    "question": "The gravitational force between two bodies is proportional to the product of their",
    "options": ["Velocities", "Masses", "Densities", "Volumes"],
    "answer": "Masses"
  },
  {
    "id": "PHY249",
    "topic": "Gravitation",
    "question": "If the distance between two masses is doubled, their gravitational force becomes",
    "options": ["Twice as large", "Four times as large", "Half as large", "One-quarter as large"],
    "answer": "One-quarter as large"
  },
  {
    "id": "PHY250",
    "topic": "Gravitation",
    "question": "The weight of a body is given by",
    "options": ["m/g", "mg", "m+g", "m−g"],
    "answer": "mg"
  },
  {
    "id": "PHY251",
    "topic": "Density",
    "question": "Density is defined as",
    "options": ["Mass × volume", "Mass/volume", "Volume/mass", "Weight × volume"],
    "answer": "Mass/volume"
  },
  {
    "id": "PHY252",
    "topic": "Density",
    "question": "A substance has a mass of 200 g and volume of 50 cm³. Its density is",
    "options": ["2 g/cm³", "4 g/cm³", "10 g/cm³", "250 g/cm³"],
    "answer": "4 g/cm³"
  },
  {
    "id": "PHY253",
    "topic": "Pressure",
    "question": "Pressure is defined as",
    "options": ["Force × area", "Force/area", "Area/force", "Mass/area"],
    "answer": "Force/area"
  },
  {
    "id": "PHY254",
    "topic": "Pressure",
    "question": "A force of 100 N acts on an area of 2 m². The pressure is",
    "options": ["20 Pa", "50 Pa", "100 Pa", "200 Pa"],
    "answer": "50 Pa"
  },
  {
    "id": "PHY255",
    "topic": "Pressure in Fluids",
    "question": "Pressure in a liquid increases with",
    "options": ["Height above the surface", "Depth", "Colour", "Surface area only"],
    "answer": "Depth"
  },
  {
    "id": "PHY256",
    "topic": "Pressure in Fluids",
    "question": "The pressure exerted by a liquid at depth h is given by",
    "options": ["ρgh", "ρ/hg", "hg/ρ", "ρ+h+g"],
    "answer": "ρgh"
  },
  {
    "id": "PHY257",
    "topic": "Archimedes Principle",
    "question": "The upthrust on an immersed body is equal to the",
    "options": ["Weight of the body", "Weight of fluid displaced", "Mass of the body", "Volume of the body"],
    "answer": "Weight of fluid displaced"
  },
  {
    "id": "PHY258",
    "topic": "Floatation",
    "question": "A body floats in a liquid when its average density is",
    "options": ["Greater than the liquid", "Less than the liquid", "Equal to zero", "Infinite"],
    "answer": "Less than the liquid"
  },
  {
    "id": "PHY259",
    "topic": "Elasticity",
    "question": "Hooke's law states that, within the elastic limit, extension is proportional to",
    "options": ["Mass", "Applied force", "Density", "Volume"],
    "answer": "Applied force"
  },
  {
    "id": "PHY260",
    "topic": "Elasticity",
    "question": "The SI unit of spring constant is",
    "options": ["N", "N/m", "J", "Pa"],
    "answer": "N/m"
  },
  {
    "id": "PHY261",
    "topic": "Elasticity",
    "question": "A spring extends by 0.02 m when a force of 4 N is applied. Its spring constant is",
    "options": ["0.005 N/m", "20 N/m", "200 N/m", "400 N/m"],
    "answer": "200 N/m"
  },
  {
    "id": "PHY262",
    "topic": "Simple Harmonic Motion",
    "question": "In simple harmonic motion, acceleration is directed towards the",
    "options": ["Extreme position", "Mean position", "Highest point", "Lowest point"],
    "answer": "Mean position"
  },
  {
    "id": "PHY263",
    "topic": "Simple Harmonic Motion",
    "question": "The time taken for one complete oscillation is called",
    "options": ["Frequency", "Amplitude", "Period", "Wavelength"],
    "answer": "Period"
  },
  {
    "id": "PHY264",
    "topic": "Simple Harmonic Motion",
    "question": "The number of complete oscillations made per second is called",
    "options": ["Period", "Frequency", "Amplitude", "Phase"],
    "answer": "Frequency"
  },
  {
    "id": "PHY265",
    "topic": "Simple Harmonic Motion",
    "question": "The SI unit of frequency is",
    "options": ["Second", "Hertz", "Metre", "Newton"],
    "answer": "Hertz"
  },
  {
    "id": "PHY266",
    "topic": "Waves",
    "question": "A wave transfers",
    "options": ["Matter only", "Energy without necessarily transferring matter", "Mass permanently", "Particles from source to destination"],
    "answer": "Energy without necessarily transferring matter"
  },
  {
    "id": "PHY267",
    "topic": "Waves",
    "question": "The distance between two successive crests is called",
    "options": ["Amplitude", "Period", "Wavelength", "Frequency"],
    "answer": "Wavelength"
  },
  {
    "id": "PHY268",
    "topic": "Waves",
    "question": "The relationship between wave speed, frequency and wavelength is",
    "options": ["v = fλ", "v = f/λ", "v = λ/f", "v = f + λ"],
    "answer": "v = fλ"
  },
  {
    "id": "PHY269",
    "topic": "Waves",
    "question": "A wave has frequency 50 Hz and wavelength 2 m. Its speed is",
    "options": ["25 m/s", "50 m/s", "100 m/s", "200 m/s"],
    "answer": "100 m/s"
  },
  {
    "id": "PHY270",
    "topic": "Waves",
    "question": "Which of the following is a transverse wave?",
    "options": ["Sound wave in air", "Wave on a stretched string", "Compression wave", "Sound in a gas"],
    "answer": "Wave on a stretched string"
  },
  {
    "id": "PHY271",
    "topic": "Waves",
    "question": "Sound waves in air are",
    "options": ["Transverse", "Longitudinal", "Electromagnetic", "Stationary only"],
    "answer": "Longitudinal"
  },
  {
    "id": "PHY272",
    "topic": "Sound",
    "question": "Sound cannot travel through",
    "options": ["Air", "Water", "Steel", "Vacuum"],
    "answer": "Vacuum"
  },
  {
    "id": "PHY273",
    "topic": "Sound",
    "question": "The pitch of a sound depends mainly on its",
    "options": ["Frequency", "Amplitude", "Speed", "Intensity only"],
    "answer": "Frequency"
  },
  {
    "id": "PHY274",
    "topic": "Sound",
    "question": "The loudness of a sound is related mainly to its",
    "options": ["Frequency", "Amplitude", "Wavelength", "Period"],
    "answer": "Amplitude"
  },
  {
    "id": "PHY275",
    "topic": "Sound",
    "question": "An echo is caused by the",
    "options": ["Refraction of sound", "Reflection of sound", "Absorption of sound", "Polarization of sound"],
    "answer": "Reflection of sound"
  },
  {
    "id": "PHY276",
    "topic": "Heat",
    "question": "The SI unit of temperature is",
    "options": ["Degree Celsius", "Kelvin", "Fahrenheit", "Joule"],
    "answer": "Kelvin"
  },
  {
    "id": "PHY277",
    "topic": "Heat",
    "question": "Heat flows naturally from a body at",
    "options": ["Lower temperature to higher temperature", "Higher temperature to lower temperature", "Zero temperature to higher temperature only", "Any temperature to vacuum"],
    "answer": "Higher temperature to lower temperature"
  },
  {
    "id": "PHY278",
    "topic": "Thermal Expansion",
    "question": "Most substances expand when they are",
    "options": ["Cooled", "Heated", "Compressed", "Frozen"],
    "answer": "Heated"
  },
  {
    "id": "PHY279",
    "topic": "Thermal Expansion",
    "question": "Gaps are left between railway tracks mainly to allow for",
    "options": ["Contraction only", "Thermal expansion", "Corrosion", "Increase in mass"],
    "answer": "Thermal expansion"
  },
  {
    "id": "PHY280",
    "topic": "Specific Heat Capacity",
    "question": "Specific heat capacity is the heat required to raise the temperature of",
    "options": ["1 kg of a substance by 1 K", "Any mass by 10 K", "1 g by 100 K", "A whole object by 1°C"],
    "answer": "1 kg of a substance by 1 K"
  },
  {
    "id": "PHY281",
    "topic": "Specific Heat Capacity",
    "question": "The heat required to raise the temperature of a body is given by",
    "options": ["Q = mcΔθ", "Q = m/cΔθ", "Q = c/mΔθ", "Q = m+c+Δθ"],
    "answer": "Q = mcΔθ"
  },
  {
    "id": "PHY282",
    "topic": "Specific Heat Capacity",
    "question": "A 2 kg substance has specific heat capacity 500 J/kgK. The heat required to raise its temperature by 10 K is",
    "options": ["1,000 J", "5,000 J", "10,000 J", "20,000 J"],
    "answer": "10,000 J"
  },
  {
    "id": "PHY283",
    "topic": "Change of State",
    "question": "The temperature of a pure substance remains constant during a change of state because heat supplied is used mainly for",
    "options": ["Increasing kinetic energy", "Changing the state", "Increasing mass", "Increasing pressure only"],
    "answer": "Changing the state"
  },
  {
    "id": "PHY284",
    "topic": "Latent Heat",
    "question": "The heat required to change the state of a unit mass of a substance without temperature change is called",
    "options": ["Specific heat capacity", "Latent heat", "Thermal capacity", "Conductivity"],
    "answer": "Latent heat"
  },
  {
    "id": "PHY285",
    "topic": "Heat Transfer",
    "question": "Heat transfer through a metal rod occurs mainly by",
    "options": ["Conduction", "Convection", "Radiation", "Evaporation"],
    "answer": "Conduction"
  },
  {
    "id": "PHY286",
    "topic": "Heat Transfer",
    "question": "Heat transfer through fluids mainly by bulk movement is called",
    "options": ["Conduction", "Convection", "Radiation", "Reflection"],
    "answer": "Convection"
  },
  {
    "id": "PHY287",
    "topic": "Heat Transfer",
    "question": "Heat from the Sun reaches Earth mainly by",
    "options": ["Conduction", "Convection", "Radiation", "Evaporation"],
    "answer": "Radiation"
  },
  {
    "id": "PHY288",
    "topic": "Gas Laws",
    "question": "Boyle's law states that for a fixed mass of gas at constant temperature, pressure is",
    "options": ["Directly proportional to volume", "Inversely proportional to volume", "Equal to volume", "Independent of volume"],
    "answer": "Inversely proportional to volume"
  },
  {
    "id": "PHY289",
    "topic": "Gas Laws",
    "question": "Charles' law relates the volume of a gas to its",
    "options": ["Temperature at constant pressure", "Pressure at constant mass only", "Density only", "Mass only"],
    "answer": "Temperature at constant pressure"
  },
  {
    "id": "PHY290",
    "topic": "Optics",
    "question": "Light travels in a vacuum at approximately",
    "options": ["3.0 × 10⁶ m/s", "3.0 × 10⁷ m/s", "3.0 × 10⁸ m/s", "3.0 × 10⁹ m/s"],
    "answer": "3.0 × 10⁸ m/s"
  },
  {
    "id": "PHY291",
    "topic": "Reflection of Light",
    "question": "The angle of incidence is equal to the angle of",
    "options": ["Refraction", "Reflection", "Deviation", "Diffraction"],
    "answer": "Reflection"
  },
  {
    "id": "PHY292",
    "topic": "Reflection of Light",
    "question": "A plane mirror produces an image that is",
    "options": ["Real and inverted", "Virtual and upright", "Real and upright", "Always magnified"],
    "answer": "Virtual and upright"
  },
  {
    "id": "PHY293",
    "topic": "Reflection of Light",
    "question": "The image formed by a plane mirror is laterally",
    "options": ["Magnified", "Inverted", "Reversed", "Reduced"],
    "answer": "Reversed"
  },
  {
    "id": "PHY294",
    "topic": "Refraction",
    "question": "The bending of light as it passes from one medium to another is called",
    "options": ["Reflection", "Refraction", "Diffraction", "Interference"],
    "answer": "Refraction"
  },
  {
    "id": "PHY295",
    "topic": "Refraction",
    "question": "When light passes from air into glass, it generally bends",
    "options": ["Away from the normal", "Towards the normal", "Along the surface", "Back into air"],
    "answer": "Towards the normal"
  },
  {
    "id": "PHY296",
    "topic": "Refraction",
    "question": "The refractive index of a medium is related to the speed of light in",
    "options": ["That medium and vacuum", "Only air", "Only water", "Only glass"],
    "answer": "That medium and vacuum"
  },
  {
    "id": "PHY297",
    "topic": "Lenses",
    "question": "A convex lens is also called a",
    "options": ["Diverging lens", "Converging lens", "Plane lens", "Reflecting lens"],
    "answer": "Converging lens"
  },
  {
    "id": "PHY298",
    "topic": "Lenses",
    "question": "A concave lens is a",
    "options": ["Converging lens", "Diverging lens", "Cylindrical mirror", "Plane mirror"],
    "answer": "Diverging lens"
  },
  {
    "id": "PHY299",
    "topic": "Lenses",
    "question": "The power of a lens is measured in",
    "options": ["Metres", "Dioptres", "Watts", "Newtons"],
    "answer": "Dioptres"
  },
  {
    "id": "PHY300",
    "topic": "Lenses",
    "question": "A lens has focal length 0.5 m. Its power is",
    "options": ["0.5 D", "1 D", "2 D", "5 D"],
    "answer": "2 D"
  },
  {
    "id": "PHY301",
    "topic": "Optical Instruments",
    "question": "The instrument used to view distant objects in space is the",
    "options": ["Microscope", "Telescope", "Periscope", "Camera"],
    "answer": "Telescope"
  },
  {
    "id": "PHY302",
    "topic": "Optical Instruments",
    "question": "A microscope is used mainly to view",
    "options": ["Very distant stars", "Very small objects", "Sound waves", "Radio waves"],
    "answer": "Very small objects"
  },
  {
    "id": "PHY303",
    "topic": "Electromagnetic Waves",
    "question": "Which electromagnetic wave has the highest frequency?",
    "options": ["Radio waves", "Microwaves", "X-rays", "Gamma rays"],
    "answer": "Gamma rays"
  },
  {
    "id": "PHY304",
    "topic": "Electromagnetic Waves",
    "question": "Which electromagnetic radiation is commonly used in television remote controls?",
    "options": ["Ultraviolet", "Infrared", "X-rays", "Gamma rays"],
    "answer": "Infrared"
  },
  {
    "id": "PHY305",
    "topic": "Electromagnetic Waves",
    "question": "Ultraviolet radiation can cause",
    "options": ["Sunburn", "Hearing", "Mechanical vibration only", "Magnetic attraction"],
    "answer": "Sunburn"
  },
  {
    "id": "PHY306",
    "topic": "Electrostatics",
    "question": "Like electric charges",
    "options": ["Attract", "Repel", "Neutralize immediately", "Have no interaction"],
    "answer": "Repel"
  },
  {
    "id": "PHY307",
    "topic": "Electrostatics",
    "question": "Unlike electric charges",
    "options": ["Repel", "Attract", "Always disappear", "Have no force"],
    "answer": "Attract"
  },
  {
    "id": "PHY308",
    "topic": "Electrostatics",
    "question": "The SI unit of electric charge is",
    "options": ["Ampere", "Coulomb", "Volt", "Ohm"],
    "answer": "Coulomb"
  },
  {
    "id": "PHY309",
    "topic": "Electrostatics",
    "question": "An object becomes negatively charged when it",
    "options": ["Loses electrons", "Gains electrons", "Loses protons", "Gains neutrons"],
    "answer": "Gains electrons"
  },
  {
    "id": "PHY310",
    "topic": "Electric Field",
    "question": "The force experienced per unit positive charge at a point is called",
    "options": ["Electric potential", "Electric field strength", "Resistance", "Capacitance"],
    "answer": "Electric field strength"
  },
  {
    "id": "PHY311",
    "topic": "Current Electricity",
    "question": "Electric current is the rate of flow of",
    "options": ["Mass", "Charge", "Energy", "Resistance"],
    "answer": "Charge"
  },
  {
    "id": "PHY312",
    "topic": "Current Electricity",
    "question": "The relationship between charge, current and time is",
    "options": ["Q = It", "Q = I/t", "Q = t/I", "Q = I+t"],
    "answer": "Q = It"
  },
  {
    "id": "PHY313",
    "topic": "Current Electricity",
    "question": "A current of 2 A flows for 5 s. The charge transferred is",
    "options": ["0.4 C", "2.5 C", "7 C", "10 C"],
    "answer": "10 C"
  },
  {
    "id": "PHY314",
    "topic": "Potential Difference",
    "question": "Potential difference is measured in",
    "options": ["Amperes", "Volts", "Ohms", "Coulombs"],
    "answer": "Volts"
  },
  {
    "id": "PHY315",
    "topic": "Ohm's Law",
    "question": "Ohm's law states that, at constant temperature, current is proportional to",
    "options": ["Resistance", "Potential difference", "Power", "Charge"],
    "answer": "Potential difference"
  },
  {
    "id": "PHY316",
    "topic": "Ohm's Law",
    "question": "A 12 V battery is connected across a 4 Ω resistor. The current is",
    "options": ["2 A", "3 A", "4 A", "48 A"],
    "answer": "3 A"
  },
  {
    "id": "PHY317",
    "topic": "Resistance",
    "question": "The SI unit of resistance is",
    "options": ["Volt", "Ampere", "Ohm", "Watt"],
    "answer": "Ohm"
  },
  {
    "id": "PHY318",
    "topic": "Resistance",
    "question": "The resistance of a wire depends on its",
    "options": ["Length and cross-sectional area", "Colour only", "Mass only", "Weight only"],
    "answer": "Length and cross-sectional area"
  },
  {
    "id": "PHY319",
    "topic": "Electrical Power",
    "question": "Electrical power is given by",
    "options": ["P = VI", "P = V/I", "P = I/V", "P = V+I"],
    "answer": "P = VI"
  },
  {
    "id": "PHY320",
    "topic": "Electrical Power",
    "question": "A device operates at 240 V and draws 2 A. Its power is",
    "options": ["120 W", "240 W", "480 W", "960 W"],
    "answer": "480 W"
  },
  {
    "id": "PHY321",
    "topic": "Electrical Energy",
    "question": "The commercial unit of electrical energy is",
    "options": ["Watt", "Kilowatt-hour", "Volt", "Ampere"],
    "answer": "Kilowatt-hour"
  },
  {
    "id": "PHY322",
    "topic": "Electrical Circuits",
    "question": "In a series circuit, the current through each resistor is",
    "options": ["Different", "The same", "Always zero", "Infinite"],
    "answer": "The same"
  },
  {
    "id": "PHY323",
    "topic": "Electrical Circuits",
    "question": "In a parallel circuit, the potential difference across each branch is",
    "options": ["The same", "Always zero", "Different in every case", "Infinite"],
    "answer": "The same"
  },
  {
    "id": "PHY324",
    "topic": "Electrical Circuits",
    "question": "Two 4 Ω resistors connected in series have an equivalent resistance of",
    "options": ["1 Ω", "2 Ω", "4 Ω", "8 Ω"],
    "answer": "8 Ω"
  },
  {
    "id": "PHY325",
    "topic": "Electrical Circuits",
    "question": "Two 6 Ω resistors connected in parallel have an equivalent resistance of",
    "options": ["3 Ω", "6 Ω", "12 Ω", "36 Ω"],
    "answer": "3 Ω"
  },
  {
    "id": "PHY326",
    "topic": "Cells and Batteries",
    "question": "The electromotive force of a cell is measured in",
    "options": ["Amperes", "Volts", "Ohms", "Coulombs"],
    "answer": "Volts"
  },
  {
    "id": "PHY327",
    "topic": "Cells and Batteries",
    "question": "The internal resistance of a cell causes some energy to be",
    "options": ["Lost inside the cell", "Created inside the circuit", "Destroyed completely", "Converted into mass"],
    "answer": "Lost inside the cell"
  },
  {
    "id": "PHY328",
    "topic": "Capacitors",
    "question": "A capacitor is used mainly to",
    "options": ["Store electric charge", "Measure current", "Produce sound", "Measure temperature"],
    "answer": "Store electric charge"
  },
  {
    "id": "PHY329",
    "topic": "Capacitors",
    "question": "The SI unit of capacitance is",
    "options": ["Farad", "Henry", "Tesla", "Weber"],
    "answer": "Farad"
  },
  {
    "id": "PHY330",
    "topic": "Magnetism",
    "question": "Like magnetic poles",
    "options": ["Attract", "Repel", "Neutralize", "Have no interaction"],
    "answer": "Repel"
  },
  {
    "id": "PHY331",
    "topic": "Magnetism",
    "question": "The region around a magnet where magnetic force can be detected is called",
    "options": ["Electric field", "Magnetic field", "Gravitational field", "Neutral zone"],
    "answer": "Magnetic field"
  },
  {
    "id": "PHY332",
    "topic": "Magnetism",
    "question": "The magnetic field lines outside a bar magnet run from",
    "options": ["South to south", "North to south", "South to north only", "Centre to edge"],
    "answer": "North to south"
  },
  {
    "id": "PHY333",
    "topic": "Electromagnetism",
    "question": "A current-carrying conductor produces",
    "options": ["Only heat", "A magnetic field", "Only light", "Gravity"],
    "answer": "A magnetic field"
  },
  {
    "id": "PHY334",
    "topic": "Electromagnetism",
    "question": "The force on a current-carrying conductor in a magnetic field is the principle behind the",
    "options": ["Electric motor", "Transformer only", "Thermometer", "Barometer"],
    "answer": "Electric motor"
  },
  {
    "id": "PHY335",
    "topic": "Electromagnetic Induction",
    "question": "Electromagnetic induction is the production of",
    "options": ["Heat by friction", "EMF by changing magnetic flux", "Mass by electricity", "Sound by pressure"],
    "answer": "EMF by changing magnetic flux"
  },
  {
    "id": "PHY336",
    "topic": "Electromagnetic Induction",
    "question": "The device that converts mechanical energy into electrical energy is the",
    "options": ["Motor", "Generator", "Transformer", "Rectifier"],
    "answer": "Generator"
  },
  {
    "id": "PHY337",
    "topic": "Transformers",
    "question": "A transformer operates using",
    "options": ["Direct current only", "Alternating current", "Static electricity", "Chemical energy"],
    "answer": "Alternating current"
  },
  {
    "id": "PHY338",
    "topic": "Transformers",
    "question": "A step-up transformer",
    "options": ["Decreases voltage", "Increases voltage", "Produces direct current", "Eliminates current"],
    "answer": "Increases voltage"
  },
  {
    "id": "PHY339",
    "topic": "Transformers",
    "question": "For an ideal transformer, if the secondary turns are greater than the primary turns, the transformer is",
    "options": ["Step-down", "Step-up", "An isolator only", "A rectifier"],
    "answer": "Step-up"
  },
  {
    "id": "PHY340",
    "topic": "Alternating Current",
    "question": "The direction of current in an alternating-current circuit",
    "options": ["Never changes", "Changes periodically", "Changes once only", "Is always zero"],
    "answer": "Changes periodically"
  },
  {
    "id": "PHY341",
    "topic": "Semiconductors",
    "question": "A semiconductor has electrical conductivity between that of a",
    "options": ["Conductor and insulator", "Magnet and conductor", "Liquid and gas", "Solid and liquid"],
    "answer": "Conductor and insulator"
  },
  {
    "id": "PHY342",
    "topic": "Semiconductors",
    "question": "Which of the following is a semiconductor?",
    "options": ["Copper", "Silicon", "Aluminium", "Silver"],
    "answer": "Silicon"
  },
  {
    "id": "PHY343",
    "topic": "Diodes",
    "question": "A diode allows current to flow mainly in",
    "options": ["Both directions equally", "One direction", "No direction", "Random directions"],
    "answer": "One direction"
  },
  {
    "id": "PHY344",
    "topic": "Rectification",
    "question": "A diode can be used to convert",
    "options": ["DC to AC", "AC to DC", "Heat to mass", "Sound to light only"],
    "answer": "AC to DC"
  },
  {
    "id": "PHY345",
    "topic": "Transistors",
    "question": "A transistor can be used as an electronic",
    "options": ["Amplifier", "Thermometer", "Barometer", "Balance"],
    "answer": "Amplifier"
  },
  {
    "id": "PHY346",
    "topic": "Logic Gates",
    "question": "An AND gate gives an output of 1 when",
    "options": ["At least one input is 1", "All inputs are 1", "All inputs are 0", "No input exists"],
    "answer": "All inputs are 1"
  },
  {
    "id": "PHY347",
    "topic": "Logic Gates",
    "question": "An OR gate gives an output of 0 when",
    "options": ["All inputs are 0", "All inputs are 1", "One input is 1", "One input is 0"],
    "answer": "All inputs are 0"
  },
  {
    "id": "PHY348",
    "topic": "Atomic Physics",
    "question": "The central part of an atom is called the",
    "options": ["Electron cloud", "Nucleus", "Shell", "Orbit"],
    "answer": "Nucleus"
  },
  {
    "id": "PHY349",
    "topic": "Atomic Physics",
    "question": "The charge on an electron is",
    "options": ["Positive", "Negative", "Neutral", "Variable"],
    "answer": "Negative"
  },
  {
    "id": "PHY350",
    "topic": "Atomic Physics",
    "question": "The particle in an atom with no electric charge is the",
    "options": ["Proton", "Electron", "Neutron", "Positron"],
    "answer": "Neutron"
  },
  {
    "id": "PHY351",
    "topic": "Atomic Physics",
    "question": "The atomic number of an element is equal to the number of",
    "options": ["Neutrons", "Protons", "Nucleons", "Shells"],
    "answer": "Protons"
  },
  {
    "id": "PHY352",
    "topic": "Atomic Physics",
    "question": "The mass number of an atom is the total number of",
    "options": ["Protons and neutrons", "Electrons and protons", "Electrons and neutrons", "Electrons only"],
    "answer": "Protons and neutrons"
  },
  {
    "id": "PHY353",
    "topic": "Radioactivity",
    "question": "Radioactivity is the spontaneous disintegration of",
    "options": ["Stable molecules", "Unstable atomic nuclei", "Electrons only", "Water molecules"],
    "answer": "Unstable atomic nuclei"
  },
  {
    "id": "PHY354",
    "topic": "Radioactivity",
    "question": "Which radioactive emission has the greatest penetrating power?",
    "options": ["Alpha particles", "Beta particles", "Gamma rays", "Positrons"],
    "answer": "Gamma rays"
  },
  {
    "id": "PHY355",
    "topic": "Radioactivity",
    "question": "An alpha particle is essentially a",
    "options": ["Electron", "Helium nucleus", "Photon", "Neutron"],
    "answer": "Helium nucleus"
  },
  {
    "id": "PHY356",
    "topic": "Radioactivity",
    "question": "Beta radiation consists mainly of",
    "options": ["Fast electrons or positrons", "Helium nuclei", "Neutrons only", "Photons only"],
    "answer": "Fast electrons or positrons"
  },
  {
    "id": "PHY357",
    "topic": "Radioactivity",
    "question": "The half-life of a radioactive substance is the time required for",
    "options": ["All nuclei to decay", "Half the radioactive nuclei to decay", "The temperature to halve", "The mass to double"],
    "answer": "Half the radioactive nuclei to decay"
  },
  {
    "id": "PHY358",
    "topic": "Nuclear Physics",
    "question": "Nuclear fission involves the",
    "options": ["Joining of light nuclei", "Splitting of a heavy nucleus", "Removal of electrons", "Freezing of atoms"],
    "answer": "Splitting of a heavy nucleus"
  },
  {
    "id": "PHY359",
    "topic": "Nuclear Physics",
    "question": "Nuclear fusion involves the",
    "options": ["Splitting of heavy nuclei", "Combining of light nuclei", "Loss of electrons only", "Breaking of chemical bonds"],
    "answer": "Combining of light nuclei"
  },
  {
    "id": "PHY360",
    "topic": "Nuclear Physics",
    "question": "The energy released in nuclear reactions is associated with",
    "options": ["Mass-energy equivalence", "Chemical colour", "Pressure alone", "Sound intensity"],
    "answer": "Mass-energy equivalence"
  },
  {
    "id": "PHY361",
    "topic": "Electromagnetic Waves",
    "question": "Which electromagnetic wave has the longest wavelength?",
    "options": ["Gamma rays", "X-rays", "Radio waves", "Ultraviolet"],
    "answer": "Radio waves"
  },
  {
    "id": "PHY362",
    "topic": "Electromagnetic Waves",
    "question": "Microwaves are commonly used in",
    "options": ["Radar", "Bone formation", "Nuclear fission", "Measuring mass"],
    "answer": "Radar"
  },
  {
    "id": "PHY363",
    "topic": "Electromagnetic Waves",
    "question": "X-rays are commonly used for",
    "options": ["Medical imaging", "Cooking food only", "Radio broadcasting", "Measuring rainfall"],
    "answer": "Medical imaging"
  },
  {
    "id": "PHY364",
    "topic": "Waves",
    "question": "Diffraction is the",
    "options": ["Bending/spreading of waves around obstacles or through openings", "Reflection of light", "Absorption of sound", "Production of heat"],
    "answer": "Bending/spreading of waves around obstacles or through openings"
  },
  {
    "id": "PHY365",
    "topic": "Waves",
    "question": "Interference occurs when two or more waves",
    "options": ["Meet and superpose", "Disappear permanently", "Stop moving", "Become particles"],
    "answer": "Meet and superpose"
  },
  {
    "id": "PHY366",
    "topic": "Waves",
    "question": "Constructive interference occurs when waves meet",
    "options": ["In phase", "Exactly out of phase", "At zero speed", "Without amplitudes"],
    "answer": "In phase"
  },
  {
    "id": "PHY367",
    "topic": "Sound",
    "question": "The phenomenon in which an object vibrates strongly at its natural frequency is",
    "options": ["Refraction", "Resonance", "Diffraction", "Dispersion"],
    "answer": "Resonance"
  },
  {
    "id": "PHY368",
    "topic": "Sound",
    "question": "The apparent change in frequency due to relative motion between source and observer is called",
    "options": ["Doppler effect", "Photoelectric effect", "Hall effect", "Compton effect"],
    "answer": "Doppler effect"
  },
  {
    "id": "PHY369",
    "topic": "Optics",
    "question": "White light can be separated into colours by",
    "options": ["Dispersion", "Conduction", "Magnetization", "Evaporation"],
    "answer": "Dispersion"
  },
  {
    "id": "PHY370",
    "topic": "Optics",
    "question": "The colour with the longest wavelength in the visible spectrum is",
    "options": ["Violet", "Blue", "Green", "Red"],
    "answer": "Red"
  },
  {
    "id": "PHY371",
    "topic": "Optics",
    "question": "Total internal reflection occurs when light travels from",
    "options": ["A denser to a less dense medium at an angle greater than the critical angle", "A less dense to denser medium only", "Vacuum to air only", "Air to glass at normal incidence"],
    "answer": "A denser to a less dense medium at an angle greater than the critical angle"
  },
  {
    "id": "PHY372",
    "topic": "Optical Instruments",
    "question": "Optical fibres operate mainly on the principle of",
    "options": ["Total internal reflection", "Diffraction", "Dispersion only", "Polarization only"],
    "answer": "Total internal reflection"
  },
  {
    "id": "PHY373",
    "topic": "Electrostatics",
    "question": "Coulomb's law describes the force between",
    "options": ["Two electric charges", "Two masses only", "Two springs", "Two waves"],
    "answer": "Two electric charges"
  },
  {
    "id": "PHY374",
    "topic": "Electrostatics",
    "question": "The force between two point charges decreases when their separation is",
    "options": ["Decreased", "Increased", "Made zero", "Held constant"],
    "answer": "Increased"
  },
  {
    "id": "PHY375",
    "topic": "Electric Potential",
    "question": "Electric potential at a point is the work done per unit",
    "options": ["Mass", "Positive charge", "Time", "Current"],
    "answer": "Positive charge"
  },
  {
    "id": "PHY376",
    "topic": "Electricity",
    "question": "A fuse protects an electrical circuit by",
    "options": ["Increasing current", "Melting when excessive current flows", "Increasing voltage", "Storing charge"],
    "answer": "Melting when excessive current flows"
  },
  {
    "id": "PHY377",
    "topic": "Electrical Safety",
    "question": "The earth wire in a domestic electrical system is primarily used to",
    "options": ["Increase voltage", "Provide a safe path for fault current", "Supply current to appliances", "Store charge"],
    "answer": "Provide a safe path for fault current"
  },
  {
    "id": "PHY378",
    "topic": "Electrical Safety",
    "question": "A circuit breaker operates by",
    "options": ["Opening the circuit when excessive current flows", "Increasing resistance permanently", "Generating electricity", "Reducing voltage to zero always"],
    "answer": "Opening the circuit when excessive current flows"
  },
  {
    "id": "PHY379",
    "topic": "Magnetism",
    "question": "The unit of magnetic flux density is",
    "options": ["Tesla", "Weber", "Henry", "Farad"],
    "answer": "Tesla"
  },
  {
    "id": "PHY380",
    "topic": "Magnetism",
    "question": "The unit of magnetic flux is",
    "options": ["Tesla", "Weber", "Volt", "Ohm"],
    "answer": "Weber"
  },
  {
    "id": "PHY381",
    "topic": "Electromagnetism",
    "question": "The strength of an electromagnet can be increased by",
    "options": ["Reducing the number of turns", "Increasing the current through the coil", "Removing the iron core", "Reducing the current"],
    "answer": "Increasing the current through the coil"
  },
  {
    "id": "PHY382",
    "topic": "Electromagnetism",
    "question": "The core of a simple electromagnet is commonly made of",
    "options": ["Soft iron", "Wood", "Glass", "Rubber"],
    "answer": "Soft iron"
  },
  {
    "id": "PHY383",
    "topic": "Electric Motor",
    "question": "An electric motor converts",
    "options": ["Mechanical energy to electrical energy", "Electrical energy to mechanical energy", "Heat to nuclear energy", "Light to sound"],
    "answer": "Electrical energy to mechanical energy"
  },
  {
    "id": "PHY384",
    "topic": "Generator",
    "question": "An electric generator converts",
    "options": ["Electrical energy to mechanical energy", "Mechanical energy to electrical energy", "Chemical energy to heat only", "Light to sound"],
    "answer": "Mechanical energy to electrical energy"
  },
  {
    "id": "PHY385",
    "topic": "Transformers",
    "question": "Transformers are used mainly to change",
    "options": ["AC voltage", "DC mass", "Frequency of light", "Resistance of air"],
    "answer": "AC voltage"
  },
  {
    "id": "PHY386",
    "topic": "Transformers",
    "question": "A transformer has 100 primary turns and 500 secondary turns. If the primary voltage is 20 V, the secondary voltage is",
    "options": ["4 V", "20 V", "100 V", "500 V"],
    "answer": "100 V"
  },
  {
    "id": "PHY387",
    "topic": "Alternating Current",
    "question": "The frequency of standard domestic AC supply in Nigeria is approximately",
    "options": ["25 Hz", "50 Hz", "60 Hz", "100 Hz"],
    "answer": "50 Hz"
  },
  {
    "id": "PHY388",
    "topic": "Alternating Current",
    "question": "The root-mean-square value of an alternating voltage represents its",
    "options": ["Heating/equivalent DC value", "Maximum frequency only", "Zero value", "Wavelength"],
    "answer": "Heating/equivalent DC value"
  },
  {
    "id": "PHY389",
    "topic": "Electronic Devices",
    "question": "An LED converts electrical energy mainly into",
    "options": ["Light", "Sound", "Mechanical motion", "Nuclear energy"],
    "answer": "Light"
  },
  {
    "id": "PHY390",
    "topic": "Electronic Devices",
    "question": "A thermistor is a resistor whose resistance changes significantly with",
    "options": ["Temperature", "Mass", "Length only", "Pressure only"],
    "answer": "Temperature"
  },
  {
    "id": "PHY391",
    "topic": "Atomic Physics",
    "question": "The emission of electrons from a metal surface when light of suitable frequency falls on it is called",
    "options": ["Photoelectric effect", "Thermionic effect", "Electromagnetic induction", "Nuclear fission"],
    "answer": "Photoelectric effect"
  },
  {
    "id": "PHY392",
    "topic": "Atomic Physics",
    "question": "The minimum frequency of light required to cause photoelectric emission is called",
    "options": ["Natural frequency", "Threshold frequency", "Resonant frequency", "Critical current"],
    "answer": "Threshold frequency"
  },
  {
    "id": "PHY393",
    "topic": "Atomic Physics",
    "question": "The energy of a photon is proportional to its",
    "options": ["Wavelength", "Frequency", "Speed squared", "Mass only"],
    "answer": "Frequency"
  },
  {
    "id": "PHY394",
    "topic": "Atomic Physics",
    "question": "The energy of a photon is given by",
    "options": ["E = hf", "E = h/f", "E = f/h", "E = mc"],
    "answer": "E = hf"
  },
  {
    "id": "PHY395",
    "topic": "Nuclear Physics",
    "question": "The process by which an unstable nucleus becomes more stable by emitting radiation is",
    "options": ["Radioactive decay", "Evaporation", "Condensation", "Electrolysis"],
    "answer": "Radioactive decay"
  },
  {
    "id": "PHY396",
    "topic": "Nuclear Physics",
    "question": "Which radiation is least penetrating?",
    "options": ["Alpha", "Beta", "Gamma", "X-ray"],
    "answer": "Alpha"
  },
  {
    "id": "PHY397",
    "topic": "Nuclear Physics",
    "question": "A major application of radioactive isotopes is",
    "options": ["Medical diagnosis and treatment", "Increasing gravity", "Producing ordinary sound", "Measuring room temperature only"],
    "answer": "Medical diagnosis and treatment"
  },
  {
    "id": "PHY398",
    "topic": "Nuclear Physics",
    "question": "Nuclear reactors primarily use controlled",
    "options": ["Fusion", "Fission", "Combustion", "Evaporation"],
    "answer": "Fission"
  },
  {
    "id": "PHY399",
    "topic": "Nuclear Physics",
    "question": "The chain reaction in a nuclear reactor is controlled mainly by",
    "options": ["Control rods", "Thermometers", "Mirrors", "Magnets"],
    "answer": "Control rods"
  },
  {
    "id": "PHY400",
    "topic": "Physics and Technology",
    "question": "Which device is used to convert solar energy directly into electrical energy?",
    "options": ["Solar cell", "Transformer", "Electric motor", "Loudspeaker"],
    "answer": "Solar cell"
  }

  ],

"Chemistry":[
  {
      "id": 1,
      "topic": "Electrochemistry & Cells",
      "question": "The function of a salt bridge in an electrochemical cell is to",
      "options": {
        "A": "Increase the voltage of the cell",
        "B": "Generate electrons for the circuit",
        "C": "Act as the main electrolyte",
        "D": "Maintain electrical neutrality by allowing ion flow between half-cells"
      },
      "answer": "D"
    },
    {
      "id": 2,
      "topic": "Nuclear Chemistry",
      "question": "When an atom emits an alpha particle, its mass number decreases by",
      "options": {
        "A": "4",
        "B": "1",
        "C": "2",
        "D": "8"
      },
      "answer": "A"
    },
    {
      "id": 3,
      "topic": "States of Matter",
      "question": "The law stating that at constant pressure, the volume of a fixed mass of gas is directly proportional to its absolute temperature is",
      "options": {
        "A": "Boyle's law",
        "B": "Dalton's law",
        "C": "Graham's law",
        "D": "Charles's law"
      },
      "answer": "D"
    },
    {
      "id": 4,
      "topic": "Separation of Mixtures",
      "question": "A separating funnel is used to separate",
      "options": {
        "A": "Two miscible liquids",
        "B": "Two gases",
        "C": "A solid from a liquid",
        "D": "Two immiscible liquids"
      },
      "answer": "D"
    },
    {
      "id": 5,
      "topic": "Nuclear Chemistry",
      "question": "Alpha particles are essentially",
      "options": {
        "A": "Neutrons only",
        "B": "High-energy electrons",
        "C": "Electromagnetic waves",
        "D": "Helium nuclei (2 protons and 2 neutrons)"
      },
      "answer": "D"
    },
    {
      "id": 6,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "The functional group of alcohols is",
      "options": {
        "A": "-OH",
        "B": "-NH2",
        "C": "-COOH",
        "D": "-CHO"
      },
      "answer": "A"
    },
    {
      "id": 7,
      "topic": "Electrochemistry & Cells",
      "question": "Which of the following metals would displace copper from copper(II) sulfate solution?",
      "options": {
        "A": "Platinum",
        "B": "Zinc",
        "C": "Silver",
        "D": "Gold"
      },
      "answer": "B"
    },
    {
      "id": 8,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "Ethanol can be produced industrially by the fermentation of",
      "options": {
        "A": "Ethene and steam only",
        "B": "Glucose (sugar) using yeast",
        "C": "Methane gas",
        "D": "Sodium chloride"
      },
      "answer": "B"
    },
    {
      "id": 9,
      "topic": "Chemical Equilibrium",
      "question": "In the Haber process, N2 + 3H2 <-> 2NH3, increasing the pressure favors",
      "options": {
        "A": "No change in the equilibrium position",
        "B": "The formation of more ammonia",
        "C": "The formation of more nitrogen",
        "D": "The decomposition of ammonia"
      },
      "answer": "B"
    },
    {
      "id": 10,
      "topic": "Oxidation-Reduction",
      "question": "The oxidation number of oxygen in most of its compounds is",
      "options": {
        "A": "-1",
        "B": "0",
        "C": "-2",
        "D": "+2"
      },
      "answer": "C"
    },
    {
      "id": 11,
      "topic": "Acids, Bases & Salts",
      "question": "The reaction between an acid and a base to form a salt and water is called",
      "options": {
        "A": "Neutralization",
        "B": "Hydrolysis",
        "C": "Sublimation",
        "D": "Oxidation"
      },
      "answer": "A"
    },
    {
      "id": 12,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "The percentage of oxygen by mass in CaCO3 (molar mass = 100 g/mol) is",
      "options": {
        "A": "48%",
        "B": "40%",
        "C": "12%",
        "D": "60%"
      },
      "answer": "A"
    },
    {
      "id": 13,
      "topic": "Chemical Equilibrium",
      "question": "Increasing the pressure on a gaseous equilibrium favors the side with",
      "options": {
        "A": "More moles of gas",
        "B": "Fewer moles of gas",
        "C": "No gas molecules present",
        "D": "Equal moles of gas on both sides"
      },
      "answer": "B"
    },
    {
      "id": 14,
      "topic": "States of Matter",
      "question": "The law stating that the pressure of a fixed mass of gas at constant temperature is inversely proportional to its volume is",
      "options": {
        "A": "Avogadro's law",
        "B": "Boyle's law",
        "C": "Charles's law",
        "D": "Gay-Lussac's law"
      },
      "answer": "B"
    },
    {
      "id": 15,
      "topic": "Industrial Chemistry",
      "question": "Portland cement is manufactured mainly from",
      "options": {
        "A": "Sand and salt",
        "B": "Bauxite only",
        "C": "Sulfur and iron",
        "D": "Limestone and clay"
      },
      "answer": "D"
    },
    {
      "id": 16,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "Which law states that in a chemical reaction, mass is neither created nor destroyed?",
      "options": {
        "A": "Law of multiple proportions",
        "B": "Law of conservation of mass",
        "C": "Avogadro's law",
        "D": "Law of definite proportions"
      },
      "answer": "B"
    },
    {
      "id": 17,
      "topic": "Atomic Structure",
      "question": "The electron configuration of an atom with atomic number 11 is",
      "options": {
        "A": "2,9",
        "B": "1,8,2",
        "C": "2,8,2",
        "D": "2,8,1"
      },
      "answer": "D"
    },
    {
      "id": 18,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "Which apparatus is commonly used to measure heat changes in a reaction?",
      "options": {
        "A": "Burette",
        "B": "Separating funnel",
        "C": "Calorimeter",
        "D": "Pipette"
      },
      "answer": "C"
    },
    {
      "id": 19,
      "topic": "Water & Hydrogen",
      "question": "Hard water contains appreciable amounts of dissolved",
      "options": {
        "A": "Calcium and magnesium salts",
        "B": "Chlorine gas",
        "C": "Dissolved oxygen only",
        "D": "Sodium chloride only"
      },
      "answer": "A"
    },
    {
      "id": 20,
      "topic": "Chemical Bonding",
      "question": "Metallic bonding is best described as",
      "options": {
        "A": "Sharing of electron pairs",
        "B": "Attraction between two non-metal atoms",
        "C": "A lattice of positive ions surrounded by delocalized electrons",
        "D": "Transfer of electrons between metal atoms"
      },
      "answer": "C"
    },
    {
      "id": 21,
      "topic": "Carbon & Hydrocarbons",
      "question": "Which of the following is a chemical test for unsaturation in a hydrocarbon (alkenes)?",
      "options": {
        "A": "Effervescence with sodium carbonate",
        "B": "Decolorization of bromine water",
        "C": "Precipitation with silver nitrate",
        "D": "Color change with universal indicator"
      },
      "answer": "B"
    },
    {
      "id": 22,
      "topic": "Separation of Mixtures",
      "question": "Which property is exploited in the fractional distillation of crude oil?",
      "options": {
        "A": "Differences in density",
        "B": "Differences in particle size",
        "C": "Differences in boiling points",
        "D": "Differences in solubility"
      },
      "answer": "C"
    },
    {
      "id": 23,
      "topic": "Industrial Chemistry",
      "question": "The extraction of iron from its ore in the blast furnace uses",
      "options": {
        "A": "Distillation",
        "B": "Electrolysis",
        "C": "Coke (carbon) as the reducing agent",
        "D": "Fermentation"
      },
      "answer": "C"
    },
    {
      "id": 24,
      "topic": "Acids, Bases & Salts",
      "question": "Which indicator turns pink in a basic (alkaline) solution?",
      "options": {
        "A": "Universal indicator at pH 3",
        "B": "Phenolphthalein",
        "C": "Red litmus",
        "D": "Methyl orange"
      },
      "answer": "B"
    },
    {
      "id": 25,
      "topic": "Oxidation-Reduction",
      "question": "The oxidation number of any element in its free (uncombined) state is",
      "options": {
        "A": "Zero",
        "B": "-1",
        "C": "+1",
        "D": "Equal to its group number"
      },
      "answer": "A"
    },
    {
      "id": 26,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "Ethanoic acid (acetic acid) is the main acid found in",
      "options": {
        "A": "Sour milk only",
        "B": "Vinegar",
        "C": "Grapes",
        "D": "Citrus fruits"
      },
      "answer": "B"
    },
    {
      "id": 27,
      "topic": "Chemical Bonding",
      "question": "A dative (coordinate) covalent bond is formed when",
      "options": {
        "A": "Two atoms each donate one electron",
        "B": "One atom donates both electrons of the shared pair",
        "C": "Two protons are shared",
        "D": "Electrons are transferred completely"
      },
      "answer": "B"
    },
    {
      "id": 28,
      "topic": "Periodic Table",
      "question": "Elements in the same group of the periodic table have the same",
      "options": {
        "A": "Number of valence electrons",
        "B": "Atomic mass",
        "C": "Number of shells",
        "D": "Number of neutrons"
      },
      "answer": "A"
    },
    {
      "id": 29,
      "topic": "Electrochemistry & Cells",
      "question": "A metal higher in the electrochemical (reactivity) series will",
      "options": {
        "A": "Displace a metal lower in the series from its salt solution",
        "B": "Always be classified as a noble metal",
        "C": "Never react with dilute acids",
        "D": "Be displaced by a metal lower in the series"
      },
      "answer": "A"
    },
    {
      "id": 30,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "The number of moles in 4.4 g of CO2 (molar mass = 44 g/mol) is",
      "options": {
        "A": "0.1 mol",
        "B": "0.4 mol",
        "C": "4.4 mol",
        "D": "1.0 mol"
      },
      "answer": "A"
    },
    {
      "id": 31,
      "topic": "Oxidation-Reduction",
      "question": "A reducing agent is a substance that",
      "options": {
        "A": "Does not participate in electron transfer",
        "B": "Donates electrons and is itself oxidized",
        "C": "Is always a non-metal",
        "D": "Accepts electrons and is itself reduced"
      },
      "answer": "B"
    },
    {
      "id": 32,
      "topic": "Periodic Table",
      "question": "Ionization energy generally increases across a period mainly due to",
      "options": {
        "A": "Increasing atomic radius",
        "B": "Increasing shielding",
        "C": "Increasing nuclear charge",
        "D": "Decreasing nuclear charge"
      },
      "answer": "C"
    },
    {
      "id": 33,
      "topic": "Separation of Mixtures",
      "question": "Paper chromatography is used mainly to separate",
      "options": {
        "A": "Immiscible liquids",
        "B": "Solid-solid mixtures of similar solubility",
        "C": "Gases only",
        "D": "Mixtures of pigments or dyes"
      },
      "answer": "D"
    },
    {
      "id": 34,
      "topic": "Electrochemistry & Cells",
      "question": "Corrosion of iron can be effectively prevented by",
      "options": {
        "A": "Galvanizing (coating with zinc)",
        "B": "Increasing exposure to moisture",
        "C": "Scratching the metal surface",
        "D": "Increasing exposure to oxygen"
      },
      "answer": "A"
    },
    {
      "id": 35,
      "topic": "Electrolysis",
      "question": "Electroplating uses electrolysis mainly to",
      "options": {
        "A": "Coat one metal with a thin layer of another metal",
        "B": "Purify drinking water",
        "C": "Extract metals directly from their ores",
        "D": "Produce industrial gases only"
      },
      "answer": "A"
    },
    {
      "id": 36,
      "topic": "Atomic Structure",
      "question": "An ion X^2- has 10 electrons and 8 protons. The element X is",
      "options": {
        "A": "Neon",
        "B": "Sulphur",
        "C": "Fluorine",
        "D": "Oxygen"
      },
      "answer": "D"
    },
    {
      "id": 37,
      "topic": "Electrolysis",
      "question": "During the electrolysis of molten sodium chloride, sodium metal is formed at the",
      "options": {
        "A": "Cathode",
        "B": "Electrolyte surface",
        "C": "Salt bridge",
        "D": "Anode"
      },
      "answer": "A"
    },
    {
      "id": 38,
      "topic": "Air & Environmental Chemistry",
      "question": "Which of these is a primary air pollutant from vehicle exhaust?",
      "options": {
        "A": "Carbon monoxide",
        "B": "Oxygen",
        "C": "Nitrogen",
        "D": "Water vapor only"
      },
      "answer": "A"
    },
    {
      "id": 39,
      "topic": "Periodic Table",
      "question": "Moving across a period from left to right, atomic radius generally",
      "options": {
        "A": "Decreases",
        "B": "Increases then decreases",
        "C": "Remains constant",
        "D": "Increases"
      },
      "answer": "A"
    },
    {
      "id": 40,
      "topic": "Electrolysis",
      "question": "In electrolysis, the electrode connected to the positive terminal of the battery is called the",
      "options": {
        "A": "Cathode",
        "B": "Anode",
        "C": "Electrolyte",
        "D": "Diaphragm"
      },
      "answer": "B"
    },
    {
      "id": 41,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "The general formula for saturated monohydric alcohols is",
      "options": {
        "A": "CnH2nOH",
        "B": "CnH2n+1OH",
        "C": "CnHnOH",
        "D": "CnH2n-1OH"
      },
      "answer": "B"
    },
    {
      "id": 42,
      "topic": "Chemical Equilibrium",
      "question": "Removing a product from a reaction at equilibrium will",
      "options": {
        "A": "Stop the reaction entirely",
        "B": "Shift the equilibrium towards the reactants",
        "C": "Have no effect on the equilibrium",
        "D": "Shift the equilibrium to produce more product"
      },
      "answer": "D"
    },
    {
      "id": 43,
      "topic": "Carbon & Hydrocarbons",
      "question": "Polymerization of ethene produces",
      "options": {
        "A": "Nylon",
        "B": "Polyethene (polythene)",
        "C": "Polyvinyl chloride",
        "D": "Polyester"
      },
      "answer": "B"
    },
    {
      "id": 44,
      "topic": "Water & Hydrogen",
      "question": "Water is chemically represented by the formula",
      "options": {
        "A": "H3O",
        "B": "H2O2",
        "C": "H2O",
        "D": "HO2"
      },
      "answer": "C"
    },
    {
      "id": 45,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "Which of the following processes is endothermic?",
      "options": {
        "A": "Melting of ice",
        "B": "Neutralization of an acid and a base",
        "C": "Combustion of methane",
        "D": "Rusting of iron"
      },
      "answer": "A"
    },
    {
      "id": 46,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "The process of forming an ester from an acid and an alcohol is called",
      "options": {
        "A": "Esterification",
        "B": "Fermentation",
        "C": "Saponification",
        "D": "Hydrolysis"
      },
      "answer": "A"
    },
    {
      "id": 47,
      "topic": "Air & Environmental Chemistry",
      "question": "Which gas, along with CO2, is largely responsible for the greenhouse effect?",
      "options": {
        "A": "Methane",
        "B": "Nitrogen",
        "C": "Argon",
        "D": "Neon"
      },
      "answer": "A"
    },
    {
      "id": 48,
      "topic": "Chemical Equilibrium",
      "question": "Adding a catalyst to a reaction at equilibrium",
      "options": {
        "A": "Shifts the equilibrium towards the products",
        "B": "Has no effect on the reaction rate",
        "C": "Shifts the equilibrium towards the reactants",
        "D": "Speeds up both forward and reverse reactions equally without shifting equilibrium"
      },
      "answer": "D"
    },
    {
      "id": 49,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "In the reaction N2 + 3H2 -> 2NH3, the number of moles of hydrogen needed to react completely with 2 moles of nitrogen is",
      "options": {
        "A": "6",
        "B": "4",
        "C": "3",
        "D": "2"
      },
      "answer": "A"
    },
    {
      "id": 50,
      "topic": "Electrochemistry & Cells",
      "question": "The standard hydrogen electrode is assigned an electrode potential of",
      "options": {
        "A": "1.00 V",
        "B": "0.00 V",
        "C": "-1.00 V",
        "D": "2.00 V"
      },
      "answer": "B"
    },
    {
      "id": 51,
      "topic": "Atomic Structure",
      "question": "Which model of the atom proposed that electrons move in fixed orbits (shells) around the nucleus?",
      "options": {
        "A": "Rutherford's plum pudding model",
        "B": "Dalton model",
        "C": "Thomson model",
        "D": "Bohr model"
      },
      "answer": "D"
    },
    {
      "id": 52,
      "topic": "Air & Environmental Chemistry",
      "question": "Global warming is primarily linked to an increased atmospheric concentration of",
      "options": {
        "A": "Carbon dioxide",
        "B": "Helium",
        "C": "Argon",
        "D": "Nitrogen"
      },
      "answer": "A"
    },
    {
      "id": 53,
      "topic": "Carbon & Hydrocarbons",
      "question": "Which of these is the first member of the alkyne homologous series?",
      "options": {
        "A": "Ethane",
        "B": "Methane",
        "C": "Ethyne",
        "D": "Ethene"
      },
      "answer": "C"
    },
    {
      "id": 54,
      "topic": "Chemical Equilibrium",
      "question": "A reaction is said to be at dynamic equilibrium when",
      "options": {
        "A": "Only products remain present",
        "B": "All reactants have been converted to products",
        "C": "The rate of the forward reaction equals the rate of the backward reaction",
        "D": "The reaction has stopped completely"
      },
      "answer": "C"
    },
    {
      "id": 55,
      "topic": "Air & Environmental Chemistry",
      "question": "The ozone layer mainly protects the earth from",
      "options": {
        "A": "Excess carbon dioxide",
        "B": "Visible light",
        "C": "Acid rain",
        "D": "Harmful ultraviolet radiation"
      },
      "answer": "D"
    },
    {
      "id": 56,
      "topic": "Separation of Mixtures",
      "question": "Centrifugation is best used to separate",
      "options": {
        "A": "A suspension into solid and liquid",
        "B": "Two miscible liquids by boiling point",
        "C": "Two gases",
        "D": "A solution into its ions"
      },
      "answer": "A"
    },
    {
      "id": 57,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "A reaction that releases heat energy to the surroundings is called",
      "options": {
        "A": "Isothermal",
        "B": "Exothermic",
        "C": "Adiabatic",
        "D": "Endothermic"
      },
      "answer": "B"
    },
    {
      "id": 58,
      "topic": "Chemical Equilibrium",
      "question": "The equilibrium constant, Kc, for a given reaction depends only on",
      "options": {
        "A": "Presence of a catalyst",
        "B": "Temperature",
        "C": "Pressure",
        "D": "Concentration of the reactants"
      },
      "answer": "B"
    },
    {
      "id": 59,
      "topic": "Separation of Mixtures",
      "question": "Which method is used to separate a mixture of sand and water?",
      "options": {
        "A": "Chromatography",
        "B": "Distillation",
        "C": "Sublimation",
        "D": "Filtration"
      },
      "answer": "D"
    },
    {
      "id": 60,
      "topic": "Carbon & Hydrocarbons",
      "question": "Petroleum (crude oil) is separated into its useful fractions mainly using",
      "options": {
        "A": "Filtration",
        "B": "Crystallization",
        "C": "Fractional distillation",
        "D": "Chromatography"
      },
      "answer": "C"
    },
    {
      "id": 61,
      "topic": "Rates of Reaction",
      "question": "An enzyme is best described as a",
      "options": {
        "A": "Reactant that is permanently consumed",
        "B": "Poison",
        "C": "Product of a reaction",
        "D": "Biological catalyst"
      },
      "answer": "D"
    },
    {
      "id": 62,
      "topic": "Water & Hydrogen",
      "question": "Soft water is water that",
      "options": {
        "A": "Does not lather with soap",
        "B": "Lathers easily with soap",
        "C": "Contains excess calcium ions",
        "D": "Is always freshly distilled"
      },
      "answer": "B"
    },
    {
      "id": 63,
      "topic": "Atomic Structure",
      "question": "Which subatomic particle has a negligible mass compared to the others?",
      "options": {
        "A": "Electron",
        "B": "Proton",
        "C": "Nucleon",
        "D": "Neutron"
      },
      "answer": "A"
    },
    {
      "id": 64,
      "topic": "Rates of Reaction",
      "question": "For a reaction that is first order with respect to a reactant, doubling its concentration will",
      "options": {
        "A": "Halve the rate",
        "B": "Have no effect on the rate",
        "C": "Double the rate of reaction",
        "D": "Quadruple the rate"
      },
      "answer": "C"
    },
    {
      "id": 65,
      "topic": "Solubility & Solutions",
      "question": "A solubility curve is a graph of",
      "options": {
        "A": "Solubility against pressure only",
        "B": "Concentration against time",
        "C": "Volume against mass",
        "D": "Solubility against temperature"
      },
      "answer": "D"
    },
    {
      "id": 66,
      "topic": "Atomic Structure",
      "question": "Isotopes of an element differ in",
      "options": {
        "A": "Atomic number",
        "B": "Number of protons",
        "C": "Number of neutrons",
        "D": "Number of electrons"
      },
      "answer": "C"
    },
    {
      "id": 67,
      "topic": "Chemical Bonding",
      "question": "The shape of a molecule with four bonding pairs and no lone pairs around the central atom is",
      "options": {
        "A": "Linear",
        "B": "Tetrahedral",
        "C": "Trigonal planar",
        "D": "Bent"
      },
      "answer": "B"
    },
    {
      "id": 68,
      "topic": "Electrolysis",
      "question": "Electrolysis is best defined as",
      "options": {
        "A": "A reaction that produces electricity spontaneously",
        "B": "The decomposition of an electrolyte by an electric current",
        "C": "The dissolution of a solid in water",
        "D": "The combination of elements to form a compound"
      },
      "answer": "B"
    },
    {
      "id": 69,
      "topic": "Acids, Bases & Salts",
      "question": "A solution with pH 3 is",
      "options": {
        "A": "Weakly alkaline",
        "B": "Neutral",
        "C": "Strongly acidic",
        "D": "Strongly alkaline"
      },
      "answer": "C"
    },
    {
      "id": 70,
      "topic": "Water & Hydrogen",
      "question": "Hydrogen is used industrially in the manufacture of ammonia through the",
      "options": {
        "A": "Solvay process",
        "B": "Haber process",
        "C": "Contact process",
        "D": "Downs process"
      },
      "answer": "B"
    },
    {
      "id": 71,
      "topic": "Oxidation-Reduction",
      "question": "The oxidation number of chlorine in HCl is",
      "options": {
        "A": "0",
        "B": "-2",
        "C": "+1",
        "D": "-1"
      },
      "answer": "D"
    },
    {
      "id": 72,
      "topic": "Periodic Table",
      "question": "The most electronegative element in the periodic table is",
      "options": {
        "A": "Chlorine",
        "B": "Nitrogen",
        "C": "Fluorine",
        "D": "Oxygen"
      },
      "answer": "C"
    },
    {
      "id": 73,
      "topic": "Air & Environmental Chemistry",
      "question": "Photochemical smog is largely formed from the reaction of sunlight with",
      "options": {
        "A": "Nitrogen oxides and hydrocarbons",
        "B": "Carbon dioxide and water",
        "C": "Argon and neon",
        "D": "Oxygen and nitrogen only"
      },
      "answer": "A"
    },
    {
      "id": 74,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "The functional group of carboxylic acids is",
      "options": {
        "A": "-CHO",
        "B": "-OH",
        "C": "-COOH",
        "D": "-CO-"
      },
      "answer": "C"
    },
    {
      "id": 75,
      "topic": "States of Matter",
      "question": "The change of state from solid directly to gas is called",
      "options": {
        "A": "Condensation",
        "B": "Melting",
        "C": "Sublimation",
        "D": "Evaporation"
      },
      "answer": "C"
    },
    {
      "id": 76,
      "topic": "Solubility & Solutions",
      "question": "The molarity of a solution containing 4 g of NaOH (molar mass 40 g/mol) dissolved to make 1 dm3 of solution is",
      "options": {
        "A": "0.4 mol/dm3",
        "B": "0.1 mol/dm3",
        "C": "1.0 mol/dm3",
        "D": "4.0 mol/dm3"
      },
      "answer": "B"
    },
    {
      "id": 77,
      "topic": "Atomic Structure",
      "question": "The maximum number of electrons that can occupy the second shell (n=2) is",
      "options": {
        "A": "6",
        "B": "8",
        "C": "18",
        "D": "2"
      },
      "answer": "B"
    },
    {
      "id": 78,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "Methanol is commonly known as",
      "options": {
        "A": "Ethyl alcohol",
        "B": "Rubbing alcohol",
        "C": "Grain alcohol",
        "D": "Wood alcohol"
      },
      "answer": "D"
    },
    {
      "id": 79,
      "topic": "Chemical Bonding",
      "question": "Which of these compounds is an example of a covalent compound?",
      "options": {
        "A": "Carbon dioxide",
        "B": "Sodium chloride",
        "C": "Magnesium oxide",
        "D": "Potassium chloride"
      },
      "answer": "A"
    },
    {
      "id": 80,
      "topic": "Rates of Reaction",
      "question": "According to collision theory, for a reaction to occur, particles must",
      "options": {
        "A": "Collide with sufficient energy and correct orientation",
        "B": "Have equal masses",
        "C": "Be at absolute zero temperature",
        "D": "Simply be present in the same container"
      },
      "answer": "A"
    },
    {
      "id": 81,
      "topic": "Chemical Bonding",
      "question": "Hydrogen bonding occurs between molecules containing hydrogen bonded to",
      "options": {
        "A": "Only carbon atoms",
        "B": "Only metals",
        "C": "Highly electronegative atoms like N, O or F",
        "D": "Noble gas atoms"
      },
      "answer": "C"
    },
    {
      "id": 82,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "A compound has empirical formula (CH2O)n. If its molar mass is 180 g/mol, the value of n is",
      "options": {
        "A": "2",
        "B": "4",
        "C": "3",
        "D": "6"
      },
      "answer": "D"
    },
    {
      "id": 83,
      "topic": "Carbon & Hydrocarbons",
      "question": "Complete combustion of a hydrocarbon in excess oxygen produces",
      "options": {
        "A": "Carbon dioxide and water",
        "B": "Carbon and hydrogen gas",
        "C": "Carbon monoxide and water",
        "D": "Soot only"
      },
      "answer": "A"
    },
    {
      "id": 84,
      "topic": "Industrial Chemistry",
      "question": "Aluminium is extracted from bauxite by",
      "options": {
        "A": "Roasting only",
        "B": "Simple filtration",
        "C": "Reduction with carbon",
        "D": "Electrolysis of molten purified alumina dissolved in cryolite"
      },
      "answer": "D"
    },
    {
      "id": 85,
      "topic": "Rates of Reaction",
      "question": "The minimum energy required for reactant particles to react is called the",
      "options": {
        "A": "Lattice energy",
        "B": "Activation energy",
        "C": "Bond energy",
        "D": "Ionization energy"
      },
      "answer": "B"
    },
    {
      "id": 86,
      "topic": "Air & Environmental Chemistry",
      "question": "Acid rain is mainly caused by atmospheric pollution from",
      "options": {
        "A": "Carbon monoxide only",
        "B": "Water vapor",
        "C": "Oxygen and nitrogen",
        "D": "Sulfur dioxide and nitrogen oxides"
      },
      "answer": "D"
    },
    {
      "id": 87,
      "topic": "States of Matter",
      "question": "According to the kinetic theory, increasing the temperature of a gas",
      "options": {
        "A": "Decreases particle motion",
        "B": "Increases the average kinetic energy of the particles",
        "C": "Causes particles to stop moving",
        "D": "Has no effect on particle motion"
      },
      "answer": "B"
    },
    {
      "id": 88,
      "topic": "Acids, Bases & Salts",
      "question": "The process of adding water to a concentrated acid to reduce its concentration is called",
      "options": {
        "A": "Evaporation",
        "B": "Titration",
        "C": "Neutralization",
        "D": "Dilution"
      },
      "answer": "D"
    },
    {
      "id": 89,
      "topic": "Oxidation-Reduction",
      "question": "Oxidation is best defined as",
      "options": {
        "A": "Gain of protons",
        "B": "Gain of electrons",
        "C": "Loss of protons",
        "D": "Loss of electrons"
      },
      "answer": "D"
    },
    {
      "id": 90,
      "topic": "Chemical Equilibrium",
      "question": "In an exothermic reversible reaction at equilibrium, increasing the temperature will",
      "options": {
        "A": "Stop the reaction completely",
        "B": "Shift the equilibrium towards the products",
        "C": "Shift the equilibrium towards the reactants",
        "D": "Have no effect on the equilibrium"
      },
      "answer": "C"
    },
    {
      "id": 91,
      "topic": "States of Matter",
      "question": "Amorphous solids differ from crystalline solids in that they",
      "options": {
        "A": "Have a definite sharp melting point",
        "B": "Have a regular geometric shape",
        "C": "Lack a regular repeating particle arrangement",
        "D": "Are always metals"
      },
      "answer": "C"
    },
    {
      "id": 92,
      "topic": "Oxidation-Reduction",
      "question": "In the reaction 2Mg + O2 -> 2MgO, the oxidizing agent is",
      "options": {
        "A": "None of the substances",
        "B": "Oxygen",
        "C": "Magnesium",
        "D": "Magnesium oxide"
      },
      "answer": "B"
    },
    {
      "id": 93,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "The heat energy required to break one mole of a particular covalent bond is called",
      "options": {
        "A": "Enthalpy of formation",
        "B": "Ionization energy",
        "C": "Bond dissociation energy",
        "D": "Lattice energy"
      },
      "answer": "C"
    },
    {
      "id": 94,
      "topic": "Carbon & Hydrocarbons",
      "question": "The general formula for the alkene homologous series is",
      "options": {
        "A": "CnH2n",
        "B": "CnH2n-2",
        "C": "CnHn",
        "D": "CnH2n+2"
      },
      "answer": "A"
    },
    {
      "id": 95,
      "topic": "Chemical Bonding",
      "question": "A covalent bond is formed by",
      "options": {
        "A": "Sharing of electron pairs between atoms",
        "B": "Gain of protons",
        "C": "Loss of electrons",
        "D": "Complete transfer of electrons"
      },
      "answer": "A"
    },
    {
      "id": 96,
      "topic": "Water & Hydrogen",
      "question": "The pH of pure water at 25 degrees Celsius is",
      "options": {
        "A": "1",
        "B": "14",
        "C": "7",
        "D": "0"
      },
      "answer": "C"
    },
    {
      "id": 97,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "One mole of any gas at STP occupies",
      "options": {
        "A": "11.2 dm3",
        "B": "1 dm3",
        "C": "44.8 dm3",
        "D": "22.4 dm3"
      },
      "answer": "D"
    },
    {
      "id": 98,
      "topic": "Periodic Table",
      "question": "Transition elements are found in",
      "options": {
        "A": "The p-block only",
        "B": "Group 1",
        "C": "The d-block",
        "D": "Group 0"
      },
      "answer": "C"
    },
    {
      "id": 99,
      "topic": "Chemical Bonding",
      "question": "Ionic compounds generally have",
      "options": {
        "A": "High melting and boiling points",
        "B": "Poor solubility in water",
        "C": "Low melting points",
        "D": "Weak lattice energy"
      },
      "answer": "A"
    },
    {
      "id": 100,
      "topic": "Atomic Structure",
      "question": "An atom of an element has 17 protons and 18 neutrons. Its mass number is",
      "options": {
        "A": "1",
        "B": "18",
        "C": "17",
        "D": "35"
      },
      "answer": "D"
    },
    {
      "id": 101,
      "topic": "Separation of Mixtures",
      "question": "Which technique separates components of a mixture based on differences in boiling point?",
      "options": {
        "A": "Filtration",
        "B": "Sedimentation",
        "C": "Chromatography",
        "D": "Fractional distillation"
      },
      "answer": "D"
    },
    {
      "id": 102,
      "topic": "Industrial Chemistry",
      "question": "Soap is manufactured industrially by the hydrolysis of fats and oils with",
      "options": {
        "A": "Water only",
        "B": "Carbon dioxide",
        "C": "Sodium hydroxide (alkali)",
        "D": "Dilute acid"
      },
      "answer": "C"
    },
    {
      "id": 103,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "The limiting reagent in a chemical reaction is the reactant that",
      "options": {
        "A": "Is present in excess",
        "B": "Does not react at all",
        "C": "Has the highest molar mass",
        "D": "Is completely consumed and limits the amount of product formed"
      },
      "answer": "D"
    },
    {
      "id": 104,
      "topic": "Nuclear Chemistry",
      "question": "Nuclear fission involves",
      "options": {
        "A": "Combining of light nuclei to form a heavier nucleus",
        "B": "Splitting of a heavy nucleus into smaller nuclei with release of energy",
        "C": "Emission of alpha particles only",
        "D": "Absorption of neutrons without any energy release"
      },
      "answer": "B"
    },
    {
      "id": 105,
      "topic": "Rates of Reaction",
      "question": "Increasing the temperature of a reaction generally",
      "options": {
        "A": "Stops the reaction",
        "B": "Has no effect on the rate",
        "C": "Decreases the rate of reaction",
        "D": "Increases the rate of reaction"
      },
      "answer": "D"
    },
    {
      "id": 106,
      "topic": "Nuclear Chemistry",
      "question": "The time taken for half of the atoms in a radioactive sample to decay is called the",
      "options": {
        "A": "Half-life",
        "B": "Mean life",
        "C": "Decay constant",
        "D": "Full life"
      },
      "answer": "A"
    },
    {
      "id": 107,
      "topic": "Acids, Bases & Salts",
      "question": "An acid is best defined as a substance that",
      "options": {
        "A": "Accepts protons in solution",
        "B": "Turns red litmus blue",
        "C": "Always has a pH greater than 7",
        "D": "Donates protons (H+ ions) in solution"
      },
      "answer": "D"
    },
    {
      "id": 108,
      "topic": "Air & Environmental Chemistry",
      "question": "Chlorofluorocarbons (CFCs) are known to cause",
      "options": {
        "A": "Global cooling",
        "B": "Depletion of the ozone layer",
        "C": "Acid rain directly",
        "D": "Increased atmospheric oxygen levels"
      },
      "answer": "B"
    },
    {
      "id": 109,
      "topic": "Solubility & Solutions",
      "question": "A solution containing less solute than the maximum that can dissolve at that temperature is called",
      "options": {
        "A": "Supersaturated",
        "B": "Concentrated",
        "C": "Saturated",
        "D": "Unsaturated"
      },
      "answer": "D"
    },
    {
      "id": 110,
      "topic": "Air & Environmental Chemistry",
      "question": "Eutrophication of water bodies is often caused by excess",
      "options": {
        "A": "Carbon dioxide only",
        "B": "Dissolved oxygen",
        "C": "Nitrates and phosphates from fertilizers",
        "D": "Sodium chloride"
      },
      "answer": "C"
    },
    {
      "id": 111,
      "topic": "Nuclear Chemistry",
      "question": "Nuclear fusion is the process that powers",
      "options": {
        "A": "Electrolysis cells",
        "B": "The sun",
        "C": "Nuclear power plants only",
        "D": "Ordinary combustion reactions"
      },
      "answer": "B"
    },
    {
      "id": 112,
      "topic": "Electrochemistry & Cells",
      "question": "In a galvanic cell, electrons flow through the external circuit from the",
      "options": {
        "A": "Cathode to the anode",
        "B": "Cathode to the salt bridge",
        "C": "Salt bridge to the anode",
        "D": "Anode to the cathode"
      },
      "answer": "D"
    },
    {
      "id": 113,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "Avogadro's number is approximately",
      "options": {
        "A": "6.02 x 10^23",
        "B": "1.00 x 10^23",
        "C": "6.02 x 10^22",
        "D": "3.01 x 10^23"
      },
      "answer": "A"
    },
    {
      "id": 114,
      "topic": "Industrial Chemistry",
      "question": "The Contact process is used industrially to manufacture",
      "options": {
        "A": "Sulfuric acid",
        "B": "Chlorine",
        "C": "Ammonia",
        "D": "Sodium carbonate"
      },
      "answer": "A"
    },
    {
      "id": 115,
      "topic": "Carbon & Hydrocarbons",
      "question": "Hydrocarbons that contain only single bonds between carbon atoms are called",
      "options": {
        "A": "Aromatics",
        "B": "Alkenes",
        "C": "Alkynes",
        "D": "Alkanes"
      },
      "answer": "D"
    },
    {
      "id": 116,
      "topic": "Air & Environmental Chemistry",
      "question": "Which gas turns limewater milky?",
      "options": {
        "A": "Carbon dioxide",
        "B": "Oxygen",
        "C": "Hydrogen",
        "D": "Nitrogen"
      },
      "answer": "A"
    },
    {
      "id": 117,
      "topic": "Periodic Table",
      "question": "Alkali metals are found in",
      "options": {
        "A": "Group 7",
        "B": "Group 1",
        "C": "Group 2",
        "D": "Group 0"
      },
      "answer": "B"
    },
    {
      "id": 118,
      "topic": "Electrolysis",
      "question": "In the electrolysis of brine (concentrated NaCl solution), the gas liberated at the anode is",
      "options": {
        "A": "Nitrogen",
        "B": "Oxygen",
        "C": "Chlorine",
        "D": "Hydrogen"
      },
      "answer": "C"
    },
    {
      "id": 119,
      "topic": "Separation of Mixtures",
      "question": "The process of separating a soluble solid from a solvent by evaporation and cooling is called",
      "options": {
        "A": "Sublimation",
        "B": "Decantation",
        "C": "Crystallization",
        "D": "Filtration"
      },
      "answer": "C"
    },
    {
      "id": 120,
      "topic": "Nuclear Chemistry",
      "question": "Radioactivity is the spontaneous",
      "options": {
        "A": "Emission of radiation from unstable atomic nuclei",
        "B": "Absorption of light by atoms",
        "C": "Melting of radioactive elements",
        "D": "Formation of covalent bonds between atoms"
      },
      "answer": "A"
    },
    {
      "id": 121,
      "topic": "Water & Hydrogen",
      "question": "Which method is commonly used to remove permanent hardness from water?",
      "options": {
        "A": "Ion exchange (using a water softener)",
        "B": "Ordinary filtration",
        "C": "Simple boiling",
        "D": "Sublimation"
      },
      "answer": "A"
    },
    {
      "id": 122,
      "topic": "Electrochemistry & Cells",
      "question": "In a simple electrochemical (galvanic) cell, oxidation occurs at the",
      "options": {
        "A": "Anode",
        "B": "Cathode",
        "C": "Salt bridge",
        "D": "External wire"
      },
      "answer": "A"
    },
    {
      "id": 123,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "The energy required to convert one mole of a solid directly to a gas is related to the",
      "options": {
        "A": "Enthalpy of solution",
        "B": "Enthalpy of sublimation",
        "C": "Bond energy only",
        "D": "Enthalpy of neutralization"
      },
      "answer": "B"
    },
    {
      "id": 124,
      "topic": "Oxidation-Reduction",
      "question": "Which of the following is an example of a redox reaction?",
      "options": {
        "A": "NaOH + HCl -> NaCl + H2O",
        "B": "CaCO3 -> CaO + CO2",
        "C": "AgNO3 + NaCl -> AgCl + NaNO3",
        "D": "Fe2O3 + 2Al -> Al2O3 + 2Fe"
      },
      "answer": "D"
    },
    {
      "id": 125,
      "topic": "Solubility & Solutions",
      "question": "The solubility of gases in liquids generally",
      "options": {
        "A": "Increases with increasing temperature",
        "B": "Decreases with increasing temperature",
        "C": "Is unaffected by temperature",
        "D": "Increases as pressure decreases"
      },
      "answer": "B"
    },
    {
      "id": 126,
      "topic": "Chemical Bonding",
      "question": "Which of these has a giant covalent (macromolecular) structure?",
      "options": {
        "A": "Sodium chloride",
        "B": "Carbon dioxide",
        "C": "Water",
        "D": "Diamond"
      },
      "answer": "D"
    },
    {
      "id": 127,
      "topic": "States of Matter",
      "question": "The temperature at which a liquid changes to a gas throughout its bulk is called",
      "options": {
        "A": "Dew point",
        "B": "Boiling point",
        "C": "Freezing point",
        "D": "Melting point"
      },
      "answer": "B"
    },
    {
      "id": 128,
      "topic": "Acids, Bases & Salts",
      "question": "Which of the following is an example of a basic salt?",
      "options": {
        "A": "Ammonium chloride",
        "B": "Sodium chloride",
        "C": "Sodium carbonate",
        "D": "Potassium nitrate"
      },
      "answer": "C"
    },
    {
      "id": 129,
      "topic": "Rates of Reaction",
      "question": "Which factor does NOT generally affect the rate of a chemical reaction?",
      "options": {
        "A": "Presence of a catalyst",
        "B": "Color of the reactants",
        "C": "Concentration",
        "D": "Temperature"
      },
      "answer": "B"
    },
    {
      "id": 130,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "The molar mass of water, H2O, is",
      "options": {
        "A": "34 g/mol",
        "B": "18 g/mol",
        "C": "20 g/mol",
        "D": "16 g/mol"
      },
      "answer": "B"
    },
    {
      "id": 131,
      "topic": "Electrolysis",
      "question": "Faraday's first law of electrolysis states that the mass of a substance deposited is proportional to",
      "options": {
        "A": "The volume of the electrolyte",
        "B": "The temperature of the electrolyte",
        "C": "The quantity of electricity passed",
        "D": "The color of the electrolyte"
      },
      "answer": "C"
    },
    {
      "id": 132,
      "topic": "States of Matter",
      "question": "The process by which a gas changes directly to a solid is called",
      "options": {
        "A": "Fusion",
        "B": "Sublimation",
        "C": "Evaporation",
        "D": "Deposition"
      },
      "answer": "D"
    },
    {
      "id": 133,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "In an exothermic reaction, the enthalpy change (delta H) is",
      "options": {
        "A": "Zero",
        "B": "Undefined",
        "C": "Negative",
        "D": "Positive"
      },
      "answer": "C"
    },
    {
      "id": 134,
      "topic": "Electrolysis",
      "question": "The industrial extraction of aluminium from bauxite is achieved mainly by",
      "options": {
        "A": "Simple roasting in air",
        "B": "Electrolysis of molten aluminium oxide dissolved in cryolite",
        "C": "Reduction with carbon only",
        "D": "Displacement by a more reactive metal"
      },
      "answer": "B"
    },
    {
      "id": 135,
      "topic": "Separation of Mixtures",
      "question": "Which of these is NOT a physical method of separation?",
      "options": {
        "A": "Filtration",
        "B": "Decantation",
        "C": "Electrolysis",
        "D": "Distillation"
      },
      "answer": "C"
    },
    {
      "id": 136,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "The standard enthalpy of formation of an element in its standard state is",
      "options": {
        "A": "Always negative",
        "B": "Zero",
        "C": "Always positive",
        "D": "Equal to its atomic mass"
      },
      "answer": "B"
    },
    {
      "id": 137,
      "topic": "Rates of Reaction",
      "question": "Which of the following would increase the rate of reaction between a solid and a gas?",
      "options": {
        "A": "Decreasing the temperature",
        "B": "Removing the catalyst",
        "C": "Using larger pieces of the solid",
        "D": "Increasing the pressure of the gas"
      },
      "answer": "D"
    },
    {
      "id": 138,
      "topic": "Solubility & Solutions",
      "question": "Water is often called the universal solvent because it",
      "options": {
        "A": "Has a high boiling point",
        "B": "Has no color or taste",
        "C": "Is found everywhere in nature",
        "D": "Dissolves a wide range of substances"
      },
      "answer": "D"
    },
    {
      "id": 139,
      "topic": "Nuclear Chemistry",
      "question": "Beta particles are essentially",
      "options": {
        "A": "High-speed electrons",
        "B": "Helium nuclei",
        "C": "Neutrons",
        "D": "Protons"
      },
      "answer": "A"
    },
    {
      "id": 140,
      "topic": "Solubility & Solutions",
      "question": "Molarity is defined as",
      "options": {
        "A": "Grams of solute per litre of solvent",
        "B": "Moles of solute per gram of solvent",
        "C": "Moles of solute per litre (dm3) of solution",
        "D": "Litres of solution per mole of solute"
      },
      "answer": "C"
    },
    {
      "id": 141,
      "topic": "Oxidation-Reduction",
      "question": "In the reaction Zn + Cu2+ -> Zn2+ + Cu, zinc acts as the",
      "options": {
        "A": "Oxidizing agent (it is reduced)",
        "B": "Both oxidized and reduced simultaneously",
        "C": "Reducing agent (it is oxidized)",
        "D": "Neither oxidized nor reduced"
      },
      "answer": "C"
    },
    {
      "id": 142,
      "topic": "Periodic Table",
      "question": "Elements in Group 0 (18) of the periodic table are called",
      "options": {
        "A": "Alkali metals",
        "B": "Transition metals",
        "C": "Halogens",
        "D": "Noble gases"
      },
      "answer": "D"
    },
    {
      "id": 143,
      "topic": "Carbon & Hydrocarbons",
      "question": "The process of converting large hydrocarbon molecules into smaller, more useful ones is called",
      "options": {
        "A": "Polymerization",
        "B": "Cracking",
        "C": "Fermentation",
        "D": "Esterification"
      },
      "answer": "B"
    },
    {
      "id": 144,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "The enthalpy change for the complete combustion of one mole of a substance in oxygen is called the",
      "options": {
        "A": "Standard enthalpy of combustion",
        "B": "Enthalpy of neutralization",
        "C": "Standard enthalpy of formation",
        "D": "Bond dissociation enthalpy"
      },
      "answer": "A"
    },
    {
      "id": 145,
      "topic": "Acids, Bases & Salts",
      "question": "An amphoteric oxide is best described as an oxide that",
      "options": {
        "A": "Reacts with both acids and bases",
        "B": "Does not react with acids or bases",
        "C": "Reacts only with acids",
        "D": "Reacts only with bases"
      },
      "answer": "A"
    },
    {
      "id": 146,
      "topic": "Water & Hydrogen",
      "question": "Hydrogen gas can be prepared in the laboratory by reacting",
      "options": {
        "A": "A reactive metal with a dilute acid",
        "B": "Water with oxygen gas",
        "C": "Sodium chloride with water",
        "D": "Carbon with oxygen"
      },
      "answer": "A"
    },
    {
      "id": 147,
      "topic": "Industrial Chemistry",
      "question": "Which of the following metals is extracted by electrolysis rather than reduction with carbon, because it is too reactive?",
      "options": {
        "A": "Iron",
        "B": "Zinc",
        "C": "Copper",
        "D": "Sodium"
      },
      "answer": "D"
    },
    {
      "id": 148,
      "topic": "Electrolysis",
      "question": "During the electrolysis of dilute sulfuric acid using inert electrodes, the gas produced at the cathode is",
      "options": {
        "A": "Oxygen",
        "B": "Sulfur dioxide",
        "C": "Hydrogen",
        "D": "Chlorine"
      },
      "answer": "C"
    },
    {
      "id": 149,
      "topic": "Electrochemistry & Cells",
      "question": "Which metal is commonly used to cathodically protect iron ship hulls from rusting?",
      "options": {
        "A": "Silver",
        "B": "Copper",
        "C": "Zinc",
        "D": "Gold"
      },
      "answer": "C"
    },
    {
      "id": 150,
      "topic": "Acids, Bases & Salts",
      "question": "In a titration, the point at which the acid exactly neutralizes the base is called the",
      "options": {
        "A": "Starting point",
        "B": "Equivalence (end) point",
        "C": "Boiling point",
        "D": "Dilution point"
      },
      "answer": "B"
    },
    {
      "id": 151,
      "topic": "Electrochemistry & Cells",
      "question": "In a dry cell (battery), the electrolyte used is typically",
      "options": {
        "A": "Molten sodium chloride",
        "B": "Dilute sulfuric acid",
        "C": "Pure distilled water",
        "D": "A paste of ammonium chloride and manganese(IV) oxide"
      },
      "answer": "D"
    },
    {
      "id": 152,
      "topic": "States of Matter",
      "question": "Which of the following best describes diffusion?",
      "options": {
        "A": "Particles remaining stationary",
        "B": "Movement of particles from a region of higher to lower concentration",
        "C": "A process that only occurs in solids",
        "D": "Movement of particles from lower to higher concentration"
      },
      "answer": "B"
    },
    {
      "id": 153,
      "topic": "Solubility & Solutions",
      "question": "The solubility of most solid solutes in water generally",
      "options": {
        "A": "Increases with increasing temperature",
        "B": "Is zero at high temperature",
        "C": "Is unaffected by temperature",
        "D": "Decreases with increasing temperature"
      },
      "answer": "A"
    },
    {
      "id": 154,
      "topic": "Chemical Bonding",
      "question": "Which of the following molecules is non-polar?",
      "options": {
        "A": "Hydrogen chloride",
        "B": "Water",
        "C": "Ammonia",
        "D": "Carbon tetrachloride, CCl4"
      },
      "answer": "D"
    },
    {
      "id": 155,
      "topic": "Solubility & Solutions",
      "question": "The process of adding solvent to reduce the concentration of a solution is called",
      "options": {
        "A": "Saturation",
        "B": "Filtration",
        "C": "Dilution",
        "D": "Crystallization"
      },
      "answer": "C"
    },
    {
      "id": 156,
      "topic": "Rates of Reaction",
      "question": "A catalyst increases the rate of a reaction by",
      "options": {
        "A": "Being consumed in the reaction",
        "B": "Increasing the temperature of the reaction",
        "C": "Providing an alternative pathway with lower activation energy",
        "D": "Increasing the concentration of reactants"
      },
      "answer": "C"
    },
    {
      "id": 157,
      "topic": "Solubility & Solutions",
      "question": "A saturated solution is one that",
      "options": {
        "A": "Cannot be prepared in the laboratory",
        "B": "Contains no dissolved solute",
        "C": "Contains the maximum amount of solute that can dissolve at a given temperature",
        "D": "Always has excess undissolved solute"
      },
      "answer": "C"
    },
    {
      "id": 158,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "Saponification is the reaction between a fat/oil and an alkali to produce",
      "options": {
        "A": "An alcohol and water",
        "B": "A carboxylic acid and hydrogen",
        "C": "An ester and water",
        "D": "Soap and glycerol"
      },
      "answer": "D"
    },
    {
      "id": 159,
      "topic": "Electrolysis",
      "question": "Which of the following is commonly used as an inert electrode in electrolysis?",
      "options": {
        "A": "Potassium",
        "B": "Calcium",
        "C": "Platinum",
        "D": "Sodium"
      },
      "answer": "C"
    },
    {
      "id": 160,
      "topic": "Chemical Equilibrium",
      "question": "A large value of the equilibrium constant (Kc) indicates that",
      "options": {
        "A": "The reaction does not proceed at all",
        "B": "The reaction favors the formation of products",
        "C": "The reaction favors the reactants",
        "D": "The reaction is at standard temperature and pressure"
      },
      "answer": "B"
    },
    {
      "id": 161,
      "topic": "Separation of Mixtures",
      "question": "Iodine can be separated from a mixture of iodine and sodium chloride by",
      "options": {
        "A": "Filtration",
        "B": "Crystallization",
        "C": "Sublimation",
        "D": "Decantation"
      },
      "answer": "C"
    },
    {
      "id": 162,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "Hess's law states that the total enthalpy change for a reaction is",
      "options": {
        "A": "Dependent on the number of steps used",
        "B": "Equal to the bond energy of the reactants only",
        "C": "Always positive",
        "D": "Independent of the route taken"
      },
      "answer": "D"
    },
    {
      "id": 163,
      "topic": "Electrolysis",
      "question": "An electrolyte is a substance that",
      "options": {
        "A": "Is always a metal",
        "B": "Conducts electricity only as a solid",
        "C": "Never conducts electricity under any condition",
        "D": "Conducts electricity when molten or in solution due to free-moving ions"
      },
      "answer": "D"
    },
    {
      "id": 164,
      "topic": "Atomic Structure",
      "question": "The atomic number of an element equals the number of",
      "options": {
        "A": "Neutrons in the nucleus",
        "B": "Electrons plus neutrons",
        "C": "Protons in the nucleus",
        "D": "Protons plus neutrons"
      },
      "answer": "C"
    },
    {
      "id": 165,
      "topic": "Industrial Chemistry",
      "question": "In the Haber process, the catalyst commonly used is",
      "options": {
        "A": "Platinum",
        "B": "Nickel only",
        "C": "Vanadium(V) oxide",
        "D": "Finely divided iron"
      },
      "answer": "D"
    },
    {
      "id": 166,
      "topic": "Chemical Equilibrium",
      "question": "In the Contact process for manufacturing sulfuric acid, SO2 is converted to SO3 using",
      "options": {
        "A": "A platinum catalyst only",
        "B": "No catalyst at all",
        "C": "A vanadium(V) oxide catalyst",
        "D": "An iron catalyst"
      },
      "answer": "C"
    },
    {
      "id": 167,
      "topic": "Electrochemistry & Cells",
      "question": "In a lead-acid car battery, the electrolyte used is",
      "options": {
        "A": "Ammonium chloride paste",
        "B": "Dilute sulfuric acid",
        "C": "Molten lead chloride",
        "D": "Distilled water only"
      },
      "answer": "B"
    },
    {
      "id": 168,
      "topic": "Energy Changes (Thermochemistry)",
      "question": "Which of these reactions is typically exothermic?",
      "options": {
        "A": "Melting of wax",
        "B": "Thermal decomposition of limestone",
        "C": "Combustion of fuels",
        "D": "Photosynthesis"
      },
      "answer": "C"
    },
    {
      "id": 169,
      "topic": "Atomic Structure",
      "question": "The nucleus of an atom contains",
      "options": {
        "A": "Neutrons and electrons",
        "B": "Protons and electrons",
        "C": "Protons only",
        "D": "Protons and neutrons"
      },
      "answer": "D"
    },
    {
      "id": 170,
      "topic": "Nuclear Chemistry",
      "question": "Gamma radiation consists of",
      "options": {
        "A": "Helium nuclei",
        "B": "Neutrons",
        "C": "High-energy electromagnetic waves",
        "D": "Charged particles"
      },
      "answer": "C"
    },
    {
      "id": 171,
      "topic": "Chemical Bonding",
      "question": "Ionic bonding involves",
      "options": {
        "A": "Sharing of protons",
        "B": "Transfer of electrons between atoms",
        "C": "Overlap of nuclei",
        "D": "Sharing of electrons"
      },
      "answer": "B"
    },
    {
      "id": 172,
      "topic": "Water & Hydrogen",
      "question": "The laboratory test for hydrogen gas is that it",
      "options": {
        "A": "Turns limewater milky",
        "B": "Relights a glowing splint",
        "C": "Bleaches damp litmus paper",
        "D": "Burns with a pop sound when a lit splint is introduced"
      },
      "answer": "D"
    },
    {
      "id": 173,
      "topic": "Oxidation-Reduction",
      "question": "The rusting of iron mainly involves",
      "options": {
        "A": "Reduction of iron",
        "B": "Sublimation of iron",
        "C": "Neutralization of iron",
        "D": "Oxidation of iron by oxygen in the presence of moisture"
      },
      "answer": "D"
    },
    {
      "id": 174,
      "topic": "Periodic Table",
      "question": "Which of these elements is a halogen?",
      "options": {
        "A": "Argon",
        "B": "Calcium",
        "C": "Sodium",
        "D": "Chlorine"
      },
      "answer": "D"
    },
    {
      "id": 175,
      "topic": "Acids, Bases & Salts",
      "question": "Which of the following is a strong acid?",
      "options": {
        "A": "Ethanoic acid",
        "B": "Citric acid",
        "C": "Hydrochloric acid",
        "D": "Carbonic acid"
      },
      "answer": "C"
    },
    {
      "id": 176,
      "topic": "Air & Environmental Chemistry",
      "question": "The most abundant gas in the earth's atmosphere is",
      "options": {
        "A": "Carbon dioxide",
        "B": "Argon",
        "C": "Oxygen",
        "D": "Nitrogen"
      },
      "answer": "D"
    },
    {
      "id": 177,
      "topic": "Water & Hydrogen",
      "question": "Temporary hardness of water can be removed simply by",
      "options": {
        "A": "Adding sugar",
        "B": "Boiling",
        "C": "Freezing the water",
        "D": "Adding more calcium salts"
      },
      "answer": "B"
    },
    {
      "id": 178,
      "topic": "Atomic Structure",
      "question": "Isotopes of the same element have the same",
      "options": {
        "A": "Atomic number (number of protons)",
        "B": "Mass number",
        "C": "Number of neutrons",
        "D": "Number of nucleons"
      },
      "answer": "A"
    },
    {
      "id": 179,
      "topic": "Chemical Formulae & Stoichiometry",
      "question": "The empirical formula of a compound containing 40% carbon, 6.7% hydrogen and 53.3% oxygen by mass is",
      "options": {
        "A": "C2H6O",
        "B": "C2H4O2",
        "C": "CH4O",
        "D": "CH2O"
      },
      "answer": "D"
    },
    {
      "id": 180,
      "topic": "Chemical Equilibrium",
      "question": "Le Chatelier's principle states that if a system at equilibrium is disturbed, the system will",
      "options": {
        "A": "Remain completely unaffected",
        "B": "Shift to counteract the disturbance and restore equilibrium",
        "C": "Always shift towards the products",
        "D": "Stop reacting entirely"
      },
      "answer": "B"
    },
    {
      "id": 181,
      "topic": "Rates of Reaction",
      "question": "A catalyst that is in the same physical state as the reactants is called a",
      "options": {
        "A": "An inhibitor",
        "B": "A promoter",
        "C": "Heterogeneous catalyst",
        "D": "Homogeneous catalyst"
      },
      "answer": "D"
    },
    {
      "id": 182,
      "topic": "Carbon & Hydrocarbons",
      "question": "Methane belongs to the homologous series called the",
      "options": {
        "A": "Alcohols",
        "B": "Alkynes",
        "C": "Alkanes",
        "D": "Alkenes"
      },
      "answer": "C"
    },
    {
      "id": 183,
      "topic": "Nuclear Chemistry",
      "question": "Which type of radiation has the greatest penetrating power?",
      "options": {
        "A": "All have equal penetrating power",
        "B": "Gamma rays",
        "C": "Alpha particles",
        "D": "Beta particles"
      },
      "answer": "B"
    },
    {
      "id": 184,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "Which reagent is commonly used to oxidize a primary alcohol to a carboxylic acid?",
      "options": {
        "A": "Limewater",
        "B": "Sodium hydroxide solution",
        "C": "Dilute hydrochloric acid",
        "D": "Acidified potassium dichromate(VI)"
      },
      "answer": "D"
    },
    {
      "id": 185,
      "topic": "Separation of Mixtures",
      "question": "The residue obtained after filtration is the",
      "options": {
        "A": "Dissolved solute",
        "B": "Liquid that passes through",
        "C": "Insoluble solid retained on the filter paper",
        "D": "Evaporated solvent"
      },
      "answer": "C"
    },
    {
      "id": 186,
      "topic": "Nuclear Chemistry",
      "question": "Carbon-14 dating is used to determine the age of",
      "options": {
        "A": "Once-living organic materials",
        "B": "Rocks and minerals only",
        "C": "Metals",
        "D": "Synthetic plastics"
      },
      "answer": "A"
    },
    {
      "id": 187,
      "topic": "Periodic Table",
      "question": "The modern periodic table arranges elements in order of increasing",
      "options": {
        "A": "Atomic mass",
        "B": "Melting point",
        "C": "Atomic number",
        "D": "Number of neutrons"
      },
      "answer": "C"
    },
    {
      "id": 188,
      "topic": "Oxidation-Reduction",
      "question": "In electrolysis, reduction always occurs at the",
      "options": {
        "A": "Both electrodes equally",
        "B": "Cathode",
        "C": "Salt bridge",
        "D": "Anode"
      },
      "answer": "B"
    },
    {
      "id": 189,
      "topic": "States of Matter",
      "question": "Which state of matter has particles that are far apart and move randomly at high speed?",
      "options": {
        "A": "Liquid",
        "B": "Solid",
        "C": "Gas",
        "D": "Plasma"
      },
      "answer": "C"
    },
    {
      "id": 190,
      "topic": "Periodic Table",
      "question": "Going down a group, the metallic character of elements generally",
      "options": {
        "A": "Increases",
        "B": "Decreases",
        "C": "Remains the same",
        "D": "First increases then decreases"
      },
      "answer": "A"
    },
    {
      "id": 191,
      "topic": "Alcohols, Carboxylic Acids & Esters",
      "question": "An ester is formed from the reaction between",
      "options": {
        "A": "Two carboxylic acids",
        "B": "A carboxylic acid and an alcohol",
        "C": "Two alcohols",
        "D": "An alkane and an alcohol"
      },
      "answer": "B"
    },
    {
      "id": 192,
      "topic": "Industrial Chemistry",
      "question": "The Haber process is used industrially to manufacture",
      "options": {
        "A": "Ammonia",
        "B": "Nitric acid",
        "C": "Sulfuric acid",
        "D": "Sodium hydroxide"
      },
      "answer": "A"
    },
    {
      "id": 193,
      "topic": "States of Matter",
      "question": "Brownian motion provides evidence for",
      "options": {
        "A": "The octet rule",
        "B": "The law of conservation of mass",
        "C": "Avogadro's law",
        "D": "The kinetic theory of matter"
      },
      "answer": "D"
    },
    {
      "id": 194,
      "topic": "Water & Hydrogen",
      "question": "Permanent hardness of water is caused mainly by dissolved",
      "options": {
        "A": "Calcium hydrogen carbonate only",
        "B": "Dissolved carbon dioxide",
        "C": "Sodium bicarbonate",
        "D": "Calcium and magnesium sulfates/chlorides"
      },
      "answer": "D"
    },
    {
      "id": 195,
      "topic": "Industrial Chemistry",
      "question": "The Solvay process is used industrially to manufacture",
      "options": {
        "A": "Ammonia",
        "B": "Nitric acid",
        "C": "Sulfuric acid",
        "D": "Sodium carbonate"
      },
      "answer": "D"
    },
    {
      "id": 196,
      "topic": "Rates of Reaction",
      "question": "Increasing the surface area of a solid reactant generally",
      "options": {
        "A": "Increases the rate of reaction",
        "B": "Stops the reaction",
        "C": "Has no effect on the rate",
        "D": "Decreases the rate of reaction"
      },
      "answer": "A"
    },
    {
      "id": 197,
      "topic": "Industrial Chemistry",
      "question": "Which raw material is NOT needed for the blast furnace extraction of iron?",
      "options": {
        "A": "Iron ore (haematite)",
        "B": "Coke",
        "C": "Limestone",
        "D": "Sodium chloride"
      },
      "answer": "D"
    },
    {
      "id": 198,
      "topic": "Acids, Bases & Salts",
      "question": "A salt formed from a strong acid and a weak base is",
      "options": {
        "A": "Neutral",
        "B": "Basic",
        "C": "Acidic",
        "D": "Amphoteric"
      },
      "answer": "C"
    },
    {
      "id": 199,
      "topic": "Carbon & Hydrocarbons",
      "question": "Isomers are compounds that have",
      "options": {
        "A": "The same physical properties always",
        "B": "The same molecular formula but different structures",
        "C": "The same structure but different formula",
        "D": "The same boiling point always"
      },
      "answer": "B"
    },
    {
      "id": 200,
      "topic": "Solubility & Solutions",
      "question": "A supersaturated solution contains",
      "options": {
        "A": "Only dissolved gases",
        "B": "No solute at all",
        "C": "More dissolved solute than a saturated solution at the same temperature",
        "D": "Less solute than a saturated solution"
      },
      "answer": "C"
},

  {
    "id": "CHE201",
    "topic": "Atomic Structure",
    "question": "The subatomic particle with a positive charge is the",
    "options": ["Electron", "Proton", "Neutron", "Photon"],
    "answer": "Proton"
  },
  {
    "id": "CHE202",
    "topic": "Atomic Structure",
    "question": "The number of protons in an atom is known as its",
    "options": ["Mass number", "Atomic number", "Neutron number", "Nucleon number"],
    "answer": "Atomic number"
  },
  {
    "id": "CHE203",
    "topic": "Atomic Structure",
    "question": "An atom has 17 protons and 18 neutrons. Its mass number is",
    "options": ["17", "18", "35", "36"],
    "answer": "35"
  },
  {
    "id": "CHE204",
    "topic": "Atomic Structure",
    "question": "Isotopes are atoms of the same element having the same",
    "options": ["Mass number", "Number of neutrons", "Atomic number", "Physical state"],
    "answer": "Atomic number"
  },
  {
    "id": "CHE205",
    "topic": "Atomic Structure",
    "question": "Which particle determines the chemical properties of an element most directly?",
    "options": ["Neutron", "Valence electron", "Nucleus", "Proton"],
    "answer": "Valence electron"
  },
  {
    "id": "CHE206",
    "topic": "Electronic Configuration",
    "question": "The maximum number of electrons that can occupy the first shell is",
    "options": ["2", "4", "8", "18"],
    "answer": "2"
  },
  {
    "id": "CHE207",
    "topic": "Electronic Configuration",
    "question": "The electronic configuration of sodium, atomic number 11, is",
    "options": ["2,8,1", "2,7,2", "2,8,2", "8,2,1"],
    "answer": "2,8,1"
  },
  {
    "id": "CHE208",
    "topic": "Periodic Table",
    "question": "Elements in the same group of the periodic table generally have the same number of",
    "options": ["Electron shells", "Valence electrons", "Neutrons", "Nucleons"],
    "answer": "Valence electrons"
  },
  {
    "id": "CHE209",
    "topic": "Periodic Table",
    "question": "The modern periodic table is arranged according to increasing",
    "options": ["Mass number", "Atomic number", "Neutron number", "Density"],
    "answer": "Atomic number"
  },
  {
    "id": "CHE210",
    "topic": "Periodic Table",
    "question": "Which of the following is a Group 1 element?",
    "options": ["Calcium", "Sodium", "Chlorine", "Magnesium"],
    "answer": "Sodium"
  },
  {
    "id": "CHE211",
    "topic": "Periodic Table",
    "question": "The elements in Group 17 are known as",
    "options": ["Noble gases", "Alkali metals", "Halogens", "Transition metals"],
    "answer": "Halogens"
  },
  {
    "id": "CHE212",
    "topic": "Periodic Table",
    "question": "Which of the following is a noble gas?",
    "options": ["Chlorine", "Oxygen", "Neon", "Hydrogen"],
    "answer": "Neon"
  },
  {
    "id": "CHE213",
    "topic": "Chemical Bonding",
    "question": "An ionic bond is formed by",
    "options": ["Sharing of electrons", "Transfer of electrons", "Sharing of protons", "Transfer of neutrons"],
    "answer": "Transfer of electrons"
  },
  {
    "id": "CHE214",
    "topic": "Chemical Bonding",
    "question": "A covalent bond is formed by",
    "options": ["Transfer of electrons", "Sharing of electrons", "Transfer of protons", "Loss of neutrons"],
    "answer": "Sharing of electrons"
  },
  {
    "id": "CHE215",
    "topic": "Chemical Bonding",
    "question": "Which of the following compounds contains predominantly ionic bonding?",
    "options": ["CH4", "NaCl", "H2O", "CO2"],
    "answer": "NaCl"
  },
  {
    "id": "CHE216",
    "topic": "Chemical Bonding",
    "question": "The bond between hydrogen and chlorine in HCl is",
    "options": ["Ionic", "Polar covalent", "Metallic", "Coordinate metallic"],
    "answer": "Polar covalent"
  },
  {
    "id": "CHE217",
    "topic": "Chemical Bonding",
    "question": "Metallic bonding involves positive metal ions surrounded by",
    "options": ["Fixed protons", "Delocalized electrons", "Neutrons", "Molecules of water"],
    "answer": "Delocalized electrons"
  },
  {
    "id": "CHE218",
    "topic": "Chemical Combination",
    "question": "The law of conservation of mass states that mass is",
    "options": ["Created during a reaction", "Destroyed during a reaction", "Neither created nor destroyed", "Always doubled"],
    "answer": "Neither created nor destroyed"
  },
  {
    "id": "CHE219",
    "topic": "Chemical Combination",
    "question": "The law of definite proportions states that a pure compound always contains its elements in",
    "options": ["Variable proportions", "Fixed proportions by mass", "Equal volumes", "Equal numbers of atoms"],
    "answer": "Fixed proportions by mass"
  },
  {
    "id": "CHE220",
    "topic": "Chemical Combination",
    "question": "The formula H2O indicates that water contains hydrogen and oxygen in the atomic ratio",
    "options": ["1:1", "1:2", "2:1", "2:2"],
    "answer": "2:1"
  },
  {
    "id": "CHE221",
    "topic": "Mole Concept",
    "question": "One mole of a substance contains approximately",
    "options": ["6.02 × 10²³ particles", "3.01 × 10²³ particles", "9.81 × 10²³ particles", "1.00 × 10²³ particles"],
    "answer": "6.02 × 10²³ particles"
  },
  {
    "id": "CHE222",
    "topic": "Mole Concept",
    "question": "The molar mass of H2O is",
    "options": ["16 g/mol", "17 g/mol", "18 g/mol", "20 g/mol"],
    "answer": "18 g/mol"
  },
  {
    "id": "CHE223",
    "topic": "Mole Concept",
    "question": "The number of moles in 36 g of water is",
    "options": ["1 mol", "2 mol", "3 mol", "18 mol"],
    "answer": "2 mol"
  },
  {
    "id": "CHE224",
    "topic": "Mole Concept",
    "question": "What is the relative molecular mass of CO2? (C = 12, O = 16)",
    "options": ["28", "32", "40", "44"],
    "answer": "44"
  },
  {
    "id": "CHE225",
    "topic": "Mole Concept",
    "question": "At STP, one mole of an ideal gas occupies approximately",
    "options": ["11.2 dm³", "22.4 dm³", "24.0 dm³", "44.8 dm³"],
    "answer": "22.4 dm³"
  },
  {
    "id": "CHE226",
    "topic": "Chemical Equations",
    "question": "Which equation is correctly balanced?",
    "options": ["H2 + O2 → H2O", "2H2 + O2 → 2H2O", "H2 + 2O2 → H2O", "2H2 + 2O2 → H2O"],
    "answer": "2H2 + O2 → 2H2O"
  },
  {
    "id": "CHE227",
    "topic": "Chemical Equations",
    "question": "The coefficients in a balanced chemical equation represent the",
    "options": ["Colours of substances", "Relative amounts of substances", "Atomic numbers", "Melting points"],
    "answer": "Relative amounts of substances"
  },
  {
    "id": "CHE228",
    "topic": "Stoichiometry",
    "question": "When calcium carbonate decomposes, the products are calcium oxide and",
    "options": ["Hydrogen", "Carbon dioxide", "Oxygen", "Carbon monoxide"],
    "answer": "Carbon dioxide"
  },
  {
    "id": "CHE229",
    "topic": "Stoichiometry",
    "question": "From the equation 2H2 + O2 → 2H2O, how many moles of water are produced from 2 moles of hydrogen?",
    "options": ["1", "2", "3", "4"],
    "answer": "2"
  },
  {
    "id": "CHE230",
    "topic": "Stoichiometry",
    "question": "The empirical formula of a compound represents the",
    "options": ["Actual number of atoms only", "Simplest whole-number ratio of atoms", "Molecular mass", "Number of molecules"],
    "answer": "Simplest whole-number ratio of atoms"
  },
  {
    "id": "CHE231",
    "topic": "States of Matter",
    "question": "Which state of matter has a fixed volume but no fixed shape?",
    "options": ["Solid", "Liquid", "Gas", "Plasma only"],
    "answer": "Liquid"
  },
  {
    "id": "CHE232",
    "topic": "States of Matter",
    "question": "The change from solid directly to gas is called",
    "options": ["Evaporation", "Sublimation", "Condensation", "Freezing"],
    "answer": "Sublimation"
  },
  {
    "id": "CHE233",
    "topic": "States of Matter",
    "question": "Diffusion occurs fastest in",
    "options": ["Solids", "Liquids", "Gases", "Crystals"],
    "answer": "Gases"
  },
  {
    "id": "CHE234",
    "topic": "Gas Laws",
    "question": "Boyle's law states that at constant temperature, pressure is",
    "options": ["Directly proportional to volume", "Inversely proportional to volume", "Equal to volume", "Independent of volume"],
    "answer": "Inversely proportional to volume"
  },
  {
    "id": "CHE235",
    "topic": "Gas Laws",
    "question": "Charles' law states that at constant pressure, the volume of a gas is proportional to its",
    "options": ["Mass", "Absolute temperature", "Pressure", "Density"],
    "answer": "Absolute temperature"
  },
  {
    "id": "CHE236",
    "topic": "Gas Laws",
    "question": "If the temperature of a gas is increased at constant pressure, its volume generally",
    "options": ["Decreases", "Increases", "Becomes zero", "Remains exactly unchanged"],
    "answer": "Increases"
  },
  {
    "id": "CHE237",
    "topic": "Acids Bases and Salts",
    "question": "An acid turns blue litmus paper",
    "options": ["Green", "Red", "Yellow", "White"],
    "answer": "Red"
  },
  {
    "id": "CHE238",
    "topic": "Acids Bases and Salts",
    "question": "A base turns red litmus paper",
    "options": ["Blue", "Green", "Yellow", "Orange"],
    "answer": "Blue"
  },
  {
    "id": "CHE239",
    "topic": "Acids Bases and Salts",
    "question": "A solution with pH 2 is",
    "options": ["Strongly acidic", "Neutral", "Weakly alkaline", "Strongly alkaline"],
    "answer": "Strongly acidic"
  },
  {
    "id": "CHE240",
    "topic": "Acids Bases and Salts",
    "question": "A neutral solution at 25°C has a pH of",
    "options": ["0", "5", "7", "14"],
    "answer": "7"
  },
  {
    "id": "CHE241",
    "topic": "Acids Bases and Salts",
    "question": "The reaction between an acid and a base to form salt and water is called",
    "options": ["Oxidation", "Neutralization", "Reduction", "Polymerization"],
    "answer": "Neutralization"
  },
  {
    "id": "CHE242",
    "topic": "Acids Bases and Salts",
    "question": "Hydrochloric acid reacts with sodium hydroxide to form",
    "options": ["Sodium chloride and water", "Sodium oxide and hydrogen", "Chlorine and water", "Sodium and hydrogen chloride"],
    "answer": "Sodium chloride and water"
  },
  {
    "id": "CHE243",
    "topic": "Acids Bases and Salts",
    "question": "Which of the following is a strong acid?",
    "options": ["Ethanoic acid", "Hydrochloric acid", "Carbonic acid", "Citric acid"],
    "answer": "Hydrochloric acid"
  },
  {
    "id": "CHE244",
    "topic": "Acids Bases and Salts",
    "question": "Which of the following is a weak acid?",
    "options": ["HCl", "HNO3", "CH3COOH", "H2SO4"],
    "answer": "CH3COOH"
  },
  {
    "id": "CHE245",
    "topic": "Acids Bases and Salts",
    "question": "A salt formed from a strong acid and a strong base is generally",
    "options": ["Neutral", "Strongly acidic", "Strongly alkaline", "Always insoluble"],
    "answer": "Neutral"
  },
  {
    "id": "CHE246",
    "topic": "Acids Bases and Salts",
    "question": "The acid present in vinegar is",
    "options": ["Hydrochloric acid", "Ethanoic acid", "Sulfuric acid", "Nitric acid"],
    "answer": "Ethanoic acid"
  },
  {
    "id": "CHE247",
    "topic": "Solubility",
    "question": "A solution that contains the maximum amount of solute that can dissolve at a given temperature is",
    "options": ["Dilute", "Saturated", "Unsaturated", "Concentrated gas"],
    "answer": "Saturated"
  },
  {
    "id": "CHE248",
    "topic": "Solubility",
    "question": "The solubility of most solid substances in water generally increases with",
    "options": ["Decreasing temperature", "Increasing temperature", "Increasing pressure only", "Removing solvent"],
    "answer": "Increasing temperature"
  },
  {
    "id": "CHE249",
    "topic": "Water",
    "question": "The chemical formula of water is",
    "options": ["HO", "H2O", "H2O2", "OH"],
    "answer": "H2O"
  },
  {
    "id": "CHE250",
    "topic": "Water",
    "question": "Water is described as hard when it contains appreciable amounts of",
    "options": ["Sodium ions only", "Calcium and magnesium ions", "Hydrogen ions only", "Chloride ions only"],
    "answer": "Calcium and magnesium ions"
  },
  {
    "id": "CHE251",
    "topic": "Water",
    "question": "Temporary hardness of water can be removed by",
    "options": ["Boiling", "Freezing", "Filtration only", "Adding sand"],
    "answer": "Boiling"
  },
  {
    "id": "CHE252",
    "topic": "Water",
    "question": "Permanent hardness of water is commonly associated with",
    "options": ["Calcium and magnesium sulfates", "Sodium chloride", "Hydrogen chloride", "Potassium nitrate only"],
    "answer": "Calcium and magnesium sulfates"
  },
  {
    "id": "CHE253",
    "topic": "Water",
    "question": "The process of removing dissolved salts from water using a membrane is",
    "options": ["Distillation", "Reverse osmosis", "Sedimentation", "Decantation"],
    "answer": "Reverse osmosis"
  },
  {
    "id": "CHE254",
    "topic": "Water",
    "question": "Water suitable for drinking is called",
    "options": ["Distilled water only", "Potable water", "Hard water only", "Sea water"],
    "answer": "Potable water"
  },
  {
    "id": "CHE255",
    "topic": "Water",
    "question": "The gas produced when water is electrolysed at the cathode is",
    "options": ["Oxygen", "Hydrogen", "Chlorine", "Nitrogen"],
    "answer": "Hydrogen"
  },
  {
    "id": "CHE256",
    "topic": "Water",
    "question": "During electrolysis of acidified water, the volume ratio of hydrogen to oxygen produced is",
    "options": ["1:1", "1:2", "2:1", "3:1"],
    "answer": "2:1"
  },
  {
    "id": "CHE257",
    "topic": "Air",
    "question": "The major component of air is",
    "options": ["Oxygen", "Nitrogen", "Carbon dioxide", "Argon"],
    "answer": "Nitrogen"
  },
  {
    "id": "CHE258",
    "topic": "Air",
    "question": "The approximate percentage of oxygen in dry air is",
    "options": ["10%", "21%", "50%", "78%"],
    "answer": "21%"
  },
  {
    "id": "CHE259",
    "topic": "Air",
    "question": "The gas present in air at about 78% by volume is",
    "options": ["Oxygen", "Nitrogen", "Carbon dioxide", "Hydrogen"],
    "answer": "Nitrogen"
  },
  {
    "id": "CHE260",
    "topic": "Air",
    "question": "The noble gas present in the largest proportion in air is",
    "options": ["Neon", "Argon", "Helium", "Krypton"],
    "answer": "Argon"
  },
  {
    "id": "CHE261",
    "topic": "Air",
    "question": "Carbon dioxide is removed from air in the laboratory using",
    "options": ["Sodium hydroxide solution", "Water only", "Hydrogen chloride", "Sodium chloride"],
    "answer": "Sodium hydroxide solution"
  },
  {
    "id": "CHE262",
    "topic": "Air Pollution",
    "question": "Which gas is a major contributor to acid rain?",
    "options": ["Oxygen", "Sulfur dioxide", "Nitrogen", "Argon"],
    "answer": "Sulfur dioxide"
  },
  {
    "id": "CHE263",
    "topic": "Air Pollution",
    "question": "Carbon monoxide is particularly dangerous because it",
    "options": ["Supports combustion strongly", "Combines with haemoglobin", "Is highly soluble in water", "Produces oxygen"],
    "answer": "Combines with haemoglobin"
  },
  {
    "id": "CHE264",
    "topic": "Air Pollution",
    "question": "The main greenhouse gas produced by complete combustion of fossil fuels is",
    "options": ["Carbon dioxide", "Hydrogen", "Nitrogen", "Helium"],
    "answer": "Carbon dioxide"
  },
  {
    "id": "CHE265",
    "topic": "Energy Changes",
    "question": "A reaction that releases heat to the surroundings is",
    "options": ["Endothermic", "Exothermic", "Reversible only", "Neutral"],
    "answer": "Exothermic"
  },
  {
    "id": "CHE266",
    "topic": "Energy Changes",
    "question": "A reaction that absorbs heat from the surroundings is",
    "options": ["Exothermic", "Endothermic", "Combustion", "Neutralization only"],
    "answer": "Endothermic"
  },
  {
    "id": "CHE267",
    "topic": "Energy Changes",
    "question": "Combustion reactions are generally",
    "options": ["Endothermic", "Exothermic", "Always reversible", "Always neutral"],
    "answer": "Exothermic"
  },
  {
    "id": "CHE268",
    "topic": "Energy Changes",
    "question": "The energy required to break a chemical bond is called",
    "options": ["Bond energy", "Ionization mass", "Atomic number", "Activation volume"],
    "answer": "Bond energy"
  },
  {
    "id": "CHE269",
    "topic": "Energy Changes",
    "question": "The minimum energy required for a reaction to occur is called",
    "options": ["Bond energy", "Activation energy", "Ionization energy", "Heat capacity"],
    "answer": "Activation energy"
  },
  {
    "id": "CHE270",
    "topic": "Rates of Reaction",
    "question": "The rate of a chemical reaction generally increases when temperature is",
    "options": ["Decreased", "Increased", "Kept at zero", "Removed"],
    "answer": "Increased"
  },
  {
    "id": "CHE271",
    "topic": "Rates of Reaction",
    "question": "A catalyst increases the rate of a reaction by",
    "options": ["Increasing the activation energy", "Lowering the activation energy", "Increasing the mass of reactants", "Changing the products"],
    "answer": "Lowering the activation energy"
  },
  {
    "id": "CHE272",
    "topic": "Rates of Reaction",
    "question": "Increasing the concentration of reactants generally increases reaction rate because",
    "options": ["There are more effective collisions", "The molecules disappear", "Temperature becomes zero", "Pressure always decreases"],
    "answer": "There are more effective collisions"
  },
  {
    "id": "CHE273",
    "topic": "Rates of Reaction",
    "question": "Powdered calcium carbonate reacts faster with dilute hydrochloric acid than large lumps mainly because the powder has",
    "options": ["Lower temperature", "Greater surface area", "Less mass always", "Higher density"],
    "answer": "Greater surface area"
  },
  {
    "id": "CHE274",
    "topic": "Chemical Equilibrium",
    "question": "A reversible reaction is one in which",
    "options": ["Products cannot react", "Reactants and products can interconvert", "Only products are formed", "Only reactants are formed"],
    "answer": "Reactants and products can interconvert"
  },
  {
    "id": "CHE275",
    "topic": "Chemical Equilibrium",
    "question": "At dynamic equilibrium, the forward and reverse reactions have",
    "options": ["Stopped completely", "Equal rates", "Equal concentrations", "Equal masses"],
    "answer": "Equal rates"
  },
  {
    "id": "CHE276",
    "topic": "Chemical Equilibrium",
    "question": "According to Le Chatelier's principle, an equilibrium system responds to a change by",
    "options": ["Always stopping", "Opposing the imposed change", "Increasing the change", "Destroying the products"],
    "answer": "Opposing the imposed change"
  },
  {
    "id": "CHE277",
    "topic": "Metals",
    "question": "Which of the following is an alkali metal?",
    "options": ["Calcium", "Sodium", "Aluminium", "Iron"],
    "answer": "Sodium"
  },
  {
    "id": "CHE278",
    "topic": "Metals",
    "question": "Which of the following is an alkaline earth metal?",
    "options": ["Sodium", "Magnesium", "Potassium", "Chlorine"],
    "answer": "Magnesium"
  },
  {
    "id": "CHE279",
    "topic": "Metals",
    "question": "The most abundant metal in the Earth's crust is",
    "options": ["Iron", "Aluminium", "Copper", "Sodium"],
    "answer": "Aluminium"
  },
  {
    "id": "CHE280",
    "topic": "Metals",
    "question": "Which metal is extracted from bauxite?",
    "options": ["Iron", "Copper", "Aluminium", "Zinc"],
    "answer": "Aluminium"
  },
  {
    "id": "CHE281",
    "topic": "Metals",
    "question": "The chief ore of iron is",
    "options": ["Haematite", "Bauxite", "Galena", "Calamine"],
    "answer": "Haematite"
  },
  {
    "id": "CHE282",
    "topic": "Metals",
    "question": "The chief ore of aluminium is",
    "options": ["Haematite", "Bauxite", "Malachite", "Cassiterite"],
    "answer": "Bauxite"
  },
  {
    "id": "CHE283",
    "topic": "Metals",
    "question": "The extraction of iron from its ore is carried out in a",
    "options": ["Blast furnace", "Electrolytic cell only", "Distillation column", "Fractionating column"],
    "answer": "Blast furnace"
  },
  {
    "id": "CHE284",
    "topic": "Metals",
    "question": "The main reducing agent in the blast furnace is",
    "options": ["Carbon monoxide", "Oxygen", "Nitrogen", "Water"],
    "answer": "Carbon monoxide"
  },
  {
    "id": "CHE285",
    "topic": "Metals",
    "question": "Limestone is added to the blast furnace mainly to",
    "options": ["Produce oxygen", "Remove silica as slag", "Produce hydrogen", "Increase iron purity directly"],
    "answer": "Remove silica as slag"
  },
  {
    "id": "CHE286",
    "topic": "Metals",
    "question": "The main component of the slag formed in iron extraction is",
    "options": ["Calcium silicate", "Sodium chloride", "Calcium carbonate", "Iron sulfide"],
    "answer": "Calcium silicate"
  },
  {
    "id": "CHE287",
    "topic": "Metals",
    "question": "Which metal is commonly used for electrical wiring because of its high electrical conductivity?",
    "options": ["Copper", "Iron", "Lead", "Sodium"],
    "answer": "Copper"
  },
  {
    "id": "CHE288",
    "topic": "Metals",
    "question": "Copper is purified industrially by",
    "options": ["Electrolysis", "Filtration", "Sublimation", "Decantation"],
    "answer": "Electrolysis"
  },
  {
    "id": "CHE289",
    "topic": "Metals",
    "question": "Rusting of iron requires",
    "options": ["Nitrogen only", "Oxygen and water", "Carbon dioxide only", "Hydrogen only"],
    "answer": "Oxygen and water"
  },
  {
    "id": "CHE290",
    "topic": "Metals",
    "question": "Galvanizing protects iron from rusting by coating it with",
    "options": ["Copper", "Zinc", "Silver", "Aluminium"],
    "answer": "Zinc"
  },
  {
    "id": "CHE291",
    "topic": "Metals and Compounds",
    "question": "Sodium reacts vigorously with water to produce sodium hydroxide and",
    "options": ["Oxygen", "Hydrogen", "Chlorine", "Nitrogen"],
    "answer": "Hydrogen"
  },
  {
    "id": "CHE292",
    "topic": "Metals and Compounds",
    "question": "Calcium reacts with water to produce calcium hydroxide and",
    "options": ["Hydrogen", "Oxygen", "Nitrogen", "Chlorine"],
    "answer": "Hydrogen"
  },
  {
    "id": "CHE293",
    "topic": "Metals and Compounds",
    "question": "Magnesium burns in oxygen to form",
    "options": ["Magnesium chloride", "Magnesium oxide", "Magnesium hydroxide", "Magnesium carbonate"],
    "answer": "Magnesium oxide"
  },
  {
    "id": "CHE294",
    "topic": "Metals and Compounds",
    "question": "The colour of copper(II) sulfate solution is usually",
    "options": ["Blue", "Green", "Yellow", "Purple"],
    "answer": "Blue"
  },
  {
    "id": "CHE295",
    "topic": "Metals and Compounds",
    "question": "Iron(II) compounds generally contain iron in the oxidation state",
    "options": ["+1", "+2", "+3", "+4"],
    "answer": "+2"
  },
  {
    "id": "CHE296",
    "topic": "Metals and Compounds",
    "question": "Iron(III) compounds generally contain iron in the oxidation state",
    "options": ["+1", "+2", "+3", "+4"],
    "answer": "+3"
  },
  {
    "id": "CHE297",
    "topic": "Metals and Compounds",
    "question": "Aluminium oxide is described as amphoteric because it reacts with",
    "options": ["Acids only", "Bases only", "Both acids and bases", "Water only"],
    "answer": "Both acids and bases"
  },
  {
    "id": "CHE298",
    "topic": "Metals and Compounds",
    "question": "Zinc reacts with dilute hydrochloric acid to produce zinc chloride and",
    "options": ["Oxygen", "Hydrogen", "Nitrogen", "Chlorine"],
    "answer": "Hydrogen"
  },
  {
    "id": "CHE299",
    "topic": "Metals and Compounds",
    "question": "Which metal is liquid at room temperature?",
    "options": ["Mercury", "Iron", "Copper", "Aluminium"],
    "answer": "Mercury"
  },
  {
    "id": "CHE300",
    "topic": "Metals and Compounds",
    "question": "Brass is an alloy mainly consisting of copper and",
    "options": ["Iron", "Zinc", "Tin", "Lead"],
    "answer": "Zinc"
  },

  {
    "id": "CHE301",
    "topic": "Periodic Table",
    "question": "Which of the following elements has the highest electronegativity?",
    "options": ["Fluorine", "Chlorine", "Oxygen", "Nitrogen"],
    "answer": "Fluorine"
  },
  {
    "id": "CHE302",
    "topic": "Periodic Table",
    "question": "Across a period in the periodic table, atomic radius generally",
    "options": ["Increases", "Decreases", "Remains constant", "First decreases then increases"],
    "answer": "Decreases"
  },
  {
    "id": "CHE303",
    "topic": "Periodic Table",
    "question": "Down Group 1 of the periodic table, the reactivity of the elements generally",
    "options": ["Decreases", "Increases", "Remains constant", "Becomes zero"],
    "answer": "Increases"
  },
  {
    "id": "CHE304",
    "topic": "Periodic Table",
    "question": "Which of the following elements belongs to Group 2?",
    "options": ["Potassium", "Calcium", "Aluminium", "Chlorine"],
    "answer": "Calcium"
  },
  {
    "id": "CHE305",
    "topic": "Periodic Table",
    "question": "An element with electronic configuration 2,8,7 belongs to",
    "options": ["Group 1", "Group 2", "Group 17", "Group 18"],
    "answer": "Group 17"
  },
  {
    "id": "CHE306",
    "topic": "Periodic Table",
    "question": "Which of the following is a transition metal?",
    "options": ["Sodium", "Calcium", "Iron", "Chlorine"],
    "answer": "Iron"
  },
  {
    "id": "CHE307",
    "topic": "Periodic Table",
    "question": "The elements in Group 18 are generally unreactive because they",
    "options": ["Have very high densities", "Have complete outer electron shells", "Have no electrons", "Are all metals"],
    "answer": "Have complete outer electron shells"
  },
  {
    "id": "CHE308",
    "topic": "Periodic Table",
    "question": "Which of the following is a metalloid?",
    "options": ["Sodium", "Silicon", "Calcium", "Chlorine"],
    "answer": "Silicon"
  },
  {
    "id": "CHE309",
    "topic": "Periodic Table",
    "question": "The period number of an element indicates the number of",
    "options": ["Protons", "Valence electrons", "Occupied electron shells", "Neutrons"],
    "answer": "Occupied electron shells"
  },
  {
    "id": "CHE310",
    "topic": "Periodic Table",
    "question": "Which of the following elements has the electronic configuration 2,8,8?",
    "options": ["Argon", "Chlorine", "Potassium", "Neon"],
    "answer": "Argon"
  },

  {
    "id": "CHE311",
    "topic": "Rate of Chemical Reactions",
    "question": "The rate of a chemical reaction can be expressed as the change in concentration of a reactant or product per unit",
    "options": ["Mass", "Time", "Temperature", "Volume"],
    "answer": "Time"
  },
  {
    "id": "CHE312",
    "topic": "Rate of Chemical Reactions",
    "question": "Which factor does NOT normally affect the rate of a chemical reaction?",
    "options": ["Temperature", "Concentration", "Surface area", "Colour of the reactants"],
    "answer": "Colour of the reactants"
  },
  {
    "id": "CHE313",
    "topic": "Rate of Chemical Reactions",
    "question": "Increasing the temperature of a reaction increases its rate mainly because particles",
    "options": ["Become heavier", "Move more slowly", "Collide more frequently and energetically", "Lose all their energy"],
    "answer": "Collide more frequently and energetically"
  },
  {
    "id": "CHE314",
    "topic": "Rate of Chemical Reactions",
    "question": "A catalyst affects a chemical reaction by",
    "options": ["Increasing the activation energy", "Providing an alternative pathway with lower activation energy", "Increasing the amount of product permanently", "Changing the equilibrium constant"],
    "answer": "Providing an alternative pathway with lower activation energy"
  },
  {
    "id": "CHE315",
    "topic": "Rate of Chemical Reactions",
    "question": "Which of the following would increase the rate of reaction between marble chips and dilute hydrochloric acid?",
    "options": ["Using larger marble chips", "Lowering the temperature", "Using powdered marble", "Diluting the acid further"],
    "answer": "Using powdered marble"
  },
  {
    "id": "CHE316",
    "topic": "Rate of Chemical Reactions",
    "question": "For a reaction involving gases, increasing pressure generally increases the rate because it",
    "options": ["Decreases particle collisions", "Increases the concentration of gas particles", "Stops molecular movement", "Decreases temperature"],
    "answer": "Increases the concentration of gas particles"
  },
  {
    "id": "CHE317",
    "topic": "Rate of Chemical Reactions",
    "question": "A reaction is fastest when the reactant particles have",
    "options": ["No kinetic energy", "Sufficient energy to overcome the activation energy", "Very low temperatures", "No collisions"],
    "answer": "Sufficient energy to overcome the activation energy"
  },
  {
    "id": "CHE318",
    "topic": "Rate of Chemical Reactions",
    "question": "Which apparatus is most suitable for measuring the volume of gas produced during a reaction?",
    "options": ["Thermometer", "Gas syringe", "Burette only", "Balance"],
    "answer": "Gas syringe"
  },
  {
    "id": "CHE319",
    "topic": "Rate of Chemical Reactions",
    "question": "If a reaction produces 60 cm³ of gas in 30 seconds, its average rate of gas production is",
    "options": ["0.5 cm³/s", "2 cm³/s", "30 cm³/s", "90 cm³/s"],
    "answer": "2 cm³/s"
  },
  {
    "id": "CHE320",
    "topic": "Rate of Chemical Reactions",
    "question": "A graph of volume of gas produced against time becomes horizontal when",
    "options": ["The reaction has stopped producing gas", "The temperature is increasing", "The catalyst is added", "The reactant concentration doubles"],
    "answer": "The reaction has stopped producing gas"
  },

  {
    "id": "CHE321",
    "topic": "Organic Chemistry",
    "question": "Organic chemistry is mainly the study of compounds of",
    "options": ["Sodium", "Carbon", "Calcium", "Iron"],
    "answer": "Carbon"
  },
  {
    "id": "CHE322",
    "topic": "Organic Chemistry",
    "question": "The ability of carbon atoms to form long chains with one another is known as",
    "options": ["Ionization", "Catenation", "Hydrolysis", "Electrolysis"],
    "answer": "Catenation"
  },
  {
    "id": "CHE323",
    "topic": "Organic Chemistry",
    "question": "A hydrocarbon contains only",
    "options": ["Carbon and hydrogen", "Carbon and oxygen", "Hydrogen and oxygen", "Carbon and nitrogen"],
    "answer": "Carbon and hydrogen"
  },
  {
    "id": "CHE324",
    "topic": "Organic Chemistry",
    "question": "Which of the following is a hydrocarbon?",
    "options": ["CH4", "CH3OH", "CH3COOH", "C2H5OH"],
    "answer": "CH4"
  },
  {
    "id": "CHE325",
    "topic": "Alkanes",
    "question": "The general formula for alkanes is",
    "options": ["CnH2n", "CnH2n+2", "CnH2n-2", "CnHn"],
    "answer": "CnH2n+2"
  },
  {
    "id": "CHE326",
    "topic": "Alkanes",
    "question": "The simplest alkane is",
    "options": ["Ethane", "Methane", "Propane", "Butane"],
    "answer": "Methane"
  },
  {
    "id": "CHE327",
    "topic": "Alkanes",
    "question": "The molecular formula of ethane is",
    "options": ["CH4", "C2H4", "C2H6", "C3H8"],
    "answer": "C2H6"
  },
  {
    "id": "CHE328",
    "topic": "Alkanes",
    "question": "Which of the following is an alkane?",
    "options": ["C2H4", "C2H2", "C3H8", "C3H6"],
    "answer": "C3H8"
  },
  {
    "id": "CHE329",
    "topic": "Alkanes",
    "question": "The reaction of an alkane with chlorine in the presence of ultraviolet light is known as",
    "options": ["Addition", "Substitution", "Esterification", "Neutralization"],
    "answer": "Substitution"
  },
  {
    "id": "CHE330",
    "topic": "Alkanes",
    "question": "Complete combustion of methane produces",
    "options": ["Carbon and hydrogen", "Carbon monoxide and water", "Carbon dioxide and water", "Carbon and oxygen"],
    "answer": "Carbon dioxide and water"
  },

  {
    "id": "CHE331",
    "topic": "Alkenes",
    "question": "The general formula for alkenes is",
    "options": ["CnH2n+2", "CnH2n", "CnH2n-2", "CnHn+2"],
    "answer": "CnH2n"
  },
  {
    "id": "CHE332",
    "topic": "Alkenes",
    "question": "The simplest alkene is",
    "options": ["Methene", "Ethene", "Propene", "Butene"],
    "answer": "Ethene"
  },
  {
    "id": "CHE333",
    "topic": "Alkenes",
    "question": "The molecular formula of propene is",
    "options": ["C3H6", "C3H8", "C2H4", "C4H8"],
    "answer": "C3H6"
  },
  {
    "id": "CHE334",
    "topic": "Alkenes",
    "question": "An alkene can be distinguished from an alkane using",
    "options": ["Bromine water", "Sodium chloride solution", "Distilled water", "Limewater"],
    "answer": "Bromine water"
  },
  {
    "id": "CHE335",
    "topic": "Alkenes",
    "question": "Ethene decolourizes bromine water because it undergoes",
    "options": ["Substitution", "Addition", "Neutralization", "Combustion only"],
    "answer": "Addition"
  },
  {
    "id": "CHE336",
    "topic": "Alkenes",
    "question": "The product formed when ethene reacts with hydrogen is",
    "options": ["Methane", "Ethane", "Ethyne", "Ethanol"],
    "answer": "Ethane"
  },
  {
    "id": "CHE337",
    "topic": "Alkenes",
    "question": "The polymer formed from ethene is",
    "options": ["Polyethene", "PVC", "Nylon", "Polyester"],
    "answer": "Polyethene"
  },
  {
    "id": "CHE338",
    "topic": "Alkenes",
    "question": "The process by which many alkene molecules join to form a long-chain molecule is",
    "options": ["Polymerization", "Neutralization", "Oxidation", "Esterification"],
    "answer": "Polymerization"
  },

  {
    "id": "CHE339",
    "topic": "Alkynes",
    "question": "The general formula of alkynes is",
    "options": ["CnH2n+2", "CnH2n", "CnH2n-2", "CnHn"],
    "answer": "CnH2n-2"
  },
  {
    "id": "CHE340",
    "topic": "Alkynes",
    "question": "The simplest alkyne is",
    "options": ["Methyne", "Ethyne", "Propyne", "Butyne"],
    "answer": "Ethyne"
  },
  {
    "id": "CHE341",
    "topic": "Alkynes",
    "question": "The common name of ethyne is",
    "options": ["Ethylene", "Acetylene", "Methane", "Propylene"],
    "answer": "Acetylene"
  },
  {
    "id": "CHE342",
    "topic": "Alkynes",
    "question": "Ethyne contains a",
    "options": ["Single carbon-carbon bond", "Double carbon-carbon bond", "Triple carbon-carbon bond", "Metallic bond"],
    "answer": "Triple carbon-carbon bond"
  },

  {
    "id": "CHE343",
    "topic": "Homologous Series",
    "question": "Members of a homologous series have the same",
    "options": ["Molecular mass", "General formula and functional group", "Number of carbon atoms", "Boiling point"],
    "answer": "General formula and functional group"
  },
  {
    "id": "CHE344",
    "topic": "Homologous Series",
    "question": "Successive members of a homologous series differ by",
    "options": ["CH", "CH2", "C2H2", "H2"],
    "answer": "CH2"
  },
  {
    "id": "CHE345",
    "topic": "Homologous Series",
    "question": "Which pair belongs to the same homologous series?",
    "options": ["Methane and ethene", "Ethane and propane", "Ethanol and ethene", "Ethene and ethyne"],
    "answer": "Ethane and propane"
  },

  {
    "id": "CHE346",
    "topic": "Isomerism",
    "question": "Compounds having the same molecular formula but different structural formulae are called",
    "options": ["Isotopes", "Isomers", "Polymers", "Electrolytes"],
    "answer": "Isomers"
  },
  {
    "id": "CHE347",
    "topic": "Isomerism",
    "question": "Which pair represents structural isomers?",
    "options": ["CH4 and C2H6", "C4H10 and C4H10 with different structures", "H2 and H2O", "CO2 and CO"],
    "answer": "C4H10 and C4H10 with different structures"
  },
  {
    "id": "CHE348",
    "topic": "Isomerism",
    "question": "The number of structural isomers of butane is",
    "options": ["1", "2", "3", "4"],
    "answer": "2"
  },

  {
    "id": "CHE349",
    "topic": "Alcohols",
    "question": "The functional group present in alcohols is",
    "options": ["-COOH", "-OH", "-CHO", "-COO-"],
    "answer": "-OH"
  },
  {
    "id": "CHE350",
    "topic": "Alcohols",
    "question": "The molecular formula of ethanol is",
    "options": ["CH3OH", "C2H5OH", "C2H4OH", "C3H7OH"],
    "answer": "C2H5OH"
  },
  {
    "id": "CHE351",
    "topic": "Alcohols",
    "question": "Ethanol can be produced industrially by the hydration of",
    "options": ["Methane", "Ethene", "Ethane", "Ethyne"],
    "answer": "Ethene"
  },
  {
    "id": "CHE352",
    "topic": "Alcohols",
    "question": "Ethanol can be oxidized to",
    "options": ["Ethanoic acid", "Ethene only", "Methane", "Propane"],
    "answer": "Ethanoic acid"
  },
  {
    "id": "CHE353",
    "topic": "Alcohols",
    "question": "The dehydration of ethanol produces",
    "options": ["Ethane", "Ethene", "Ethanoic acid", "Methane"],
    "answer": "Ethene"
  },
  {
    "id": "CHE354",
    "topic": "Alcohols",
    "question": "Fermentation of glucose produces ethanol and",
    "options": ["Oxygen", "Carbon dioxide", "Nitrogen", "Hydrogen chloride"],
    "answer": "Carbon dioxide"
  },
  {
    "id": "CHE355",
    "topic": "Alcohols",
    "question": "The enzyme responsible for fermentation of sugars is found in",
    "options": ["Yeast", "Algae only", "Sand", "Sodium chloride"],
    "answer": "Yeast"
  },

  {
    "id": "CHE356",
    "topic": "Carboxylic Acids",
    "question": "The functional group of carboxylic acids is",
    "options": ["-OH", "-COOH", "-NH2", "-CHO"],
    "answer": "-COOH"
  },
  {
    "id": "CHE357",
    "topic": "Carboxylic Acids",
    "question": "The acid present in vinegar is",
    "options": ["Methanoic acid", "Ethanoic acid", "Propanoic acid", "Butanoic acid"],
    "answer": "Ethanoic acid"
  },
  {
    "id": "CHE358",
    "topic": "Carboxylic Acids",
    "question": "Ethanoic acid reacts with sodium carbonate to produce carbon dioxide and",
    "options": ["Sodium ethanoate and water", "Sodium chloride and hydrogen", "Methane and water", "Ethene and oxygen"],
    "answer": "Sodium ethanoate and water"
  },
  {
    "id": "CHE359",
    "topic": "Carboxylic Acids",
    "question": "The reaction between ethanoic acid and ethanol produces",
    "options": ["Ethane", "Ethyl ethanoate", "Ethene", "Methane"],
    "answer": "Ethyl ethanoate"
  },

  {
    "id": "CHE360",
    "topic": "Esters",
    "question": "Esters are commonly formed by the reaction between an alcohol and a",
    "options": ["Carboxylic acid", "Alkane", "Metal", "Noble gas"],
    "answer": "Carboxylic acid"
  },
  {
    "id": "CHE361",
    "topic": "Esters",
    "question": "The reaction between an alcohol and a carboxylic acid to form an ester is called",
    "options": ["Hydrogenation", "Esterification", "Polymerization", "Neutralization"],
    "answer": "Esterification"
  },
  {
    "id": "CHE362",
    "topic": "Esters",
    "question": "Many esters are characterized by",
    "options": ["Pleasant fruity smells", "Strong metallic properties", "No smell at all", "Very high electrical conductivity"],
    "answer": "Pleasant fruity smells"
  },

  {
    "id": "CHE363",
    "topic": "Organic Reactions",
    "question": "The reaction in which hydrogen is added to an unsaturated hydrocarbon is called",
    "options": ["Hydrogenation", "Hydrolysis", "Esterification", "Substitution"],
    "answer": "Hydrogenation"
  },
  {
    "id": "CHE364",
    "topic": "Organic Reactions",
    "question": "Hydrogenation of vegetable oil generally converts it into",
    "options": ["A more saturated fat", "Carbon dioxide", "Ethanol", "Methane"],
    "answer": "A more saturated fat"
  },
  {
    "id": "CHE365",
    "topic": "Organic Reactions",
    "question": "The catalyst commonly used for hydrogenation of vegetable oils is",
    "options": ["Nickel", "Copper sulfate", "Sodium chloride", "Calcium carbonate"],
    "answer": "Nickel"
  },
  {
    "id": "CHE366",
    "topic": "Organic Reactions",
    "question": "Hydrolysis of an ester produces an alcohol and a",
    "options": ["Carboxylic acid", "Alkane", "Metal oxide", "Noble gas"],
    "answer": "Carboxylic acid"
  },

  {
    "id": "CHE367",
    "topic": "Petroleum",
    "question": "Crude oil is mainly a mixture of",
    "options": ["Carbohydrates", "Hydrocarbons", "Proteins", "Metal oxides"],
    "answer": "Hydrocarbons"
  },
  {
    "id": "CHE368",
    "topic": "Petroleum",
    "question": "The separation of crude oil into useful fractions is carried out by",
    "options": ["Simple filtration", "Fractional distillation", "Electrolysis", "Chromatography only"],
    "answer": "Fractional distillation"
  },
  {
    "id": "CHE369",
    "topic": "Petroleum",
    "question": "The fraction of crude oil used mainly as fuel for aircraft is",
    "options": ["Kerosene", "Bitumen", "Lubricating oil", "Refinery gas"],
    "answer": "Kerosene"
  },
  {
    "id": "CHE370",
    "topic": "Petroleum",
    "question": "The fraction of crude oil used as fuel in many motor vehicles is",
    "options": ["Petrol", "Bitumen", "Paraffin wax", "Lubricating oil"],
    "answer": "Petrol"
  },
  {
    "id": "CHE371",
    "topic": "Petroleum",
    "question": "Bitumen is mainly used for",
    "options": ["Road surfacing", "Making drinking water", "Producing oxygen", "Making fertilizers directly"],
    "answer": "Road surfacing"
  },
  {
    "id": "CHE372",
    "topic": "Petroleum",
    "question": "Cracking of hydrocarbons is used mainly to produce",
    "options": ["Larger molecules only", "Smaller useful hydrocarbons", "Water only", "Metallic compounds"],
    "answer": "Smaller useful hydrocarbons"
  },
  {
    "id": "CHE373",
    "topic": "Petroleum",
    "question": "Catalytic cracking is carried out using",
    "options": ["A catalyst at high temperature", "Cold water only", "Sodium chloride solution", "Ice"],
    "answer": "A catalyst at high temperature"
  },
  {
    "id": "CHE374",
    "topic": "Petroleum",
    "question": "The octane number of petrol is related to its",
    "options": ["Resistance to knocking", "Colour", "Density of water", "Sulfur content only"],
    "answer": "Resistance to knocking"
  },

  {
    "id": "CHE375",
    "topic": "Polymers",
    "question": "A polymer is a substance formed from many repeating",
    "options": ["Monomer units", "Metal ions", "Neutrons", "Salts"],
    "answer": "Monomer units"
  },
  {
    "id": "CHE376",
    "topic": "Polymers",
    "question": "The small molecules that join together to form polymers are called",
    "options": ["Monomers", "Electrolytes", "Catalysts", "Isotopes"],
    "answer": "Monomers"
  },
  {
    "id": "CHE377",
    "topic": "Polymers",
    "question": "Polyvinyl chloride is commonly abbreviated as",
    "options": ["PVC", "PET", "DNA", "ATP"],
    "answer": "PVC"
  },
  {
    "id": "CHE378",
    "topic": "Polymers",
    "question": "PVC is produced from the monomer",
    "options": ["Ethene", "Chloroethene", "Methane", "Ethanol"],
    "answer": "Chloroethene"
  },
  {
    "id": "CHE379",
    "topic": "Polymers",
    "question": "A major environmental problem associated with many synthetic polymers is that they",
    "options": ["Decompose very rapidly", "Are often difficult to biodegrade", "Produce oxygen", "Dissolve immediately in water"],
    "answer": "Are often difficult to biodegrade"
  },

  {
    "id": "CHE380",
    "topic": "Nitrogen Compounds",
    "question": "The formula of ammonia is",
    "options": ["NH3", "NO2", "N2O", "NH4"],
    "answer": "NH3"
  },
  {
    "id": "CHE381",
    "topic": "Nitrogen Compounds",
    "question": "The Haber process is used industrially to manufacture",
    "options": ["Ammonia", "Sulfuric acid", "Ethanol", "Chlorine"],
    "answer": "Ammonia"
  },
  {
    "id": "CHE382",
    "topic": "Nitrogen Compounds",
    "question": "The raw materials used in the Haber process are mainly nitrogen and",
    "options": ["Oxygen", "Hydrogen", "Chlorine", "Carbon dioxide"],
    "answer": "Hydrogen"
  },
  {
    "id": "CHE383",
    "topic": "Nitrogen Compounds",
    "question": "Ammonia reacts with hydrogen chloride to form",
    "options": ["Ammonium chloride", "Sodium chloride", "Ammonium nitrate", "Nitrogen dioxide"],
    "answer": "Ammonium chloride"
  },
  {
    "id": "CHE384",
    "topic": "Nitrogen Compounds",
    "question": "Nitric acid has the chemical formula",
    "options": ["HNO3", "HNO2", "H2SO4", "HCl"],
    "answer": "HNO3"
  },

  {
    "id": "CHE385",
    "topic": "Sulfur Compounds",
    "question": "The formula of sulfur dioxide is",
    "options": ["SO", "SO2", "SO3", "S2O"],
    "answer": "SO2"
  },
  {
    "id": "CHE386",
    "topic": "Sulfur Compounds",
    "question": "Sulfur dioxide is commonly produced when sulfur is",
    "options": ["Burned in oxygen", "Mixed with water only", "Frozen", "Reacted with nitrogen"],
    "answer": "Burned in oxygen"
  },
  {
    "id": "CHE387",
    "topic": "Sulfur Compounds",
    "question": "Sulfuric acid has the formula",
    "options": ["H2SO3", "H2SO4", "HSO4", "H2S"],
    "answer": "H2SO4"
  },
  {
    "id": "CHE388",
    "topic": "Sulfur Compounds",
    "question": "The catalyst used in the Contact process for sulfuric acid manufacture is",
    "options": ["Vanadium(V) oxide", "Iron", "Nickel", "Copper"],
    "answer": "Vanadium(V) oxide"
  },

  {
    "id": "CHE389",
    "topic": "Chlorine Compounds",
    "question": "Chlorine is a member of the",
    "options": ["Alkali metals", "Halogens", "Noble gases", "Alkaline earth metals"],
    "answer": "Halogens"
  },
  {
    "id": "CHE390",
    "topic": "Chlorine Compounds",
    "question": "Chlorine gas is commonly described as",
    "options": ["Colourless and odourless", "Greenish-yellow with a choking smell", "Blue and sweet-smelling", "Black and odourless"],
    "answer": "Greenish-yellow with a choking smell"
  },
  {
    "id": "CHE391",
    "topic": "Chlorine Compounds",
    "question": "Chlorine reacts with sodium hydroxide to form products including",
    "options": ["Sodium chloride", "Sodium nitrate only", "Calcium carbonate", "Magnesium sulfate"],
    "answer": "Sodium chloride"
  },
  {
    "id": "CHE392",
    "topic": "Chlorine Compounds",
    "question": "Chlorine is used in water treatment mainly because it",
    "options": ["Adds hardness", "Kills microorganisms", "Removes all minerals", "Produces hydrogen"],
    "answer": "Kills microorganisms"
  },

  {
    "id": "CHE393",
    "topic": "Oxygen",
    "question": "Oxygen supports",
    "options": ["Combustion", "Rust prevention", "Freezing", "Neutralization only"],
    "answer": "Combustion"
  },
  {
    "id": "CHE394",
    "topic": "Oxygen",
    "question": "The laboratory preparation of oxygen can involve the decomposition of",
    "options": ["Hydrogen peroxide", "Sodium chloride", "Ethanol", "Calcium carbonate only"],
    "answer": "Hydrogen peroxide"
  },
  {
    "id": "CHE395",
    "topic": "Oxygen",
    "question": "The catalyst commonly used in the decomposition of hydrogen peroxide is",
    "options": ["Manganese(IV) oxide", "Copper metal", "Sodium chloride", "Calcium oxide"],
    "answer": "Manganese(IV) oxide"
  },

  {
    "id": "CHE396",
    "topic": "Carbon and Its Compounds",
    "question": "Which allotrope of carbon conducts electricity well?",
    "options": ["Diamond", "Graphite", "Charcoal only", "Coke only"],
    "answer": "Graphite"
  },
  {
    "id": "CHE397",
    "topic": "Carbon and Its Compounds",
    "question": "Diamond is very hard because each carbon atom is strongly bonded to",
    "options": ["One other carbon atom", "Four other carbon atoms", "Two oxygen atoms", "Eight hydrogen atoms"],
    "answer": "Four other carbon atoms"
  },
  {
    "id": "CHE398",
    "topic": "Carbon and Its Compounds",
    "question": "Carbon monoxide is formed during incomplete combustion of",
    "options": ["Hydrocarbons", "Water", "Sodium chloride", "Nitrogen"],
    "answer": "Hydrocarbons"
  },
  {
    "id": "CHE399",
    "topic": "Carbon and Its Compounds",
    "question": "Carbon dioxide turns limewater",
    "options": ["Blue", "Milky", "Red", "Black"],
    "answer": "Milky"
  },
  {
    "id": "CHE400",
    "topic": "Carbon and Its Compounds",
    "question": "The reaction between carbon dioxide and limewater produces",
    "options": ["Calcium carbonate and water", "Calcium chloride and hydrogen", "Calcium oxide and oxygen", "Sodium carbonate and water"],
    "answer": "Calcium carbonate and water"
  }

],


  "Mathematics": [
      {"id":"MTH001","topic":"Number Bases","question":"Convert 1101₂ to base 10.","options":["13","11","15","12"],"answer":"13"},
{"id":"MTH002","topic":"Algebra - Simultaneous Equations","question":"Solve for x and y: x + y = 7, x - y = 1.","options":["x=4, y=3","x=3, y=4","x=5, y=2","x=2, y=5"],"answer":"x=4, y=3"},
{"id":"MTH003","topic":"Mensuration","question":"Find the area of a circle with radius 7cm. (Take π = 22/7)","options":["154 cm²","144 cm²","132 cm²","176 cm²"],"answer":"154 cm²"},
{"id":"MTH004","topic":"Trigonometry","question":"Find the value of sin 30°.","options":["0.5","1","0.866","0"],"answer":"0.5"},
{"id":"MTH005","topic":"Indices","question":"Simplify 2³ × 2⁴.","options":["2⁷","2¹²","2¹","4⁷"],"answer":"2⁷"},
{"id":"MTH006","topic":"Statistics","question":"Find the mean of 4, 8, 6, 10, 12.","options":["8","9","10","7"],"answer":"8"},
{"id":"MTH007","topic":"Sets","question":"If A = {1,2,3,4} and B = {3,4,5,6}, find A ∩ B.","options":["{3,4}","{1,2}","{5,6}","{1,2,3,4,5,6}"],"answer":"{3,4}"},
{"id":"MTH008","topic":"Algebra - Quadratic Equations","question":"Solve x² - 5x + 6 = 0.","options":["x=2 or x=3","x=1 or x=6","x=-2 or x=-3","x=5 or x=6"],"answer":"x=2 or x=3"},
{"id":"MTH009","topic":"Geometry - Circle Theorems","question":"An angle in a semicircle is ____.","options":["90°","180°","45°","60°"],"answer":"90°"},
{"id":"MTH010","topic":"Logarithms","question":"Evaluate log₂ 8.","options":["3","2","4","8"],"answer":"3"},
{"id":"MTH011","topic":"Number Bases","question":"Convert 25 (base 10) to binary.","options":["11001","11010","10101","11100"],"answer":"11001"},
{"id":"MTH012","topic":"Mensuration","question":"Find the volume of a cube with side 4cm.","options":["64 cm³","16 cm³","48 cm³","32 cm³"],"answer":"64 cm³"},
{"id":"MTH013","topic":"Algebra - Simplification","question":"Simplify (3x + 2) - (x - 5).","options":["2x + 7","2x - 3","4x - 3","2x + 3"],"answer":"2x + 7"},
{"id":"MTH014","topic":"Probability","question":"A die is thrown once. Find the probability of getting a number greater than 4.","options":["1/3","1/2","1/6","2/3"],"answer":"1/3"},
{"id":"MTH015","topic":"Trigonometry","question":"If tan θ = 1, find θ (0° ≤ θ ≤ 90°).","options":["45°","30°","60°","90°"],"answer":"45°"},
{"id":"MTH016","topic":"Sets","question":"If n(A) = 15, n(B) = 20, n(A ∩ B) = 5, find n(A ∪ B).","options":["30","35","25","40"],"answer":"30"},
{"id":"MTH017","topic":"Algebra - Word Problems","question":"The sum of two numbers is 20 and their difference is 4. Find the larger number.","options":["12","10","14","16"],"answer":"12"},
{"id":"MTH018","topic":"Geometry - Polygons","question":"Find the sum of interior angles of a hexagon.","options":["720°","540°","900°","360°"],"answer":"720°"},
{"id":"MTH019","topic":"Indices","question":"Simplify (2⁵)² ÷ 2⁴.","options":["2⁶","2⁵","2⁴","2⁷"],"answer":"2⁶"},
{"id":"MTH020","topic":"Statistics","question":"Find the median of 3, 7, 9, 11, 15.","options":["9","7","11","10"],"answer":"9"},
{"id":"MTH021","topic":"Number Bases","question":"Add 101₂ and 011₂, express the answer in base 2.","options":["1000","1010","0110","1100"],"answer":"1000"},
{"id":"MTH022","topic":"Mensuration","question":"Find the perimeter of a rectangle with length 12cm and width 5cm.","options":["34 cm","60 cm","17 cm","24 cm"],"answer":"34 cm"},
{"id":"MTH023","topic":"Algebra - Inequalities","question":"Solve the inequality 2x - 3 > 7.","options":["x > 5","x > 2","x < 5","x < 2"],"answer":"x > 5"},
{"id":"MTH024","topic":"Trigonometry","question":"Find the value of cos 60°.","options":["0.5","0.866","1","0"],"answer":"0.5"},
{"id":"MTH025","topic":"Geometry - Triangles","question":"In a right-angled triangle, if the two legs are 3cm and 4cm, find the hypotenuse.","options":["5 cm","6 cm","7 cm","4.5 cm"],"answer":"5 cm"},
{"id":"MTH026","topic":"Logarithms","question":"If log x = 2, find x.","options":["100","10","20","1000"],"answer":"100"},
{"id":"MTH027","topic":"Sets","question":"How many subsets does a set with 3 elements have?","options":["8","6","3","9"],"answer":"8"},
{"id":"MTH028","topic":"Algebra - Factorization","question":"Factorize x² - 9.","options":["(x-3)(x+3)","(x-9)(x+1)","(x-3)²","(x+3)²"],"answer":"(x-3)(x+3)"},
{"id":"MTH029","topic":"Probability","question":"Two coins are tossed together. Find the probability of getting two heads.","options":["1/4","1/2","1/3","3/4"],"answer":"1/4"},
{"id":"MTH030","topic":"Mensuration","question":"Find the surface area of a sphere with radius 7cm. (Take π=22/7)","options":["616 cm²","1232 cm²","308 cm²","154 cm²"],"answer":"616 cm²"},
{"id":"MTH031","topic":"Number Bases","question":"Convert 7₈ (base 8) to base 10.","options":["7","8","15","56"],"answer":"7"},
{"id":"MTH032","topic":"Algebra - Simultaneous Equations","question":"Solve: 2x + y = 10, x - y = 2.","options":["x=4, y=2","x=3, y=4","x=5, y=0","x=6, y=-2"],"answer":"x=4, y=2"},
{"id":"MTH033","topic":"Statistics","question":"Find the mode of the data: 2, 3, 3, 5, 7, 3, 8.","options":["3","5","7","2"],"answer":"3"},
{"id":"MTH034","topic":"Trigonometry","question":"A ladder leans against a wall making an angle of 60° with the ground. If the foot of the ladder is 3m from the wall, find the length of the ladder (to 1 d.p).","options":["6.0 m","5.2 m","3.5 m","4.8 m"],"answer":"6.0 m"},
{"id":"MTH035","topic":"Geometry - Circle Theorems","question":"The angle subtended by an arc at the centre of a circle is twice the angle subtended at the ____.","options":["Circumference","Diameter","Radius","Chord"],"answer":"Circumference"},
{"id":"MTH036","topic":"Indices","question":"Simplify 3⁻² .","options":["1/9","-9","9","1/3"],"answer":"1/9"},
{"id":"MTH037","topic":"Algebra - Quadratic Equations","question":"Find the sum of the roots of x² - 7x + 12 = 0.","options":["7","12","-7","5"],"answer":"7"},
{"id":"MTH038","topic":"Sets","question":"If U = {1,2,3,4,5,6,7,8}, A = {2,4,6,8}, find A'.","options":["{1,3,5,7}","{2,4,6,8}","{1,2,3,4}","{5,6,7,8}"],"answer":"{1,3,5,7}"},
{"id":"MTH039","topic":"Mensuration","question":"Find the area of a trapezium with parallel sides 8cm and 12cm, and height 5cm.","options":["50 cm²","40 cm²","60 cm²","100 cm²"],"answer":"50 cm²"},
{"id":"MTH040","topic":"Number Bases","question":"Multiply 11₂ by 10₂, giving the answer in base 2.","options":["110","101","111","100"],"answer":"110"},
{"id":"MTH041","topic":"Algebra - Word Problems","question":"A number increased by 5 gives 23. Find the number.","options":["18","28","13","23"],"answer":"18"},
{"id":"MTH042","topic":"Probability","question":"A bag contains 4 red and 6 blue balls. Find the probability of picking a red ball.","options":["2/5","3/5","1/5","4/5"],"answer":"2/5"},
{"id":"MTH043","topic":"Trigonometry","question":"Find the value of tan 45°.","options":["1","0","0.5","√2"],"answer":"1"},
{"id":"MTH044","topic":"Geometry - Polygons","question":"Find each interior angle of a regular pentagon.","options":["108°","120°","90°","72°"],"answer":"108°"},
{"id":"MTH045","topic":"Logarithms","question":"Simplify log 100 + log 10.","options":["3","2","1","10"],"answer":"3"},
{"id":"MTH046","topic":"Statistics","question":"Find the range of: 12, 5, 9, 20, 3.","options":["17","15","20","12"],"answer":"17"},
{"id":"MTH047","topic":"Algebra - Simplification","question":"Simplify 2(3x - 4) + 3(x + 2).","options":["9x - 2","6x - 2","9x + 2","6x + 2"],"answer":"9x - 2"},
{"id":"MTH048","topic":"Mensuration","question":"Find the volume of a cylinder with radius 7cm and height 10cm. (Take π=22/7)","options":["1540 cm³","770 cm³","2200 cm³","1100 cm³"],"answer":"1540 cm³"},
{"id":"MTH049","topic":"Number Bases","question":"Convert 1010₂ to base 10.","options":["10","8","12","9"],"answer":"10"},
{"id":"MTH050","topic":"Sets","question":"If A and B are disjoint sets, then A ∩ B = ____.","options":["∅","A","B","A ∪ B"],"answer":"∅"},
{"id":"MTH051","topic":"Trigonometry","question":"The angle of elevation of the top of a tower from a point 50m away is 30°. Find the height of the tower (to 1 d.p).","options":["28.9 m","25.0 m","43.3 m","50.0 m"],"answer":"28.9 m"},
{"id":"MTH052","topic":"Algebra - Inequalities","question":"Solve -3x + 6 ≤ 0.","options":["x ≥ 2","x ≤ 2","x ≥ -2","x ≤ -2"],"answer":"x ≥ 2"},
{"id":"MTH053","topic":"Geometry - Triangles","question":"The sum of the angles in a triangle is ____.","options":["180°","360°","90°","270°"],"answer":"180°"},
{"id":"MTH054","topic":"Probability","question":"A card is drawn from a standard deck of 52 cards. Find the probability it is a king.","options":["1/13","1/4","1/52","4/13"],"answer":"1/13"},
{"id":"MTH055","topic":"Indices","question":"Solve for x: 2ˣ = 32.","options":["5","4","6","16"],"answer":"5"},
{"id":"MTH056","topic":"Mensuration","question":"Find the area of a triangle with base 10cm and height 6cm.","options":["30 cm²","60 cm²","16 cm²","20 cm²"],"answer":"30 cm²"},
{"id":"MTH057","topic":"Number Bases","question":"Subtract 101₂ from 111₂, giving the answer in base 2.","options":["10","11","100","01"],"answer":"10"},
{"id":"MTH058","topic":"Algebra - Quadratic Equations","question":"If one root of x² - kx + 8 = 0 is 2, find k.","options":["6","4","8","2"],"answer":"6"},
{"id":"MTH059","topic":"Statistics","question":"A class has scores 5, 6, 7, 8, 9 with frequencies 2, 3, 5, 4, 1. Find the total number of students.","options":["15","14","16","20"],"answer":"15"},
{"id":"MTH060","topic":"Sets","question":"If n(U) = 50, n(A) = 20, n(A') = ____.","options":["30","50","20","70"],"answer":"30"},
{"id":"MTH061","topic":"Trigonometry","question":"Find sin²30° + cos²30°.","options":["1","0.5","0","2"],"answer":"1"},
{"id":"MTH062","topic":"Geometry - Circle Theorems","question":"Angles in the same segment of a circle are ____.","options":["Equal","Supplementary","Complementary","Right angles"],"answer":"Equal"},
{"id":"MTH063","topic":"Logarithms","question":"If log₃ x = 2, find x.","options":["9","6","3","27"],"answer":"9"},
{"id":"MTH064","topic":"Algebra - Word Problems","question":"A father is 3 times as old as his son. If the son is 12, find the father's age.","options":["36","24","48","15"],"answer":"36"},
{"id":"MTH065","topic":"Mensuration","question":"Find the circumference of a circle of diameter 14cm. (Take π=22/7)","options":["44 cm","22 cm","88 cm","28 cm"],"answer":"44 cm"},
{"id":"MTH066","topic":"Number Bases","question":"Convert 34 (base 10) to base 5.","options":["114","113","124","104"],"answer":"114"},
{"id":"MTH067","topic":"Probability","question":"A number is selected at random from 1 to 10. Find the probability that it is even.","options":["1/2","2/5","3/5","1/5"],"answer":"1/2"},
{"id":"MTH068","topic":"Algebra - Simplification","question":"Simplify (x² - 4) / (x - 2).","options":["x + 2","x - 2","x² + 2","2x"],"answer":"x + 2"},
{"id":"MTH069","topic":"Geometry - Polygons","question":"How many sides does a polygon with interior angle sum of 1080° have?","options":["8","6","10","9"],"answer":"8"},
{"id":"MTH070","topic":"Statistics","question":"Find the variance is not required here; find the standard deviation concept: the mean of 2,4,6,8,10 is ____.","options":["6","5","8","4"],"answer":"6"},
{"id":"MTH071","topic":"Trigonometry","question":"A boat travels 10km due north then 24km due east. Find its distance from the starting point.","options":["26 km","34 km","20 km","30 km"],"answer":"26 km"},
{"id":"MTH072","topic":"Sets","question":"If A = {a,b,c} and B = {b,c,d}, find A ∪ B.","options":["{a,b,c,d}","{b,c}","{a,d}","{a,b,c}"],"answer":"{a,b,c,d}"},
{"id":"MTH073","topic":"Indices","question":"Evaluate 4^(1/2).","options":["2","4","8","16"],"answer":"2"},
{"id":"MTH074","topic":"Mensuration","question":"Find the volume of a cone with radius 3cm and height 7cm. (Take π=22/7)","options":["66 cm³","33 cm³","132 cm³","22 cm³"],"answer":"66 cm³"},
{"id":"MTH075","topic":"Algebra - Inequalities","question":"Find the solution set of 4x + 1 ≥ 9.","options":["x ≥ 2","x ≤ 2","x ≥ 8","x ≤ 8"],"answer":"x ≥ 2"},
{"id":"MTH076","topic":"Number Bases","question":"Convert 2A₁₆ (hexadecimal) to base 10.","options":["42","32","26","40"],"answer":"42"},
{"id":"MTH077","topic":"Geometry - Triangles","question":"Two angles of a triangle are 50° and 60°. Find the third angle.","options":["70°","80°","60°","90°"],"answer":"70°"},
{"id":"MTH078","topic":"Probability","question":"If P(A) = 0.3, find P(not A).","options":["0.7","0.3","0.5","1"],"answer":"0.7"},
{"id":"MTH079","topic":"Algebra - Quadratic Equations","question":"Find the product of roots of 2x² - 5x + 3 = 0.","options":["3/2","5/2","-3/2","2/3"],"answer":"3/2"},
{"id":"MTH080","topic":"Logarithms","question":"Simplify log₅ 125.","options":["3","5","25","2"],"answer":"3"},
{"id":"MTH081","topic":"Statistics","question":"Find the sum of the first five natural numbers used as data: 1,2,3,4,5. Find their mean.","options":["3","2.5","4","3.5"],"answer":"3"},
{"id":"MTH082","topic":"Mensuration","question":"A rectangular tank has length 5m, width 3m and height 2m. Find its volume.","options":["30 m³","20 m³","15 m³","10 m³"],"answer":"30 m³"},
{"id":"MTH083","topic":"Trigonometry","question":"Find the value of cos 90°.","options":["0","1","-1","0.5"],"answer":"0"},
{"id":"MTH084","topic":"Sets","question":"If n(A)=12, n(B)=18, and A and B are disjoint, find n(A∪B).","options":["30","24","36","6"],"answer":"30"},
{"id":"MTH085","topic":"Number Bases","question":"Which of these is the largest? 101₂, 12₅, 23₄","options":["12₅","101₂","23₄","They are equal"],"answer":"12₅"},
{"id":"MTH086","topic":"Algebra - Word Problems","question":"The perimeter of a rectangle is 30cm. If the length is twice the width, find the width.","options":["5 cm","10 cm","15 cm","7.5 cm"],"answer":"5 cm"},
{"id":"MTH087","topic":"Geometry - Circle Theorems","question":"A tangent to a circle makes an angle of 90° with the ____.","options":["Radius at point of contact","Chord","Diameter","Arc"],"answer":"Radius at point of contact"},
{"id":"MTH088","topic":"Probability","question":"A bag has 3 white and 5 black balls. Two balls are drawn without replacement. Find the probability both are white.","options":["3/28","3/8","5/28","1/8"],"answer":"3/28"},
{"id":"MTH089","topic":"Indices","question":"Simplify (a³b²)² .","options":["a⁶b⁴","a⁵b⁴","a⁶b²","a⁹b⁴"],"answer":"a⁶b⁴"},
{"id":"MTH090","topic":"Mensuration","question":"Find the area of a parallelogram with base 9cm and height 4cm.","options":["36 cm²","18 cm²","13 cm²","26 cm²"],"answer":"36 cm²"},
{"id":"MTH091","topic":"Algebra - Simultaneous Equations","question":"Solve: 3x - 2y = 4, x + y = 3.","options":["x=2, y=1","x=1, y=2","x=3, y=0","x=0, y=3"],"answer":"x=2, y=1"},
{"id":"MTH092","topic":"Trigonometry","question":"Find sec 60°.","options":["2","1","0.5","√3"],"answer":"2"},
{"id":"MTH093","topic":"Statistics","question":"The scores 4,5,6,7,8 have a standard deviation. Which value is closest to the mean?","options":["6","4","8","5"],"answer":"6"},
{"id":"MTH094","topic":"Number Bases","question":"Convert 45 (base 10) to binary.","options":["101101","101100","110101","100101"],"answer":"101101"},
{"id":"MTH095","topic":"Sets","question":"In a class of 40 students, 25 like Maths, 20 like English, 10 like both. How many like neither?","options":["5","10","15","20"],"answer":"5"},
{"id":"MTH096","topic":"Algebra - Factorization","question":"Factorize 2x² + 5x + 3.","options":["(2x+3)(x+1)","(2x+1)(x+3)","(x+3)(x+1)","(2x-3)(x-1)"],"answer":"(2x+3)(x+1)"},
{"id":"MTH097","topic":"Geometry - Polygons","question":"Find the number of diagonals in a hexagon.","options":["9","6","12","15"],"answer":"9"},
{"id":"MTH098","topic":"Probability","question":"Two dice are rolled. Find the probability that the sum is 7.","options":["1/6","1/12","1/36","5/36"],"answer":"1/6"},
{"id":"MTH099","topic":"Logarithms","question":"If log 2 = 0.301, find log 4.","options":["0.602","0.301","0.903","1.204"],"answer":"0.602"},
{"id":"MTH100","topic":"Mensuration","question":"Find the total surface area of a cube of side 5cm.","options":["150 cm²","125 cm²","100 cm²","75 cm²"],"answer":"150 cm²"},
{"id":"MTH101","topic":"Trigonometry","question":"Find the value of cosec 30°.","options":["2","1","0.5","√2"],"answer":"2"},
{"id":"MTH102","topic":"Algebra - Quadratic Equations","question":"Solve x² - 4 = 0.","options":["x = ±2","x = ±4","x = 2","x = -2"],"answer":"x = ±2"},
{"id":"MTH103","topic":"Number Bases","question":"Evaluate 10₂ + 10₂ + 10₂ in base 10.","options":["6","4","8","3"],"answer":"6"},
{"id":"MTH104","topic":"Sets","question":"If ξ = {1,2,3,...,10}, A={1,2,3,4,5}, find n(A').","options":["5","10","4","6"],"answer":"5"},
{"id":"MTH105","topic":"Statistics","question":"A pie chart shows 90° representing 30 students. How many students does 180° represent?","options":["60","45","90","120"],"answer":"60"},
{"id":"MTH106","topic":"Mensuration","question":"Find the length of an arc subtending 60° at the centre of a circle of radius 21cm. (Take π=22/7)","options":["22 cm","44 cm","11 cm","33 cm"],"answer":"22 cm"},
{"id":"MTH107","topic":"Algebra - Word Problems","question":"A shopkeeper sells an item for ₦2,400 making a profit of 20%. Find the cost price.","options":["₦2,000","₦1,920","₦2,200","₦2,880"],"answer":"₦2,000"},
{"id":"MTH108","topic":"Geometry - Triangles","question":"In an isosceles triangle, two angles are equal. If the base angles are 65° each, find the third angle.","options":["50°","55°","60°","45°"],"answer":"50°"},
{"id":"MTH109","topic":"Probability","question":"A letter is chosen at random from the word 'MATHEMATICS'. Find the probability it is 'A'.","options":["2/11","1/11","3/11","4/11"],"answer":"2/11"},
{"id":"MTH110","topic":"Indices","question":"Simplify 5⁰.","options":["1","0","5","undefined"],"answer":"1"},
{"id":"MTH111","topic":"Number Bases","question":"Convert 111₂ to base 10.","options":["7","5","6","8"],"answer":"7"},
{"id":"MTH112","topic":"Trigonometry","question":"Find the height of a tree if its shadow is 12m long and the angle of elevation of the sun is 45°.","options":["12 m","6 m","24 m","8.5 m"],"answer":"12 m"},
{"id":"MTH113","topic":"Mensuration","question":"Find the area of a square with diagonal 10cm.","options":["50 cm²","100 cm²","25 cm²","70 cm²"],"answer":"50 cm²"},
{"id":"MTH114","topic":"Algebra - Simplification","question":"Simplify (2x + 3)(x - 1).","options":["2x² + x - 3","2x² - x - 3","2x² + 5x - 3","x² + x - 3"],"answer":"2x² + x - 3"},
{"id":"MTH115","topic":"Sets","question":"Which of the following is a null set?","options":["The set of even numbers between 2 and 4","The set of even numbers less than 10","The set of vowels","The set of prime numbers"],"answer":"The set of even numbers between 2 and 4"},
{"id":"MTH116","topic":"Logarithms","question":"Evaluate log 1.","options":["0","1","10","undefined"],"answer":"0"},
{"id":"MTH117","topic":"Statistics","question":"The scores of 5 students are 60, 70, 80, 90, 100. Find the mean deviation from the mean is complex; instead find the mean.","options":["80","75","85","70"],"answer":"80"},
{"id":"MTH118","topic":"Number Bases","question":"Convert 3₅ + 4₅ to base 5.","options":["12","11","13","10"],"answer":"12"},
{"id":"MTH119","topic":"Geometry - Circle Theorems","question":"A cyclic quadrilateral has opposite angles that are ____.","options":["Supplementary","Complementary","Equal","Right angles"],"answer":"Supplementary"},
{"id":"MTH120","topic":"Probability","question":"A committee of 3 is to be chosen from 5 men and 4 women. Find the number of ways if all must be men.","options":["10","20","15","5"],"answer":"10"},
{"id":"MTH121","topic":"Algebra - Inequalities","question":"Solve 5 - 2x < 1.","options":["x > 2","x < 2","x > -2","x < -2"],"answer":"x > 2"},
{"id":"MTH122","topic":"Trigonometry","question":"Find the value of sin 90° + cos 0°.","options":["2","1","0","0.5"],"answer":"2"},
{"id":"MTH123","topic":"Mensuration","question":"A cylindrical pipe has internal radius 3.5cm and length 20cm. Find its volume. (Take π=22/7)","options":["770 cm³","1540 cm³","385 cm³","550 cm³"],"answer":"770 cm³"},
{"id":"MTH124","topic":"Number Bases","question":"Convert 1000₂ to base 10.","options":["8","4","10","16"],"answer":"8"},
{"id":"MTH125","topic":"Sets","question":"If A ⊂ B, and n(A) = 5, n(B) = 12, find n(A ∩ B).","options":["5","12","7","17"],"answer":"5"},
{"id":"MTH126","topic":"Algebra - Word Problems","question":"Three consecutive integers add up to 51. Find the smallest.","options":["16","17","15","18"],"answer":"16"},
{"id":"MTH127","topic":"Geometry - Polygons","question":"Find the exterior angle of a regular octagon.","options":["45°","30°","60°","36°"],"answer":"45°"},
{"id":"MTH128","topic":"Indices","question":"Solve 3^(x+1) = 27.","options":["2","3","4","1"],"answer":"2"},
{"id":"MTH129","topic":"Statistics","question":"Find the interquartile range concept - find Q2 (median) of 2,4,6,8,10,12,14.","options":["8","6","10","7"],"answer":"8"},
{"id":"MTH130","topic":"Trigonometry","question":"The angle of depression from a cliff top to a boat is 30°. If the cliff is 60m high, find the distance of the boat from the base of the cliff.","options":["103.9 m","60 m","30 m","120 m"],"answer":"103.9 m"},
{"id":"MTH131","topic":"Probability","question":"A fair coin is tossed 3 times. Find the probability of getting exactly 2 heads.","options":["3/8","1/8","1/2","1/4"],"answer":"3/8"},
{"id":"MTH132","topic":"Number Bases","question":"Which base system uses digits 0-7 only?","options":["Octal","Binary","Decimal","Hexadecimal"],"answer":"Octal"},
{"id":"MTH133","topic":"Mensuration","question":"Find the area of a sector with radius 14cm and angle 90°. (Take π=22/7)","options":["154 cm²","308 cm²","77 cm²","616 cm²"],"answer":"154 cm²"},
{"id":"MTH134","topic":"Algebra - Quadratic Equations","question":"Use the quadratic formula to solve x² + 2x - 3 = 0.","options":["x = 1 or x = -3","x = -1 or x = 3","x = 3 or x = -1","x = 1 or x = 3"],"answer":"x = 1 or x = -3"},
{"id":"MTH135","topic":"Sets","question":"Two sets are equal if they have the ____.","options":["Same elements","Same number of elements only","Different elements","Same order"],"answer":"Same elements"},
{"id":"MTH136","topic":"Logarithms","question":"Simplify log 20 - log 2.","options":["log 10","log 18","log 22","log 40"],"answer":"log 10"},
{"id":"MTH137","topic":"Geometry - Triangles","question":"Find the area of an equilateral triangle with side 6cm (to 1 d.p).","options":["15.6 cm²","18.0 cm²","12.0 cm²","20.0 cm²"],"answer":"15.6 cm²"},
{"id":"MTH138","topic":"Number Bases","question":"Convert 20 (base 10) to base 3.","options":["202","210","220","201"],"answer":"202"},
{"id":"MTH139","topic":"Trigonometry","question":"Find the value of 2 sin 45° cos 45°.","options":["1","0.5","2","0"],"answer":"1"},
{"id":"MTH140","topic":"Statistics","question":"A frequency table shows scores 1,2,3 with frequencies 4,5,1. Find the total frequency.","options":["10","9","8","11"],"answer":"10"},
{"id":"MTH141","topic":"Algebra - Simplification","question":"Simplify 3/x + 2/x.","options":["5/x","6/x","5/2x","1/x"],"answer":"5/x"},
{"id":"MTH142","topic":"Mensuration","question":"Find the volume of a rectangular prism with dimensions 4cm, 5cm, 6cm.","options":["120 cm³","60 cm³","100 cm³","90 cm³"],"answer":"120 cm³"},
{"id":"MTH143","topic":"Probability","question":"A number is chosen from 1-20. Find the probability it is a multiple of 5.","options":["1/5","1/4","1/10","1/2"],"answer":"1/5"},
{"id":"MTH144","topic":"Sets","question":"If A = {x : x is a prime number less than 10}, list A.","options":["{2,3,5,7}","{1,3,5,7}","{2,4,6,8}","{3,5,7,9}"],"answer":"{2,3,5,7}"},
{"id":"MTH145","topic":"Number Bases","question":"Divide 110₂ by 10₂, giving the answer in base 2.","options":["11","10","01","100"],"answer":"11"},
{"id":"MTH146","topic":"Trigonometry","question":"Find the value of tan 60°.","options":["√3","1","0.5","2"],"answer":"√3"},
{"id":"MTH147","topic":"Geometry - Circle Theorems","question":"The perpendicular from the centre of a circle to a chord ____ the chord.","options":["Bisects","Extends","Doubles","Divides unevenly"],"answer":"Bisects"},
{"id":"MTH148","topic":"Algebra - Word Problems","question":"A man's age is 4 times his son's age. In 20 years, he will be twice as old as his son. Find the son's current age.","options":["10","15","20","5"],"answer":"10"},
{"id":"MTH149","topic":"Indices","question":"Simplify (x⁻²)⁻³.","options":["x⁶","x⁻⁶","x⁵","x⁻¹"],"answer":"x⁶"},
{"id":"MTH150","topic":"Mensuration","question":"A wire is bent into a circle of radius 7cm. Find its length (circumference). (Take π=22/7)","options":["44 cm","22 cm","154 cm","28 cm"],"answer":"44 cm"},
{"id":"MTH151","topic":"Statistics","question":"Find the mean of the first 6 even numbers.","options":["7","6","8","5"],"answer":"7"},
{"id":"MTH152","topic":"Number Bases","question":"Convert 1F₁₆ (hexadecimal) to base 10.","options":["31","30","29","32"],"answer":"31"},
{"id":"MTH153","topic":"Probability","question":"From a pack of 52 cards, find the probability of drawing a red card.","options":["1/2","1/4","1/13","1/26"],"answer":"1/2"},
{"id":"MTH154","topic":"Sets","question":"If n(A ∪ B) = 30, n(A) = 18, n(B) = 20, find n(A ∩ B).","options":["8","10","12","22"],"answer":"8"},
{"id":"MTH155","topic":"Algebra - Factorization","question":"Factorize x² + 6x + 9.","options":["(x+3)²","(x+3)(x-3)","(x+9)(x+1)","(x-3)²"],"answer":"(x+3)²"},
{"id":"MTH156","topic":"Trigonometry","question":"A tree casts a 15m shadow when the sun's angle of elevation is 30°. Find the height of the tree (to 1 d.p).","options":["8.7 m","15.0 m","7.5 m","26.0 m"],"answer":"8.7 m"},
{"id":"MTH157","topic":"Geometry - Polygons","question":"How many sides has a regular polygon with each exterior angle equal to 40°?","options":["9","8","10","7"],"answer":"9"},
{"id":"MTH158","topic":"Mensuration","question":"Find the total surface area of a cylinder with radius 7cm and height 10cm (excluding top and bottom is not needed; include both). (Take π=22/7)","options":["748 cm²","440 cm²","1540 cm²","308 cm²"],"answer":"748 cm²"},
{"id":"MTH159","topic":"Logarithms","question":"If log₁₀ 2 = 0.301, find log₁₀ 200.","options":["2.301","1.301","0.602","3.01"],"answer":"2.301"},
{"id":"MTH160","topic":"Number Bases","question":"Which of the following represents an invalid base-5 numeral?","options":["253","134","201","420"],"answer":"253"},
{"id":"MTH161","topic":"Algebra - Simultaneous Equations","question":"Solve: y = 2x + 1, y = x + 4.","options":["x=3, y=7","x=2, y=6","x=1, y=5","x=4, y=8"],"answer":"x=3, y=7"},
{"id":"MTH162","topic":"Statistics","question":"A pie chart sector representing 'football' is 120°. What percentage of the total does this represent?","options":["33.3%","25%","40%","50%"],"answer":"33.3%"},
{"id":"MTH163","topic":"Trigonometry","question":"Find cos 45° × 2.","options":["√2","1","2","0.5"],"answer":"√2"},
{"id":"MTH164","topic":"Sets","question":"The set of all subsets of a set is called its ____.","options":["Power set","Universal set","Complement","Subset family"],"answer":"Power set"},
{"id":"MTH165","topic":"Mensuration","question":"Find the area of a semicircle with radius 14cm. (Take π=22/7)","options":["308 cm²","616 cm²","154 cm²","440 cm²"],"answer":"308 cm²"},
{"id":"MTH166","topic":"Probability","question":"A box contains 2 red, 3 green, and 5 yellow balls. Find the probability of picking a green ball.","options":["3/10","2/10","5/10","1/10"],"answer":"3/10"},
{"id":"MTH167","topic":"Number Bases","question":"Add 23₅ and 14₅, giving the answer in base 5.","options":["42","40","41","43"],"answer":"42"},
{"id":"MTH168","topic":"Algebra - Inequalities","question":"Find the solution of 3(x-1) ≥ x + 5.","options":["x ≥ 4","x ≤ 4","x ≥ 2","x ≤ 2"],"answer":"x ≥ 4"},
{"id":"MTH169","topic":"Geometry - Triangles","question":"A triangle with all sides of different lengths is called ____.","options":["Scalene","Isosceles","Equilateral","Right-angled"],"answer":"Scalene"},
{"id":"MTH170","topic":"Indices","question":"Simplify 16^(3/4).","options":["8","4","16","64"],"answer":"8"},
{"id":"MTH171","topic":"Mensuration","question":"Find the volume of a hemisphere with radius 6cm. (Take π=22/7, to nearest whole number)","options":["452 cm³","904 cm³","226 cm³","339 cm³"],"answer":"452 cm³"},
{"id":"MTH172","topic":"Statistics","question":"Find the mean of a distribution: 10 (freq 2), 20 (freq 3), 30 (freq 5).","options":["23","20","25","22"],"answer":"23"},
{"id":"MTH173","topic":"Number Bases","question":"Convert 100₂ to base 10.","options":["4","2","3","8"],"answer":"4"},
{"id":"MTH174","topic":"Trigonometry","question":"Find sin 0° + cos 0°.","options":["1","0","2","0.5"],"answer":"1"},
{"id":"MTH175","topic":"Sets","question":"If A = {2,4,6} and B = {1,3,5}, find A ∩ B.","options":["∅","{1,2,3,4,5,6}","A","B"],"answer":"∅"},
{"id":"MTH176","topic":"Algebra - Word Problems","question":"A number is such that twice the number minus 3 equals 15. Find the number.","options":["9","6","12","18"],"answer":"9"},
{"id":"MTH177","topic":"Geometry - Circle Theorems","question":"Two tangents drawn from an external point to a circle are ____ in length.","options":["Equal","Unequal","Perpendicular","Parallel"],"answer":"Equal"},
{"id":"MTH178","topic":"Mensuration","question":"Find the length of the diagonal of a rectangle with length 8cm and width 6cm.","options":["10 cm","14 cm","12 cm","7 cm"],"answer":"10 cm"},
{"id":"MTH179","topic":"Probability","question":"A spinner has 8 equal sections numbered 1-8. Find the probability of landing on a number less than 4.","options":["3/8","1/2","1/4","5/8"],"answer":"3/8"},
{"id":"MTH180","topic":"Number Bases","question":"Convert 12₃ (base 3) to base 10.","options":["5","4","6","3"],"answer":"5"},
{"id":"MTH181","topic":"Logarithms","question":"Simplify log₄ 16.","options":["2","4","8","1"],"answer":"2"},
{"id":"MTH182","topic":"Algebra - Quadratic Equations","question":"Find the discriminant of x² + 4x + 4 = 0.","options":["0","16","-16","4"],"answer":"0"},
{"id":"MTH183","topic":"Trigonometry","question":"A man walks 8km east then 6km north. Find his bearing from the starting point (to nearest degree).","options":["N53°E","N37°E","N45°E","N60°E"],"answer":"N53°E"},
{"id":"MTH184","topic":"Statistics","question":"Which measure of central tendency is most affected by extreme values?","options":["Mean","Median","Mode","Range"],"answer":"Mean"},
{"id":"MTH185","topic":"Sets","question":"If A is a subset of B, then A ∪ B = ____.","options":["B","A","∅","A ∩ B"],"answer":"B"},
{"id":"MTH186","topic":"Mensuration","question":"Find the area of a rhombus with diagonals 10cm and 8cm.","options":["40 cm²","80 cm²","18 cm²","20 cm²"],"answer":"40 cm²"},
{"id":"MTH187","topic":"Number Bases","question":"Which number system is used in computer processing at the lowest level?","options":["Binary","Decimal","Octal","Hexadecimal"],"answer":"Binary"},
{"id":"MTH188","topic":"Algebra - Simplification","question":"Simplify (a+b)² - (a-b)².","options":["4ab","2ab","a²+b²","2a²+2b²"],"answer":"4ab"},
{"id":"MTH189","topic":"Geometry - Polygons","question":"A polygon with all sides and angles equal is called ____.","options":["Regular polygon","Irregular polygon","Convex polygon","Concave polygon"],"answer":"Regular polygon"},
{"id":"MTH190","topic":"Probability","question":"A committee of 2 is chosen from 4 people. How many ways can this be done?","options":["6","8","4","12"],"answer":"6"},
{"id":"MTH191","topic":"Trigonometry","question":"Find the value of cot 45°.","options":["1","0","√3","0.5"],"answer":"1"},
{"id":"MTH192","topic":"Mensuration","question":"Find the area of a circle with diameter 10cm. (Take π=3.14)","options":["78.5 cm²","31.4 cm²","157 cm²","62.8 cm²"],"answer":"78.5 cm²"},
{"id":"MTH193","topic":"Number Bases","question":"Convert 63 (base 10) to base 8.","options":["77","76","67","78"],"answer":"77"},
{"id":"MTH194","topic":"Statistics","question":"A data set has values 5,5,5,5,5. Find the standard deviation.","options":["0","5","1","25"],"answer":"0"},
{"id":"MTH195","topic":"Sets","question":"Which symbol represents 'is an element of'?","options":["∈","⊂","∪","∩"],"answer":"∈"},
{"id":"MTH196","topic":"Algebra - Word Problems","question":"A rectangle's length is 3 more than its width. If the perimeter is 26cm, find the width.","options":["5 cm","8 cm","6 cm","4 cm"],"answer":"5 cm"},
{"id":"MTH197","topic":"Logarithms","question":"Solve log x + log 2 = log 10.","options":["5","10","20","2"],"answer":"5"},
{"id":"MTH198","topic":"Mensuration","question":"Find the volume of a pyramid with base area 24cm² and height 9cm.","options":["72 cm³","216 cm³","108 cm³","36 cm³"],"answer":"72 cm³"},
{"id":"MTH199","topic":"Trigonometry","question":"Find the value of sin 180°.","options":["0","1","-1","0.5"],"answer":"0"},
{"id":"MTH200","topic":"Probability","question":"A bag contains 5 identical balls numbered 1-5. One is drawn at random. Find the probability it is odd.","options":["3/5","2/5","1/5","4/5"],"answer":"3/5"},

  {
    "id": "MTH201",
    "topic": "Sequence and Series",
    "question": "The first term of an arithmetic progression is 5 and the common difference is 3. Find the 12th term.",
    "options": ["35", "38", "41", "44"],
    "answer": "B"
  },
  {
    "id": "MTH202",
    "topic": "Sequence and Series",
    "question": "Find the sum of the first 15 terms of the arithmetic progression 2, 5, 8, 11, ...",
    "options": ["330", "345", "360", "375"],
    "answer": "B"
  },
  {
    "id": "MTH203",
    "topic": "Sequence and Series",
    "question": "Find the 8th term of the geometric progression 3, 6, 12, 24, ...",
    "options": ["192", "256", "384", "512"],
    "answer": "C"
  },
  {
    "id": "MTH204",
    "topic": "Sequence and Series",
    "question": "Find the sum of the first six terms of the geometric progression 2, 4, 8, 16, ...",
    "options": ["62", "64", "126", "128"],
    "answer": "C"
  },
  {
    "id": "MTH205",
    "topic": "Sequence and Series",
    "question": "The nth term of a sequence is given by Tn = 4n - 1. Find the 20th term.",
    "options": ["75", "77", "79", "81"],
    "answer": "C"
  },
  {
    "id": "MTH206",
    "topic": "Sequence and Series",
    "question": "Three consecutive terms of an arithmetic progression are 2x - 1, x + 2 and 3x - 7. Find x.",
    "options": ["2", "3", "4", "5"],
    "answer": "C"
  },
  {
    "id": "MTH207",
    "topic": "Sequence and Series",
    "question": "The 5th term of an arithmetic progression is 18 and the 11th term is 42. Find the common difference.",
    "options": ["3", "4", "5", "6"],
    "answer": "B"
  },
  {
    "id": "MTH208",
    "topic": "Sequence and Series",
    "question": "Find the sum of the first 20 terms of the arithmetic progression 7, 9, 11, 13, ...",
    "options": ["500", "510", "520", "530"],
    "answer": "C"
  },
  {
    "id": "MTH209",
    "topic": "Sequence and Series",
    "question": "Find the sum to infinity of the geometric progression 81 + 27 + 9 + 3 + ...",
    "options": ["108", "120", "243/2", "162"],
    "answer": "C"
  },
  {
    "id": "MTH210",
    "topic": "Sequence and Series",
    "question": "The sequence 1, 4, 9, 16, 25, ... has nth term",
    "options": ["n + 3", "2n + 1", "n²", "n² + 1"],
    "answer": "C"
  },

  {
    "id": "MTH211",
    "topic": "Binary Operations",
    "question": "A binary operation * is defined by a * b = a + b + ab. Find 2 * 3.",
    "options": ["6", "9", "11", "12"],
    "answer": "C"
  },
  {
    "id": "MTH212",
    "topic": "Binary Operations",
    "question": "If a * b = 2a - b, find 4 * 3.",
    "options": ["3", "5", "7", "11"],
    "answer": "B"
  },
  {
    "id": "MTH213",
    "topic": "Binary Operations",
    "question": "If a * b = a² + b, find 3 * 4.",
    "options": ["9", "12", "13", "16"],
    "answer": "C"
  },
  {
    "id": "MTH214",
    "topic": "Binary Operations",
    "question": "A binary operation is defined by a * b = (a + b)/2. Find 6 * 2.",
    "options": ["2", "3", "4", "6"],
    "answer": "C"
  },
  {
    "id": "MTH215",
    "topic": "Binary Operations",
    "question": "If a * b = a + b - 5, the identity element is",
    "options": ["0", "2", "5", "10"],
    "answer": "C"
  },
  {
    "id": "MTH216",
    "topic": "Binary Operations",
    "question": "If a * b = a + b - 2, find the inverse of 5 under *.",
    "options": ["-3", "-2", "2", "3"],
    "answer": "A"
  },
  {
    "id": "MTH217",
    "topic": "Binary Operations",
    "question": "If x * y = xy - x - y, find 4 * 3.",
    "options": ["3", "5", "7", "9"],
    "answer": "B"
  },
  {
    "id": "MTH218",
    "topic": "Binary Operations",
    "question": "A binary operation is defined by x * y = x + 2y. Find 3 * 4.",
    "options": ["7", "9", "11", "14"],
    "answer": "C"
  },
  {
    "id": "MTH219",
    "topic": "Binary Operations",
    "question": "If a * b = a - b + 4, find 7 * 3.",
    "options": ["6", "8", "10", "14"],
    "answer": "B"
  },
  {
    "id": "MTH220",
    "topic": "Binary Operations",
    "question": "If x * y = x² - y, find 5 * 4.",
    "options": ["19", "21", "25", "29"],
    "answer": "A"
  },

  {
    "id": "MTH221",
    "topic": "Calculus",
    "question": "Differentiate y = x³ - 5x² + 4x with respect to x.",
    "options": ["3x² - 10x + 4", "3x² - 5x + 4", "x² - 10x + 4", "3x³ - 10x² + 4"],
    "answer": "A"
  },
  {
    "id": "MTH222",
    "topic": "Calculus",
    "question": "If y = 2x³ - 3x² + 4, find dy/dx when x = 2.",
    "options": ["8", "10", "12", "14"],
    "answer": "C"
  },
  {
    "id": "MTH223",
    "topic": "Calculus",
    "question": "Find the integral of 6x² - 4x + 1 with respect to x.",
    "options": ["2x³ - 2x² + x + C", "6x³ - 4x² + x + C", "2x³ - 4x² + x + C", "3x² - 2x + 1 + C"],
    "answer": "A"
  },
  {
    "id": "MTH224",
    "topic": "Calculus",
    "question": "At what value of x is the gradient of y = x² - 6x + 8 equal to zero?",
    "options": ["2", "3", "4", "6"],
    "answer": "B"
  },
  {
    "id": "MTH225",
    "topic": "Calculus",
    "question": "Find the stationary point of y = x² - 6x + 8.",
    "options": ["(2, 0)", "(3, -1)", "(3, -4)", "(6, 8)"],
    "answer": "B"
  },
  {
    "id": "MTH226",
    "topic": "Calculus",
    "question": "Evaluate the integral ∫₀³(2x + 1)dx.",
    "options": ["9", "10", "12", "15"],
    "answer": "C"
  },
  {
    "id": "MTH227",
    "topic": "Calculus",
    "question": "Differentiate y = √x with respect to x.",
    "options": ["√x/2", "1/(2√x)", "2√x", "1/√x"],
    "answer": "B"
  },
  {
    "id": "MTH228",
    "topic": "Calculus",
    "question": "If y = x⁴ - 2x², find d²y/dx².",
    "options": ["4x² - 4", "8x² - 4", "12x² - 4", "12x² - 2"],
    "answer": "C"
  },
  {
    "id": "MTH229",
    "topic": "Calculus",
    "question": "The displacement of a particle is s = t³ - 3t² + 2t. Find its velocity when t = 1.",
    "options": ["-2", "-1", "0", "1"],
    "answer": "B"
  },
  {
    "id": "MTH230",
    "topic": "Calculus",
    "question": "Find the area under the curve y = x between x = 1 and x = 3.",
    "options": ["2", "3", "4", "6"],
    "answer": "C"
  },

  {
    "id": "MTH231",
    "topic": "Matrices and Determinants",
    "question": "Find the determinant of the matrix [[3, 2], [1, 4]].",
    "options": ["8", "10", "12", "14"],
    "answer": "B"
  },
  {
    "id": "MTH232",
    "topic": "Matrices and Determinants",
    "question": "Find the determinant of the matrix [[5, 1], [2, 3]].",
    "options": ["11", "12", "13", "15"],
    "answer": "C"
  },
  {
    "id": "MTH233",
    "topic": "Matrices and Determinants",
    "question": "If A = [[2, 3], [1, 4]], find 2A.",
    "options": ["[[4, 6], [2, 8]]", "[[2, 6], [1, 8]]", "[[4, 3], [2, 4]]", "[[2, 3], [2, 8]]"],
    "answer": "A"
  },
  {
    "id": "MTH234",
    "topic": "Matrices and Determinants",
    "question": "If A = [[1, 2], [3, 4]] and B = [[2, 1], [1, 2]], find A + B.",
    "options": ["[[3, 3], [4, 6]]", "[[2, 4], [4, 6]]", "[[3, 2], [4, 5]]", "[[1, 3], [3, 6]]"],
    "answer": "A"
  },
  {
    "id": "MTH235",
    "topic": "Matrices and Determinants",
    "question": "Find the trace of the matrix [[2, 5], [3, 7]].",
    "options": ["5", "7", "9", "12"],
    "answer": "C"
  },
  {
    "id": "MTH236",
    "topic": "Matrices and Determinants",
    "question": "Find the determinant of the matrix [[4, 0], [0, 6]].",
    "options": ["10", "18", "24", "30"],
    "answer": "C"
  },
  {
    "id": "MTH237",
    "topic": "Matrices and Determinants",
    "question": "Which of the following is the identity matrix of order 2?",
    "options": ["[[0, 1], [1, 0]]", "[[1, 1], [1, 1]]", "[[1, 0], [0, 1]]", "[[0, 0], [0, 0]]"],
    "answer": "C"
  },
  {
    "id": "MTH238",
    "topic": "Matrices and Determinants",
    "question": "If A = [[2, 1], [1, 3]], find A².",
    "options": ["[[5, 5], [5, 10]]", "[[5, 5], [5, 9]]", "[[4, 1], [1, 9]]", "[[5, 3], [3, 10]]"],
    "answer": "A"
  },
  {
    "id": "MTH239",
    "topic": "Matrices and Determinants",
    "question": "A square matrix whose determinant is zero is called",
    "options": ["Identity matrix", "Singular matrix", "Unit matrix", "Scalar matrix"],
    "answer": "B"
  },
  {
    "id": "MTH240",
    "topic": "Matrices and Determinants",
    "question": "Find the inverse of the matrix [[2, 0], [0, 4]].",
    "options": ["[[1/2, 0], [0, 1/4]]", "[[2, 0], [0, 4]]", "[[4, 0], [0, 2]]", "[[1/4, 0], [0, 1/2]]"],
    "answer": "A"
  },

  {
    "id": "MTH241",
    "topic": "Sequence and Series",
    "question": "The first term of an arithmetic progression is 8 and its common difference is 5. Find the 9th term.",
    "options": ["43", "48", "53", "58"],
    "answer": "C"
  },
  {
    "id": "MTH242",
    "topic": "Sequence and Series",
    "question": "Find the sum of the first 10 terms of the arithmetic progression 4, 7, 10, 13, ...",
    "options": ["155", "165", "175", "185"],
    "answer": "C"
  },

  {
    "id": "MTH243",
    "topic": "Binary Operations",
    "question": "If a * b = 3a + b, find 2 * 5.",
    "options": ["7", "9", "11", "15"],
    "answer": "C"
  },
  {
    "id": "MTH244",
    "topic": "Binary Operations",
    "question": "If x * y = x + y - xy, find 2 * 3.",
    "options": ["-1", "0", "1", "2"],
    "answer": "A"
  },

  {
    "id": "MTH245",
    "topic": "Calculus",
    "question": "Differentiate y = 5x² - 4x + 7.",
    "options": ["5x - 4", "10x - 4", "10x + 7", "5x² - 4"],
    "answer": "B"
  },
  {
    "id": "MTH246",
    "topic": "Calculus",
    "question": "Evaluate ∫₀² x² dx.",
    "options": ["2", "8/3", "3", "4"],
    "answer": "B"
  },

  {
    "id": "MTH247",
    "topic": "Matrices and Determinants",
    "question": "If A = [[2, 1], [3, 2]], find det(A).",
    "options": ["1", "2", "3", "4"],
    "answer": "A"
  },
  {
    "id": "MTH248",
    "topic": "Matrices and Determinants",
    "question": "If A = [[1, 2], [3, 4]], what is the sum of the elements on the main diagonal?",
    "options": ["3", "4", "5", "10"],
    "answer": "C"
  },
  {
    "id": "MTH249",
    "topic": "Matrices and Determinants",
    "question": "Solve the simultaneous equations x + y = 7 and x - y = 3.",
    "options": ["x = 4, y = 3", "x = 5, y = 2", "x = 6, y = 1", "x = 3, y = 4"],
    "answer": "B"
  },
  {
    "id": "MTH250",
    "topic": "Matrices and Determinants",
    "question": "If the determinant of [[x, 2], [3, 4]] is 10, find x.",
    "options": ["2", "3", "4", "5"],
    "answer": "C"
  },

  {
    "id": "MTH251",
    "topic": "Euclidean Geometry",
    "question": "The sum of the angles of a triangle is",
    "options": ["90°", "180°", "270°", "360°"],
    "answer": "B"
  },
  {
    "id": "MTH252",
    "topic": "Euclidean Geometry",
    "question": "Two angles of a triangle are 45° and 65°. Find the third angle.",
    "options": ["60°", "70°", "80°", "90°"],
    "answer": "B"
  },
  {
    "id": "MTH253",
    "topic": "Euclidean Geometry",
    "question": "An exterior angle of a triangle is 120°. If one of the opposite interior angles is 50°, find the other.",
    "options": ["60°", "70°", "80°", "90°"],
    "answer": "B"
  },
  {
    "id": "MTH254",
    "topic": "Euclidean Geometry",
    "question": "The angles of a triangle are in the ratio 2:3:4. Find the largest angle.",
    "options": ["60°", "70°", "80°", "90°"],
    "answer": "C"
  },
  {
    "id": "MTH255",
    "topic": "Euclidean Geometry",
    "question": "If two parallel lines are cut by a transversal and one corresponding angle is 65°, the corresponding angle is",
    "options": ["25°", "65°", "115°", "125°"],
    "answer": "B"
  },
  {
    "id": "MTH256",
    "topic": "Euclidean Geometry",
    "question": "Two angles are supplementary. If one is 72°, find the other.",
    "options": ["98°", "108°", "118°", "128°"],
    "answer": "B"
  },
  {
    "id": "MTH257",
    "topic": "Euclidean Geometry",
    "question": "The opposite angles of a cyclic quadrilateral are",
    "options": ["Equal", "Complementary", "Supplementary", "Right angles"],
    "answer": "C"
  },
  {
    "id": "MTH258",
    "topic": "Euclidean Geometry",
    "question": "A tangent to a circle is perpendicular to the",
    "options": ["Chord", "Diameter", "Radius at the point of contact", "Arc"],
    "answer": "C"
  },
  {
    "id": "MTH259",
    "topic": "Euclidean Geometry",
    "question": "The radius of a circle is 7 cm. Find its circumference, taking π = 22/7.",
    "options": ["22 cm", "44 cm", "49 cm", "154 cm"],
    "answer": "B"
  },
  {
    "id": "MTH260",
    "topic": "Euclidean Geometry",
    "question": "Find the area of a circle of radius 7 cm, taking π = 22/7.",
    "options": ["44 cm²", "77 cm²", "154 cm²", "308 cm²"],
    "answer": "C"
  },
  {
    "id": "MTH261",
    "topic": "Euclidean Geometry",
    "question": "A triangle has base 12 cm and perpendicular height 8 cm. Find its area.",
    "options": ["24 cm²", "48 cm²", "72 cm²", "96 cm²"],
    "answer": "B"
  },
  {
    "id": "MTH262",
    "topic": "Euclidean Geometry",
    "question": "Find the area of a parallelogram with base 15 cm and perpendicular height 6 cm.",
    "options": ["45 cm²", "60 cm²", "90 cm²", "120 cm²"],
    "answer": "C"
  },
  {
    "id": "MTH263",
    "topic": "Euclidean Geometry",
    "question": "A rectangle has length 12 cm and width 7 cm. Find its perimeter.",
    "options": ["19 cm", "38 cm", "84 cm", "96 cm"],
    "answer": "B"
  },
  {
    "id": "MTH264",
    "topic": "Euclidean Geometry",
    "question": "The diagonal of a rectangle is 13 cm and one side is 5 cm. Find the other side.",
    "options": ["8 cm", "10 cm", "12 cm", "14 cm"],
    "answer": "C"
  },
  {
    "id": "MTH265",
    "topic": "Euclidean Geometry",
    "question": "A right-angled triangle has perpendicular sides 6 cm and 8 cm. Find its hypotenuse.",
    "options": ["9 cm", "10 cm", "12 cm", "14 cm"],
    "answer": "B"
  },
  {
    "id": "MTH266",
    "topic": "Euclidean Geometry",
    "question": "An equilateral triangle has side 10 cm. Its perimeter is",
    "options": ["20 cm", "30 cm", "40 cm", "50 cm"],
    "answer": "B"
  },
  {
    "id": "MTH267",
    "topic": "Euclidean Geometry",
    "question": "Each interior angle of a regular hexagon is",
    "options": ["90°", "108°", "120°", "135°"],
    "answer": "C"
  },
  {
    "id": "MTH268",
    "topic": "Euclidean Geometry",
    "question": "The sum of the interior angles of a pentagon is",
    "options": ["360°", "540°", "720°", "900°"],
    "answer": "B"
  },
  {
    "id": "MTH269",
    "topic": "Euclidean Geometry",
    "question": "A chord passing through the centre of a circle is called a",
    "options": ["Tangent", "Radius", "Diameter", "Secant"],
    "answer": "C"
  },

  {
    "id": "MTH270",
    "topic": "Calculus",
    "question": "Differentiate y = 4x³ - 2x² + 5x.",
    "options": ["12x² - 4x + 5", "12x² - 2x + 5", "4x² - 4x + 5", "12x³ - 4x² + 5"],
    "answer": "A"
  },
  {
    "id": "MTH271",
    "topic": "Calculus",
    "question": "Find dy/dx if y = 7x² - 3x + 8.",
    "options": ["7x - 3", "14x - 3", "14x + 8", "7x² - 3"],
    "answer": "B"
  },
  {
    "id": "MTH272",
    "topic": "Calculus",
    "question": "Differentiate y = 1/x².",
    "options": ["2/x³", "-2/x³", "-1/x²", "1/x³"],
    "answer": "B"
  },
  {
    "id": "MTH273",
    "topic": "Calculus",
    "question": "Find the derivative of y = √x.",
    "options": ["√x", "1/(2√x)", "2√x", "1/x"],
    "answer": "B"
  },
  {
    "id": "MTH274",
    "topic": "Calculus",
    "question": "Find the derivative of sin x.",
    "options": ["sin x", "-sin x", "cos x", "-cos x"],
    "answer": "C"
  },
  {
    "id": "MTH275",
    "topic": "Calculus",
    "question": "Find the derivative of cos x.",
    "options": ["sin x", "-sin x", "cos x", "-cos x"],
    "answer": "B"
  },
  {
    "id": "MTH276",
    "topic": "Calculus",
    "question": "Integrate 8x³ with respect to x.",
    "options": ["2x⁴ + C", "8x⁴ + C", "32x⁴ + C", "4x² + C"],
    "answer": "A"
  },
  {
    "id": "MTH277",
    "topic": "Calculus",
    "question": "Find ∫(6x + 4)dx.",
    "options": ["3x² + 4x + C", "6x² + 4x + C", "3x² + 2x + C", "6x + 4 + C"],
    "answer": "A"
  },
  {
    "id": "MTH278",
    "topic": "Calculus",
    "question": "Evaluate ∫₀² 3x² dx.",
    "options": ["4", "6", "8", "12"],
    "answer": "C"
  },
  {
    "id": "MTH279",
    "topic": "Calculus",
    "question": "If y = x³ - 3x, find the gradient when x = 2.",
    "options": ["6", "9", "12", "15"],
    "answer": "C"
  },
  {
    "id": "MTH280",
    "topic": "Calculus",
    "question": "Find the second derivative of y = x⁴ - 2x².",
    "options": ["4x² - 4", "8x² - 4", "12x² - 4", "12x² - 2"],
    "answer": "C"
  },
  {
    "id": "MTH281",
    "topic": "Calculus",
    "question": "If y = 3x² + 2x - 5, find the gradient at x = 1.",
    "options": ["5", "6", "8", "10"],
    "answer": "C"
  },
  {
    "id": "MTH282",
    "topic": "Calculus",
    "question": "Evaluate ∫₁³ 2x dx.",
    "options": ["4", "6", "8", "10"],
    "answer": "C"
  },
  {
    "id": "MTH283",
    "topic": "Calculus",
    "question": "The derivative of eˣ is",
    "options": ["1", "x eˣ", "eˣ", "ln x"],
    "answer": "C"
  },
  {
    "id": "MTH284",
    "topic": "Calculus",
    "question": "If y = 5x³ - 4x, find d²y/dx².",
    "options": ["15x", "20x", "30x", "30x²"],
    "answer": "C"
  },
  {
    "id": "MTH285",
    "topic": "Calculus",
    "question": "Evaluate ∫(4x³ + 2x)dx.",
    "options": ["x⁴ + x² + C", "4x⁴ + 2x² + C", "x⁴ + 2x² + C", "12x² + 2 + C"],
    "answer": "A"
  },
  {
    "id": "MTH286",
    "topic": "Calculus",
    "question": "If y = 2x³ - 9x² + 12x, the stationary values occur when x is",
    "options": ["1 and 2", "1 and 3", "2 and 3", "3 and 4"],
    "answer": "C"
  },
  {
    "id": "MTH287",
    "topic": "Calculus",
    "question": "Find ∫₀¹(3x² + 2x)dx.",
    "options": ["1", "2", "3", "4"],
    "answer": "B"
  },
  {
    "id": "MTH288",
    "topic": "Calculus",
    "question": "The derivative of ln x is",
    "options": ["x", "1/x", "ln x", "eˣ"],
    "answer": "B"
  },

  {
    "id": "MTH289",
    "topic": "Coordinate Geometry",
    "question": "Find the gradient of the line joining (2, 3) and (6, 11).",
    "options": ["1", "2", "3", "4"],
    "answer": "B"
  },
  {
    "id": "MTH290",
    "topic": "Coordinate Geometry",
    "question": "Find the distance between (1, 2) and (4, 6).",
    "options": ["3", "4", "5", "6"],
    "answer": "C"
  },
  {
    "id": "MTH291",
    "topic": "Coordinate Geometry",
    "question": "Find the midpoint of (2, 4) and (8, 10).",
    "options": ["(4, 6)", "(5, 7)", "(6, 8)", "(7, 9)"],
    "answer": "B"
  },
  {
    "id": "MTH292",
    "topic": "Coordinate Geometry",
    "question": "The gradient of a horizontal line is",
    "options": ["0", "1", "-1", "Undefined"],
    "answer": "A"
  },
  {
    "id": "MTH293",
    "topic": "Coordinate Geometry",
    "question": "The gradient of a vertical line is",
    "options": ["0", "1", "-1", "Undefined"],
    "answer": "D"
  },
  {
    "id": "MTH294",
    "topic": "Coordinate Geometry",
    "question": "Find the equation of the line with gradient 3 passing through (1, 2).",
    "options": ["y = 3x + 1", "y = 3x - 1", "y = 2x + 3", "y = x + 3"],
    "answer": "A"
  },
  {
    "id": "MTH295",
    "topic": "Coordinate Geometry",
    "question": "Find the equation of the line with gradient -2 passing through (2, 5).",
    "options": ["y = -2x + 9", "y = -2x + 5", "y = 2x + 9", "y = 2x - 9"],
    "answer": "A"
  },
  {
    "id": "MTH296",
    "topic": "Coordinate Geometry",
    "question": "Two lines are parallel if their gradients are",
    "options": ["Equal", "Opposite", "Reciprocals", "Zero"],
    "answer": "A"
  },
  {
    "id": "MTH297",
    "topic": "Coordinate Geometry",
    "question": "Two non-vertical lines are perpendicular if the product of their gradients is",
    "options": ["0", "1", "-1", "2"],
    "answer": "C"
  },
  {
    "id": "MTH298",
    "topic": "Coordinate Geometry",
    "question": "Find the x-intercept of the line y = 2x - 6.",
    "options": ["2", "3", "4", "6"],
    "answer": "B"
  },
  {
    "id": "MTH299",
    "topic": "Coordinate Geometry",
    "question": "Find the y-intercept of y = 4x + 7.",
    "options": ["4", "7", "-4", "-7"],
    "answer": "B"
  },
  {
    "id": "MTH300",
    "topic": "Coordinate Geometry",
    "question": "Find the distance between (-2, 3) and (4, 3).",
    "options": ["4", "5", "6", "7"],
    "answer": "C"
  },
  {
    "id": "MTH301",
    "topic": "Coordinate Geometry",
    "question": "Find the midpoint of (-2, 4) and (6, 8).",
    "options": ["(2, 6)", "(4, 6)", "(2, 4)", "(3, 6)"],
    "answer": "A"
  },
  {
    "id": "MTH302",
    "topic": "Coordinate Geometry",
    "question": "The equation x² + y² = 25 represents a circle with radius",
    "options": ["3", "4", "5", "25"],
    "answer": "C"
  },
  {
    "id": "MTH303",
    "topic": "Coordinate Geometry",
    "question": "Find the centre of the circle (x - 3)² + (y + 2)² = 16.",
    "options": ["(3, 2)", "(-3, 2)", "(3, -2)", "(-3, -2)"],
    "answer": "C"
  },
  {
    "id": "MTH304",
    "topic": "Coordinate Geometry",
    "question": "Find the radius of the circle (x + 2)² + (y - 4)² = 49.",
    "options": ["4", "5", "6", "7"],
    "answer": "D"
  },
  {
    "id": "MTH305",
    "topic": "Coordinate Geometry",
    "question": "The point (3, -4) lies in which quadrant?",
    "options": ["I", "II", "III", "IV"],
    "answer": "D"
  },
  {
    "id": "MTH306",
    "topic": "Coordinate Geometry",
    "question": "Find the gradient of the line 2y = 6x + 4.",
    "options": ["2", "3", "4", "6"],
    "answer": "B"
  },
  {
    "id": "MTH307",
    "topic": "Coordinate Geometry",
    "question": "The equation of the x-axis is",
    "options": ["x = 0", "y = 0", "x = y", "x + y = 0"],
    "answer": "B"
  },

  {
    "id": "MTH308",
    "topic": "Application of Differentiation",
    "question": "A particle moves with displacement s = t² + 3t. Find its velocity at t = 2 seconds.",
    "options": ["5", "6", "7", "8"],
    "answer": "C"
  },
  {
    "id": "MTH309",
    "topic": "Application of Differentiation",
    "question": "The displacement of a particle is s = t³ - 6t² + 9t. Find its velocity at t = 2.",
    "options": ["-3", "-1", "1", "3"],
    "answer": "A"
  },
  {
    "id": "MTH310",
    "topic": "Application of Differentiation",
    "question": "If the velocity of a particle is v = 3t² - 4t, its acceleration is",
    "options": ["6t - 4", "3t - 4", "6t² - 4", "3t² - 4"],
    "answer": "A"
  },
  {
    "id": "MTH311",
    "topic": "Application of Differentiation",
    "question": "The stationary points of a curve occur where its gradient is",
    "options": ["1", "0", "-1", "Undefined"],
    "answer": "B"
  },
  {
    "id": "MTH312",
    "topic": "Application of Differentiation",
    "question": "For y = x² - 4x + 7, the minimum value occurs at x =",
    "options": ["1", "2", "3", "4"],
    "answer": "B"
  },
  {
    "id": "MTH313",
    "topic": "Application of Differentiation",
    "question": "The maximum or minimum point of a curve can be found by solving",
    "options": ["dy/dx = 0", "dy/dx = 1", "y = 0", "d²y/dx² = 0"],
    "answer": "A"
  },
  {
    "id": "MTH314",
    "topic": "Application of Differentiation",
    "question": "Find the minimum value of y = x² - 6x + 10.",
    "options": ["0", "1", "2", "3"],
    "answer": "C"
  },
  {
    "id": "MTH315",
    "topic": "Application of Differentiation",
    "question": "A rectangle has perimeter 20 cm. If one side is x cm, its area is A = x(10 - x). The maximum area is",
    "options": ["20 cm²", "25 cm²", "30 cm²", "50 cm²"],
    "answer": "B"
  },
  {
    "id": "MTH316",
    "topic": "Application of Differentiation",
    "question": "If s = 4t² - t, find the acceleration.",
    "options": ["4", "6", "8", "10"],
    "answer": "C"
  },
  {
    "id": "MTH317",
    "topic": "Application of Differentiation",
    "question": "A particle has displacement s = t³ - 3t² + 2t. Its velocity is zero when t is",
    "options": ["1 or 2", "1 or 3", "2 or 3", "3 or 4"],
    "answer": "A"
  },
  {
    "id": "MTH318",
    "topic": "Application of Differentiation",
    "question": "For y = x³ - 3x² + 2, the stationary points occur at",
    "options": ["x = 0 and 1", "x = 1 and 2", "x = 2 and 3", "x = 3 and 4"],
    "answer": "B"
  },
  {
    "id": "MTH319",
    "topic": "Application of Differentiation",
    "question": "If the second derivative at a stationary point is positive, the point is a",
    "options": ["Maximum", "Minimum", "Point of inflection", "Turning line"],
    "answer": "B"
  },
  {
    "id": "MTH320",
    "topic": "Application of Differentiation",
    "question": "If the second derivative at a stationary point is negative, the point is a",
    "options": ["Maximum", "Minimum", "Point of inflection", "Constant point"],
    "answer": "A"
  },
  {
    "id": "MTH321",
    "topic": "Application of Differentiation",
    "question": "The rate of change of volume with respect to time is known as",
    "options": ["Velocity", "Acceleration", "Volume rate", "Rate of change"],
    "answer": "D"
  },
  {
    "id": "MTH322",
    "topic": "Application of Differentiation",
    "question": "If y = 2x³ - 9x² + 12x, the stationary values of x are",
    "options": ["1 and 2", "2 and 3", "3 and 4", "1 and 3"],
    "answer": "A"
  },
  {
    "id": "MTH323",
    "topic": "Application of Differentiation",
    "question": "The gradient of a curve represents its",
    "options": ["Area", "Rate of change", "Volume", "Intercept"],
    "answer": "B"
  },
  {
    "id": "MTH324",
    "topic": "Application of Differentiation",
    "question": "If s = 2t³ + 3t², find the velocity at t = 1.",
    "options": ["6", "9", "12", "15"],
    "answer": "C"
  },
  {
    "id": "MTH325",
    "topic": "Application of Differentiation",
    "question": "The curve y = x² + 2x + 5 has a minimum point at",
    "options": ["(-1, 4)", "(1, 4)", "(-2, 5)", "(2, 5)"],
    "answer": "A"
  },
  {
    "id": "MTH326",
    "topic": "Application of Differentiation",
    "question": "A function is increasing over an interval when its derivative is",
    "options": ["Negative", "Positive", "Zero", "Undefined"],
    "answer": "B"
  },
  {
    "id": "MTH327",
    "topic": "Application of Differentiation",
    "question": "A function is decreasing over an interval when its derivative is",
    "options": ["Positive", "Negative", "Zero", "One"],
    "answer": "B"
  },

  {
    "id": "MTH328",
    "topic": "Statistics",
    "question": "Find the mean of 4, 6, 8, 10 and 12.",
    "options": ["6", "7", "8", "9"],
    "answer": "C"
  },
  {
    "id": "MTH329",
    "topic": "Statistics",
    "question": "Find the median of 3, 7, 5, 9 and 11.",
    "options": ["5", "7", "8", "9"],
    "answer": "B"
  },
  {
    "id": "MTH330",
    "topic": "Statistics",
    "question": "Find the mode of 2, 4, 4, 5, 6, 4 and 7.",
    "options": ["2", "4", "5", "6"],
    "answer": "B"
  },
  {
    "id": "MTH331",
    "topic": "Statistics",
    "question": "Find the range of 12, 18, 7, 25 and 10.",
    "options": ["15", "18", "20", "25"],
    "answer": "C"
  },
  {
    "id": "MTH332",
    "topic": "Statistics",
    "question": "The mean of 5 numbers is 12. Find their total.",
    "options": ["50", "55", "60", "65"],
    "answer": "C"
  },
  {
    "id": "MTH333",
    "topic": "Statistics",
    "question": "A pie chart represents data using",
    "options": ["Rectangles", "Angles of sectors", "Straight lines only", "Frequency polygons"],
    "answer": "Angles of sectors"
  },
  {
    "id": "MTH334",
    "topic": "Statistics",
    "question": "A sector representing 25% of a pie chart has an angle of",
    "options": ["45°", "60°", "90°", "120°"],
    "answer": "90°"
  },
  {
    "id": "MTH335",
    "topic": "Statistics",
    "question": "The variance of a set of identical observations is",
    "options": ["0", "1", "Equal to the mean", "Undefined"],
    "answer": "0"
  },
  {
    "id": "MTH336",
    "topic": "Statistics",
    "question": "If every observation in a data set is increased by 5, the mean is",
    "options": ["Unchanged", "Increased by 5", "Decreased by 5", "Multiplied by 5"],
    "answer": "Increased by 5"
  },
  {
    "id": "MTH337",
    "topic": "Probability",
    "question": "The probability of an impossible event is",
    "options": ["0", "1/2", "1", "2"],
    "answer": "0"
  },
  {
    "id": "MTH338",
    "topic": "Probability",
    "question": "The probability of a certain event is",
    "options": ["0", "1/4", "1/2", "1"],
    "answer": "1"
  },
  {
    "id": "MTH339",
    "topic": "Probability",
    "question": "A fair die is thrown once. The probability of obtaining a 4 is",
    "options": ["1/2", "1/4", "1/6", "1/3"],
    "answer": "1/6"
  },
  {
    "id": "MTH340",
    "topic": "Probability",
    "question": "A fair coin is tossed once. The probability of obtaining a head is",
    "options": ["0", "1/4", "1/2", "1"],
    "answer": "1/2"
  },
  {
    "id": "MTH341",
    "topic": "Probability",
    "question": "A bag contains 3 red balls and 2 blue balls. The probability of selecting a red ball is",
    "options": ["2/5", "3/5", "1/2", "3/2"],
    "answer": "3/5"
  },
  {
    "id": "MTH342",
    "topic": "Probability",
    "question": "If P(A) = 0.3, then P(not A) is",
    "options": ["0.3", "0.5", "0.7", "1.3"],
    "answer": "0.7"
  },
  {
    "id": "MTH343",
    "topic": "Probability",
    "question": "Two fair coins are tossed. The probability of obtaining two heads is",
    "options": ["1/2", "1/3", "1/4", "1/8"],
    "answer": "1/4"
  },
  {
    "id": "MTH344",
    "topic": "Probability",
    "question": "A card is selected from a standard pack of 52 cards. The probability of selecting an ace is",
    "options": ["1/13", "1/26", "4/13", "1/4"],
    "answer": "1/13"
  },
  {
    "id": "MTH345",
    "topic": "Probability",
    "question": "The probability of obtaining an even number when a fair die is thrown is",
    "options": ["1/6", "1/3", "1/2", "2/3"],
    "answer": "1/2"
  },
  {
    "id": "MTH346",
    "topic": "Probability",
    "question": "If P(A) = 0.4 and P(B) = 0.5 for independent events, P(A and B) is",
    "options": ["0.1", "0.2", "0.4", "0.9"],
    "answer": "0.2"
  },
  {
    "id": "MTH347",
    "topic": "Probability",
    "question": "The probability of getting at least one head when two fair coins are tossed is",
    "options": ["1/4", "1/2", "3/4", "1"],
    "answer": "3/4"
  },
  {
    "id": "MTH348",
    "topic": "Probability",
    "question": "If P(A) = 0.6 and P(B) = 0.3 and A and B are mutually exclusive, P(A or B) is",
    "options": ["0.18", "0.3", "0.6", "0.9"],
    "answer": "0.9"
  },
  {
    "id": "MTH349",
    "topic": "Probability",
    "question": "A box contains 5 white balls and 3 black balls. One ball is chosen at random. The probability of choosing a black ball is",
    "options": ["3/5", "5/8", "3/8", "1/3"],
    "answer": "3/8"
  },
  {
    "id": "MTH350",
    "topic": "Probability",
    "question": "If the odds against an event are 3:2, the probability that the event occurs is",
    "options": ["2/3", "3/5", "2/5", "1/2"],
    "answer": "2/5"
  }

],


    
    "English": [
      {"id":"ENG001","topic":"Lexis and Structure - Synonyms","question":"Choose the option that is nearest in meaning to the underlined word: The manager's decision was ARBITRARY.","options":["Random","Logical","Careful","Popular"],"answer":"Random"},
{"id":"ENG002","topic":"Oral Forms - Vowels","question":"Choose the word that has the same vowel sound as the one represented by the letters underlined: SEAT","options":["Feet","Fit","Set","Fat"],"answer":"Feet"},
{"id":"ENG003","topic":"Lexis and Structure - Antonyms","question":"Choose the option that is most opposite in meaning to the underlined word: The old man was very FRUGAL with his money.","options":["Extravagant","Careful","Poor","Wise"],"answer":"Extravagant"},
{"id":"ENG004","topic":"Comprehension","question":"Passage: 'Deforestation has led to soil erosion in many parts of the country. Farmers now find it difficult to grow crops on land that was once fertile.' What is the main cause of the farmers' problem?","options":["Deforestation","Overpopulation","Drought","Flooding"],"answer":"Deforestation"},
{"id":"ENG005","topic":"Lexis and Structure - Fill Gaps","question":"He has been living in Lagos ____ 2015.","options":["since","for","from","by"],"answer":"since"},
{"id":"ENG006","topic":"Oral Forms - Stress","question":"Choose the word with the stress on the first syllable.","options":["PHOtograph","phoTOgraphy","photoGRAphic","photoGRApher"],"answer":"PHOtograph"},
{"id":"ENG007","topic":"Lexis and Structure - Synonyms","question":"The politician's speech was full of RHETORIC.","options":["Persuasive language","Facts","Silence","Confusion"],"answer":"Persuasive language"},
{"id":"ENG008","topic":"Lexis and Structure - Idioms","question":"To 'let the cat out of the bag' means to ____.","options":["reveal a secret","adopt a pet","cause trouble","hide something"],"answer":"reveal a secret"},
{"id":"ENG009","topic":"Comprehension","question":"Passage: 'Despite the heavy rain, the football match continued as scheduled.' What can be inferred about the weather?","options":["It did not stop the match","It cancelled the match","It delayed the match","It improved during the match"],"answer":"It did not stop the match"},
{"id":"ENG010","topic":"Lexis and Structure - Antonyms","question":"The room was completely BARREN of furniture.","options":["Full","Empty","Clean","Dirty"],"answer":"Full"},
{"id":"ENG011","topic":"Oral Forms - Consonants","question":"Choose the word in which the letter 'c' is pronounced differently from the others.","options":["Cell","Cat","Cup","Cot"],"answer":"Cell"},
{"id":"ENG012","topic":"Lexis and Structure - Grammar","question":"Neither the teacher nor the students ____ ready for the exam.","options":["were","was","are","is"],"answer":"were"},
{"id":"ENG013","topic":"Lexis and Structure - Synonyms","question":"The child was very DOCILE and obeyed every instruction.","options":["Obedient","Stubborn","Loud","Clever"],"answer":"Obedient"},
{"id":"ENG014","topic":"Comprehension","question":"Passage: 'The company reported a decline in profits due to rising production costs.' Why did profits decline?","options":["Rising production costs","Falling sales","New competitors","Government tax"],"answer":"Rising production costs"},
{"id":"ENG015","topic":"Lexis and Structure - Antonyms","question":"His answer was very AMBIGUOUS.","options":["Clear","Confusing","Long","Short"],"answer":"Clear"},
{"id":"ENG016","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'THROUGH'.","options":["Blue","Cow","Now","Though"],"answer":"Blue"},
{"id":"ENG017","topic":"Lexis and Structure - Fill Gaps","question":"She is good ____ Mathematics.","options":["at","in","on","with"],"answer":"at"},
{"id":"ENG018","topic":"Lexis and Structure - Synonyms","question":"The soldiers showed great TENACITY during the battle.","options":["Persistence","Fear","Weakness","Confusion"],"answer":"Persistence"},
{"id":"ENG019","topic":"Comprehension","question":"Passage: 'Many students fail examinations not because they are not intelligent, but because they do not prepare adequately.' According to the passage, the main reason for failure is ____.","options":["Lack of preparation","Lack of intelligence","Poor teaching","Fear of exams"],"answer":"Lack of preparation"},
{"id":"ENG020","topic":"Lexis and Structure - Grammar","question":"By the time we arrived, the movie ____ already started.","options":["had","has","have","was"],"answer":"had"},
{"id":"ENG021","topic":"Oral Forms - Vowels","question":"Choose the word with a different vowel sound from the rest.","options":["Put","Cut","But","Hut"],"answer":"Put"},
{"id":"ENG022","topic":"Lexis and Structure - Antonyms","question":"The new law was met with UNANIMOUS approval.","options":["Divided","United","Loud","Silent"],"answer":"Divided"},
{"id":"ENG023","topic":"Lexis and Structure - Idioms","question":"'To bite the bullet' means to ____.","options":["endure a painful situation bravely","chew hard food","avoid a problem","get injured"],"answer":"endure a painful situation bravely"},
{"id":"ENG024","topic":"Comprehension","question":"Passage: 'The government introduced new policies aimed at reducing unemployment among youths.' The policies target ____.","options":["Youth unemployment","Adult literacy","Rural development","Foreign trade"],"answer":"Youth unemployment"},
{"id":"ENG025","topic":"Lexis and Structure - Synonyms","question":"His explanation was quite LUCID.","options":["Clear","Confusing","Short","Boring"],"answer":"Clear"},
{"id":"ENG026","topic":"Oral Forms - Stress","question":"Which word carries the stress on the second syllable?","options":["deCIDE","DEcide","decIDE","DECide"],"answer":"deCIDE"},
{"id":"ENG027","topic":"Lexis and Structure - Fill Gaps","question":"I am not interested ____ politics.","options":["in","on","at","for"],"answer":"in"},
{"id":"ENG028","topic":"Lexis and Structure - Antonyms","question":"The village was known for its TRANQUILITY.","options":["Chaos","Peace","Beauty","Poverty"],"answer":"Chaos"},
{"id":"ENG029","topic":"Comprehension","question":"Passage: 'Although he was injured, the athlete finished the race.' What quality does this show?","options":["Determination","Weakness","Carelessness","Fear"],"answer":"Determination"},
{"id":"ENG030","topic":"Lexis and Structure - Synonyms","question":"The evidence against him was OVERWHELMING.","options":["Convincing","Weak","Confusing","Missing"],"answer":"Convincing"},
{"id":"ENG031","topic":"Oral Forms - Consonants","question":"In which word is the letter 'g' pronounced as in 'gate'?","options":["Give","Gem","Gin","Gentle"],"answer":"Give"},
{"id":"ENG032","topic":"Lexis and Structure - Grammar","question":"If I ____ you, I would apologize.","options":["were","was","am","be"],"answer":"were"},
{"id":"ENG033","topic":"Lexis and Structure - Idioms","question":"'A blessing in disguise' refers to something that ____.","options":["seems bad but turns out good","is a religious event","brings misfortune","is hidden from view"],"answer":"seems bad but turns out good"},
{"id":"ENG034","topic":"Comprehension","question":"Passage: 'The river overflowed its banks, destroying homes and farmlands in the process.' What was destroyed?","options":["Homes and farmlands","Only homes","Only farmlands","Roads and bridges"],"answer":"Homes and farmlands"},
{"id":"ENG035","topic":"Lexis and Structure - Antonyms","question":"The witness gave a CANDID account of the accident.","options":["Deceptive","Honest","Long","Short"],"answer":"Deceptive"},
{"id":"ENG036","topic":"Oral Forms - Rhymes","question":"Choose the word that does NOT rhyme with 'LIGHT'.","options":["Height","Fight","Sight","Debt"],"answer":"Debt"},
{"id":"ENG037","topic":"Lexis and Structure - Fill Gaps","question":"The children were fond ____ playing outside.","options":["of","in","at","with"],"answer":"of"},
{"id":"ENG038","topic":"Lexis and Structure - Synonyms","question":"The manager's tone was quite CONDESCENDING.","options":["Patronizing","Friendly","Angry","Formal"],"answer":"Patronizing"},
{"id":"ENG039","topic":"Comprehension","question":"Passage: 'Vaccination programs have significantly reduced the spread of preventable diseases in rural communities.' What has reduced disease spread?","options":["Vaccination programs","Better hospitals","Clean water","Education"],"answer":"Vaccination programs"},
{"id":"ENG040","topic":"Lexis and Structure - Grammar","question":"She is one of the students who ____ always punctual.","options":["are","is","was","be"],"answer":"are"},
{"id":"ENG041","topic":"Oral Forms - Vowels","question":"Choose the word with the same vowel sound as 'BIRD'.","options":["Word","Bird","Board","Bead"],"answer":"Word"},
{"id":"ENG042","topic":"Lexis and Structure - Antonyms","question":"His remarks were considered quite BENEVOLENT.","options":["Malicious","Kind","Long","Loud"],"answer":"Malicious"},
{"id":"ENG043","topic":"Lexis and Structure - Idioms","question":"'To turn over a new leaf' means to ____.","options":["start behaving in a better way","read a new book","move to a new house","plant a tree"],"answer":"start behaving in a better way"},
{"id":"ENG044","topic":"Comprehension","question":"Passage: 'The professor's lecture was so engaging that no student left the hall before it ended.' This shows the lecture was ____.","options":["Interesting","Boring","Short","Difficult"],"answer":"Interesting"},
{"id":"ENG045","topic":"Lexis and Structure - Synonyms","question":"The suspect gave an EVASIVE answer to the question.","options":["Vague","Direct","Loud","Honest"],"answer":"Vague"},
{"id":"ENG046","topic":"Oral Forms - Stress","question":"Choose the correctly stressed word for a noun form.","options":["REcord (noun)","reCORD (noun)","RECord (verb)","recORD (noun)"],"answer":"REcord (noun)"},
{"id":"ENG047","topic":"Lexis and Structure - Fill Gaps","question":"He congratulated me ____ my success.","options":["on","for","at","about"],"answer":"on"},
{"id":"ENG048","topic":"Lexis and Structure - Antonyms","question":"The politician's promise turned out to be FUTILE.","options":["Fruitful","Useless","Long","Short"],"answer":"Fruitful"},
{"id":"ENG049","topic":"Comprehension","question":"Passage: 'Not all that glitters is gold, as the saying goes; some things that look attractive are actually worthless.' The passage warns against ____.","options":["Judging by appearance","Wasting money","Buying gold","Trusting strangers"],"answer":"Judging by appearance"},
{"id":"ENG050","topic":"Lexis and Structure - Synonyms","question":"The old bridge was in a DILAPIDATED state.","options":["Ruined","New","Strong","Painted"],"answer":"Ruined"},
{"id":"ENG051","topic":"Oral Forms - Consonants","question":"In which word is 'th' pronounced as in 'this'?","options":["That","Think","Thin","Thank"],"answer":"That"},
{"id":"ENG052","topic":"Lexis and Structure - Grammar","question":"The news ____ shocking to everyone present.","options":["was","were","are","have been"],"answer":"was"},
{"id":"ENG053","topic":"Lexis and Structure - Idioms","question":"'To cost an arm and a leg' means something is ____.","options":["very expensive","dangerous","painful","difficult to find"],"answer":"very expensive"},
{"id":"ENG054","topic":"Comprehension","question":"Passage: 'Corruption remains one of the biggest obstacles to development in many nations.' What is identified as an obstacle to development?","options":["Corruption","Poverty","Illiteracy","War"],"answer":"Corruption"},
{"id":"ENG055","topic":"Lexis and Structure - Antonyms","question":"Her behaviour was rather ERRATIC.","options":["Consistent","Strange","Rude","Kind"],"answer":"Consistent"},
{"id":"ENG056","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'COUGH'.","options":["Off","Cow","Though","Tough"],"answer":"Off"},
{"id":"ENG057","topic":"Lexis and Structure - Fill Gaps","question":"They arrived ____ time for the meeting.","options":["in","on","at","by"],"answer":"in"},
{"id":"ENG058","topic":"Lexis and Structure - Synonyms","question":"The negotiations reached an IMPASSE.","options":["Deadlock","Agreement","Beginning","Conclusion"],"answer":"Deadlock"},
{"id":"ENG059","topic":"Comprehension","question":"Passage: 'The new policy, though well-intentioned, was poorly implemented, leading to public dissatisfaction.' What caused the dissatisfaction?","options":["Poor implementation","Bad intentions","Lack of policy","Public ignorance"],"answer":"Poor implementation"},
{"id":"ENG060","topic":"Lexis and Structure - Grammar","question":"Each of the boys ____ given a prize.","options":["was","were","are","have been"],"answer":"was"},
{"id":"ENG061","topic":"Oral Forms - Vowels","question":"Choose the word with a vowel sound different from the others.","options":["Boat","Coat","Cot","Goat"],"answer":"Cot"},
{"id":"ENG062","topic":"Lexis and Structure - Antonyms","question":"The company's growth has been quite STAGNANT.","options":["Dynamic","Slow","Poor","Fast"],"answer":"Dynamic"},
{"id":"ENG063","topic":"Lexis and Structure - Idioms","question":"'Once in a blue moon' means ____.","options":["very rarely","every month","frequently","at night"],"answer":"very rarely"},
{"id":"ENG064","topic":"Comprehension","question":"Passage: 'Renewable energy sources like solar and wind are becoming more affordable, making them attractive alternatives to fossil fuels.' What has made renewable energy attractive?","options":["Affordability","Government subsidy","Pollution","Scarcity of fossil fuels"],"answer":"Affordability"},
{"id":"ENG065","topic":"Lexis and Structure - Synonyms","question":"The teacher's explanation was quite SUCCINCT.","options":["Brief","Long","Confusing","Loud"],"answer":"Brief"},
{"id":"ENG066","topic":"Oral Forms - Stress","question":"Which word has three syllables with stress on the first?","options":["BEautiful","beauTIful","beautiFUL","beauTIFul"],"answer":"BEautiful"},
{"id":"ENG067","topic":"Lexis and Structure - Fill Gaps","question":"He was accused ____ theft.","options":["of","for","with","about"],"answer":"of"},
{"id":"ENG068","topic":"Lexis and Structure - Antonyms","question":"The manager was known for being QUITE LENIENT with staff.","options":["Strict","Kind","Fair","Generous"],"answer":"Strict"},
{"id":"ENG069","topic":"Comprehension","question":"Passage: 'The famine of 1972 forced thousands of families to migrate in search of food.' Why did families migrate?","options":["In search of food","War","Disease","Flooding"],"answer":"In search of food"},
{"id":"ENG070","topic":"Lexis and Structure - Synonyms","question":"The athlete's performance was truly EXEMPLARY.","options":["Outstanding","Poor","Average","Unusual"],"answer":"Outstanding"},
{"id":"ENG071","topic":"Oral Forms - Consonants","question":"Choose the word where 's' is pronounced as /z/.","options":["Rose","Bus","Miss","Kiss"],"answer":"Rose"},
{"id":"ENG072","topic":"Lexis and Structure - Grammar","question":"The committee ____ divided on the issue.","options":["is","are both correct depending on context","was were","none"],"answer":"is"},
{"id":"ENG073","topic":"Lexis and Structure - Idioms","question":"'To spill the beans' means to ____.","options":["reveal a secret","cook food","waste something","make a mess"],"answer":"reveal a secret"},
{"id":"ENG074","topic":"Comprehension","question":"Passage: 'Modern agriculture relies heavily on technology to increase crop yield and reduce labour costs.' What does modern agriculture rely on?","options":["Technology","Manual labour","Rainfall","Government aid"],"answer":"Technology"},
{"id":"ENG075","topic":"Lexis and Structure - Antonyms","question":"His argument was rather SPECIOUS.","options":["Genuine","Persuasive","Long","Loud"],"answer":"Genuine"},
{"id":"ENG076","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'GREAT'.","options":["Late","Meat","Feet","Threat"],"answer":"Late"},
{"id":"ENG077","topic":"Lexis and Structure - Fill Gaps","question":"She apologized ____ being late.","options":["for","of","about","with"],"answer":"for"},
{"id":"ENG078","topic":"Lexis and Structure - Synonyms","question":"The old man gave a PROPHETIC warning about the future.","options":["Predictive","Confusing","False","Loud"],"answer":"Predictive"},
{"id":"ENG079","topic":"Comprehension","question":"Passage: 'Traffic congestion in the city has worsened due to poor road infrastructure and rapid population growth.' What are the two causes mentioned?","options":["Poor infrastructure and population growth","Poor infrastructure only","Population growth only","Weather and infrastructure"],"answer":"Poor infrastructure and population growth"},
{"id":"ENG080","topic":"Lexis and Structure - Grammar","question":"He suggested that she ____ the doctor immediately.","options":["see","sees","saw","seeing"],"answer":"see"},
{"id":"ENG081","topic":"Lexis and Structure - Antonyms","question":"The land was extremely FERTILE.","options":["Barren","Rich","Wet","Green"],"answer":"Barren"},
{"id":"ENG082","topic":"Oral Forms - Vowels","question":"Choose the word with a different vowel sound.","options":["Look","Book","Look","Boot"],"answer":"Boot"},
{"id":"ENG083","topic":"Lexis and Structure - Idioms","question":"'To hit the nail on the head' means to ____.","options":["say exactly the right thing","cause damage","work hard","fail at a task"],"answer":"say exactly the right thing"},
{"id":"ENG084","topic":"Comprehension","question":"Passage: 'Despite numerous warnings, the villagers refused to leave the flood-prone area.' What does this reveal about the villagers?","options":["Stubbornness","Fear","Ignorance","Poverty"],"answer":"Stubbornness"},
{"id":"ENG085","topic":"Lexis and Structure - Synonyms","question":"The judge's ruling was considered quite IMPARTIAL.","options":["Fair","Biased","Harsh","Lenient"],"answer":"Fair"},
{"id":"ENG086","topic":"Oral Forms - Stress","question":"Which of these is a two-syllable word stressed on the second syllable?","options":["Begin","Open","Table","Water"],"answer":"Begin"},
{"id":"ENG087","topic":"Lexis and Structure - Fill Gaps","question":"The book consists ____ ten chapters.","options":["of","in","with","for"],"answer":"of"},
{"id":"ENG088","topic":"Lexis and Structure - Antonyms","question":"The soldier's courage was truly REMARKABLE.","options":["Ordinary","Notable","Rare","Great"],"answer":"Ordinary"},
{"id":"ENG089","topic":"Comprehension","question":"Passage: 'The economic downturn affected small businesses more severely than large corporations.' Who was hit hardest?","options":["Small businesses","Large corporations","Government agencies","Foreign investors"],"answer":"Small businesses"},
{"id":"ENG090","topic":"Lexis and Structure - Synonyms","question":"His comment was rather FLIPPANT.","options":["Disrespectful","Serious","Kind","Thoughtful"],"answer":"Disrespectful"},
{"id":"ENG091","topic":"Oral Forms - Consonants","question":"Choose the word where 'ch' is pronounced as /k/.","options":["Chemist","Chair","Church","Cheese"],"answer":"Chemist"},
{"id":"ENG092","topic":"Lexis and Structure - Grammar","question":"There ____ many reasons for his absence.","options":["are","is","was","has been"],"answer":"are"},
{"id":"ENG093","topic":"Lexis and Structure - Idioms","question":"'To burn the midnight oil' means to ____.","options":["work or study late at night","waste resources","cause a fire","relax at night"],"answer":"work or study late at night"},
{"id":"ENG094","topic":"Comprehension","question":"Passage: 'Education remains the most powerful tool for eradicating poverty in developing nations.' What is described as the most powerful tool?","options":["Education","Money","Technology","Agriculture"],"answer":"Education"},
{"id":"ENG095","topic":"Lexis and Structure - Antonyms","question":"The evidence presented was quite CONCLUSIVE.","options":["Inconclusive","Strong","Clear","Final"],"answer":"Inconclusive"},
{"id":"ENG096","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'BREAD'.","options":["Head","Bead","Read (present tense)","Lead (metal)"],"answer":"Head"},
{"id":"ENG097","topic":"Lexis and Structure - Fill Gaps","question":"She is married ____ a doctor.","options":["to","with","by","for"],"answer":"to"},
{"id":"ENG098","topic":"Lexis and Structure - Synonyms","question":"The old chief was known for his WISDOM and fairness.","options":["Sagacity","Wealth","Anger","Pride"],"answer":"Sagacity"},
{"id":"ENG099","topic":"Comprehension","question":"Passage: 'Cybercrime has increased dramatically as more transactions move online.' What has led to increased cybercrime?","options":["More online transactions","Better security","Fewer regulations","Less internet use"],"answer":"More online transactions"},
{"id":"ENG100","topic":"Lexis and Structure - Grammar","question":"I would rather you ____ home now.","options":["went","go","goes","going"],"answer":"went"},
{"id":"ENG101","topic":"Lexis and Structure - Antonyms","question":"The manager's approach was quite AUTOCRATIC.","options":["Democratic","Strict","Harsh","Firm"],"answer":"Democratic"},
{"id":"ENG102","topic":"Oral Forms - Vowels","question":"Choose the word with the same vowel sound as 'CAUGHT'.","options":["Bought","Cat","Cut","Coat"],"answer":"Bought"},
{"id":"ENG103","topic":"Lexis and Structure - Idioms","question":"'To be on cloud nine' means to be ____.","options":["extremely happy","confused","in danger","very tired"],"answer":"extremely happy"},
{"id":"ENG104","topic":"Comprehension","question":"Passage: 'The committee postponed the meeting because the chairman was unavoidably absent.' Why was the meeting postponed?","options":["Chairman's absence","Lack of quorum","Bad weather","Venue problem"],"answer":"Chairman's absence"},
{"id":"ENG105","topic":"Lexis and Structure - Synonyms","question":"His method was quite METICULOUS.","options":["Careful","Careless","Fast","Slow"],"answer":"Careful"},
{"id":"ENG106","topic":"Oral Forms - Stress","question":"Choose the word stressed on the last syllable.","options":["engiNEER","ENgineer","engiNeer","ENGineer"],"answer":"engiNEER"},
{"id":"ENG107","topic":"Lexis and Structure - Fill Gaps","question":"He is capable ____ doing better.","options":["of","for","to","with"],"answer":"of"},
{"id":"ENG108","topic":"Lexis and Structure - Antonyms","question":"The witness's testimony was highly CREDIBLE.","options":["Doubtful","Trustworthy","Long","Detailed"],"answer":"Doubtful"},
{"id":"ENG109","topic":"Comprehension","question":"Passage: 'Air pollution in major cities has led to a rise in respiratory diseases.' What has caused respiratory diseases to rise?","options":["Air pollution","Water pollution","Noise pollution","Poor diet"],"answer":"Air pollution"},
{"id":"ENG110","topic":"Lexis and Structure - Synonyms","question":"The peace talks ended in a STALEMATE.","options":["Deadlock","Victory","Agreement","Ceasefire"],"answer":"Deadlock"},
{"id":"ENG111","topic":"Oral Forms - Consonants","question":"In which word is 'ph' pronounced as /f/?","options":["Phone","Shepherd","Uphold","Haphazard"],"answer":"Phone"},
{"id":"ENG112","topic":"Lexis and Structure - Grammar","question":"Scarcely ____ he arrived when the trouble started.","options":["had","has","did","was"],"answer":"had"},
{"id":"ENG113","topic":"Lexis and Structure - Idioms","question":"'To add insult to injury' means to ____.","options":["make a bad situation worse","apologize sincerely","injure someone physically","compliment falsely"],"answer":"make a bad situation worse"},
{"id":"ENG114","topic":"Comprehension","question":"Passage: 'The startup struggled initially but eventually became one of the leading tech firms in the region.' What happened to the startup eventually?","options":["It became a leading firm","It closed down","It remained small","It merged with a rival"],"answer":"It became a leading firm"},
{"id":"ENG115","topic":"Lexis and Structure - Antonyms","question":"The chairman's speech was rather VERBOSE.","options":["Concise","Long","Boring","Formal"],"answer":"Concise"},
{"id":"ENG116","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'CHOSE'.","options":["Rose","Loss","Chose", "Cause"],"answer":"Rose"},
{"id":"ENG117","topic":"Lexis and Structure - Fill Gaps","question":"They insisted ____ paying the full amount.","options":["on","for","with","about"],"answer":"on"},
{"id":"ENG118","topic":"Lexis and Structure - Synonyms","question":"The city's infrastructure was in a state of DECAY.","options":["Deterioration","Growth","Renewal","Perfection"],"answer":"Deterioration"},
{"id":"ENG119","topic":"Comprehension","question":"Passage: 'Many farmers have adopted irrigation to cope with unreliable rainfall patterns.' Why have farmers adopted irrigation?","options":["Unreliable rainfall","Government mandate","High crop prices","Soil fertility"],"answer":"Unreliable rainfall"},
{"id":"ENG120","topic":"Lexis and Structure - Grammar","question":"It is high time we ____ this problem.","options":["solved","solve","solves","solving"],"answer":"solved"},
{"id":"ENG121","topic":"Lexis and Structure - Antonyms","question":"His attitude towards work is quite DILIGENT.","options":["Lazy","Careful","Fast","Consistent"],"answer":"Lazy"},
{"id":"ENG122","topic":"Oral Forms - Vowels","question":"Choose the word with a vowel sound different from the rest.","options":["Bear","Fear","Wear","Pear"],"answer":"Fear"},
{"id":"ENG123","topic":"Lexis and Structure - Idioms","question":"'To break the ice' means to ____.","options":["ease tension in a social setting","destroy something cold","start an argument","end a friendship"],"answer":"ease tension in a social setting"},
{"id":"ENG124","topic":"Comprehension","question":"Passage: 'The government's subsidy program aims to reduce the cost of fertilizers for smallholder farmers.' Who benefits from the subsidy?","options":["Smallholder farmers","Large corporations","Fertilizer importers","Urban dwellers"],"answer":"Smallholder farmers"},
{"id":"ENG125","topic":"Lexis and Structure - Synonyms","question":"The professor's argument was quite COGENT.","options":["Convincing","Weak","Long","Boring"],"answer":"Convincing"},
{"id":"ENG126","topic":"Oral Forms - Stress","question":"Choose the correctly stressed adjective form.","options":["ecoNOMic","ECOnomic","economIC","ECONomic"],"answer":"ecoNOMic"},
{"id":"ENG127","topic":"Lexis and Structure - Fill Gaps","question":"He was deprived ____ his rights.","options":["of","from","by","with"],"answer":"of"},
{"id":"ENG128","topic":"Lexis and Structure - Antonyms","question":"The old policy was considered OBSOLETE.","options":["Modern","Outdated","Useless","Old"],"answer":"Modern"},
{"id":"ENG129","topic":"Comprehension","question":"Passage: 'The novelist's use of vivid imagery brought the setting to life for readers.' What technique did the novelist use?","options":["Vivid imagery","Dialogue","Flashback","Foreshadowing"],"answer":"Vivid imagery"},
{"id":"ENG130","topic":"Lexis and Structure - Grammar","question":"The manager, along with his assistants, ____ present at the meeting.","options":["was","were","are","have been"],"answer":"was"},
{"id":"ENG131","topic":"Lexis and Structure - Idioms","question":"'To keep one's fingers crossed' means to ____.","options":["hope for good luck","lie to someone","pray loudly","give up hope"],"answer":"hope for good luck"},
{"id":"ENG132","topic":"Comprehension","question":"Passage: 'The city council approved funds for the construction of a new public library.' What did the council approve funds for?","options":["A new library","A new hospital","A new school","A new market"],"answer":"A new library"},
{"id":"ENG133","topic":"Lexis and Structure - Synonyms","question":"The manager's decision was rather PRECIPITATE.","options":["Hasty","Slow","Careful","Wise"],"answer":"Hasty"},
{"id":"ENG134","topic":"Oral Forms - Consonants","question":"In which word is the 'k' silent?","options":["Knee","King","Kite","Kettle"],"answer":"Knee"},
{"id":"ENG135","topic":"Lexis and Structure - Antonyms","question":"The negotiations were marked by HOSTILITY.","options":["Friendliness","Anger","Distrust","Silence"],"answer":"Friendliness"},
{"id":"ENG136","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'SOUGHT'.","options":["Caught","Shout","Bout","Doubt"],"answer":"Caught"},
{"id":"ENG137","topic":"Lexis and Structure - Fill Gaps","question":"The teacher was pleased ____ the students' performance.","options":["with","of","by","for"],"answer":"with"},
{"id":"ENG138","topic":"Comprehension","question":"Passage: 'The invention of the printing press revolutionized the spread of knowledge across Europe.' What effect did the printing press have?","options":["It spread knowledge","It reduced literacy","It ended handwriting","It caused wars"],"answer":"It spread knowledge"},
{"id":"ENG139","topic":"Lexis and Structure - Synonyms","question":"The new employee showed great INITIATIVE.","options":["Resourcefulness","Laziness","Confusion","Fear"],"answer":"Resourcefulness"},
{"id":"ENG140","topic":"Lexis and Structure - Grammar","question":"Not only ____ he late, but he also forgot his documents.","options":["was","did","is","has"],"answer":"was"},
{"id":"ENG141","topic":"Lexis and Structure - Antonyms","question":"The old man's health was very PRECARIOUS.","options":["Stable","Weak","Poor","Fragile"],"answer":"Stable"},
{"id":"ENG142","topic":"Oral Forms - Vowels","question":"Choose the word with the same vowel sound as 'HOUSE'.","options":["Mouse","Loose","Choose","Goose"],"answer":"Mouse"},
{"id":"ENG143","topic":"Lexis and Structure - Idioms","question":"'To throw in the towel' means to ____.","options":["give up","start fighting","clean up","celebrate"],"answer":"give up"},
{"id":"ENG144","topic":"Comprehension","question":"Passage: 'The drought of that year devastated crops across the northern region.' What was affected by the drought?","options":["Crops in the north","Crops nationwide","Livestock only","Water supply only"],"answer":"Crops in the north"},
{"id":"ENG145","topic":"Lexis and Structure - Synonyms","question":"His account of the event was rather DUBIOUS.","options":["Doubtful","Clear","Honest","Detailed"],"answer":"Doubtful"},
{"id":"ENG146","topic":"Oral Forms - Stress","question":"Choose the word with stress on the first syllable.","options":["CHARacter","charACter","charactER","CharacTER"],"answer":"CHARacter"},
{"id":"ENG147","topic":"Lexis and Structure - Fill Gaps","question":"She is fond ____ singing.","options":["of","in","for","with"],"answer":"of"},
{"id":"ENG148","topic":"Lexis and Structure - Antonyms","question":"His actions were considered quite LEGITIMATE.","options":["Illegal","Fair","Just","Proper"],"answer":"Illegal"},
{"id":"ENG149","topic":"Comprehension","question":"Passage: 'The team's victory was attributed to months of rigorous training and discipline.' What led to the team's victory?","options":["Training and discipline","Luck","Weak opponents","Home advantage"],"answer":"Training and discipline"},
{"id":"ENG150","topic":"Lexis and Structure - Grammar","question":"He denied ____ the money.","options":["stealing","to steal","steal","stole"],"answer":"stealing"},
{"id":"ENG151","topic":"Lexis and Structure - Synonyms","question":"The old building was finally DEMOLISHED.","options":["Destroyed","Renovated","Painted","Sold"],"answer":"Destroyed"},
{"id":"ENG152","topic":"Oral Forms - Consonants","question":"In which word is 'w' silent?","options":["Write","Wet","Win","Wish"],"answer":"Write"},
{"id":"ENG153","topic":"Lexis and Structure - Antonyms","question":"The company's profits were quite SUBSTANTIAL this year.","options":["Negligible","Large","Impressive","Steady"],"answer":"Negligible"},
{"id":"ENG154","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'FLOOR'.","options":["Door","Hour","Sour","Tour"],"answer":"Door"},
{"id":"ENG155","topic":"Lexis and Structure - Fill Gaps","question":"He was absent ____ school yesterday.","options":["from","in","at","on"],"answer":"from"},
{"id":"ENG156","topic":"Comprehension","question":"Passage: 'The scientist's discovery was initially dismissed by his peers, but later proved revolutionary.' How was the discovery first received?","options":["It was dismissed","It was celebrated","It was ignored completely","It was rewarded"],"answer":"It was dismissed"},
{"id":"ENG157","topic":"Lexis and Structure - Synonyms","question":"The politician's statement was seen as INFLAMMATORY.","options":["Provocative","Calming","Boring","True"],"answer":"Provocative"},
{"id":"ENG158","topic":"Lexis and Structure - Grammar","question":"She would have passed if she ____ harder.","options":["had studied","studied","studies","study"],"answer":"had studied"},
{"id":"ENG159","topic":"Lexis and Structure - Antonyms","question":"The tribe's customs were considered quite ARCHAIC.","options":["Modern","Old","Sacred","Strange"],"answer":"Modern"},
{"id":"ENG160","topic":"Oral Forms - Vowels","question":"Choose the word with a vowel sound different from the rest.","options":["Food","Good","Mood","Roof"],"answer":"Good"},
{"id":"ENG161","topic":"Lexis and Structure - Idioms","question":"'To let sleeping dogs lie' means to ____.","options":["avoid raising an old issue","take care of animals","sleep peacefully","ignore danger"],"answer":"avoid raising an old issue"},
{"id":"ENG162","topic":"Comprehension","question":"Passage: 'The bridge collapsed due to years of neglect and lack of maintenance.' Why did the bridge collapse?","options":["Lack of maintenance","Heavy traffic","Bad weather","Poor design"],"answer":"Lack of maintenance"},
{"id":"ENG163","topic":"Lexis and Structure - Synonyms","question":"The suspect's alibi was found to be SPURIOUS.","options":["False","True","Strong","Weak"],"answer":"False"},
{"id":"ENG164","topic":"Oral Forms - Stress","question":"Choose the word stressed on the third syllable.","options":["understAND","UNderstand","underSTand","UNDERstand"],"answer":"understAND"},
{"id":"ENG165","topic":"Lexis and Structure - Fill Gaps","question":"He is different ____ his brother in many ways.","options":["from","to","than","with"],"answer":"from"},
{"id":"ENG166","topic":"Lexis and Structure - Antonyms","question":"The manager's tone during the meeting was quite CORDIAL.","options":["Hostile","Friendly","Calm","Warm"],"answer":"Hostile"},
{"id":"ENG167","topic":"Comprehension","question":"Passage: 'Overfishing has significantly reduced fish populations in coastal waters.' What is the cause of reduced fish populations?","options":["Overfishing","Pollution","Climate change","Tourism"],"answer":"Overfishing"},
{"id":"ENG168","topic":"Lexis and Structure - Synonyms","question":"The old king ruled with an IRON FIST.","options":["Harshly","Kindly","Weakly","Fairly"],"answer":"Harshly"},
{"id":"ENG169","topic":"Lexis and Structure - Grammar","question":"I look forward ____ hearing from you.","options":["to","for","at","with"],"answer":"to"},
{"id":"ENG170","topic":"Lexis and Structure - Antonyms","question":"His statement was quite AMBIVALENT.","options":["Certain","Confusing","Vague","Mixed"],"answer":"Certain"},
{"id":"ENG171","topic":"Oral Forms - Consonants","question":"Choose the word where 'gh' is silent.","options":["Night","Ghost","Ghetto","Aghast"],"answer":"Night"},
{"id":"ENG172","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'PIECE'.","options":["Peace","Piece","Lease","Fleece"],"answer":"Peace"},
{"id":"ENG173","topic":"Comprehension","question":"Passage: 'The migration of birds each winter is triggered by falling temperatures.' What triggers bird migration?","options":["Falling temperatures","Food scarcity","Predators","Human activity"],"answer":"Falling temperatures"},
{"id":"ENG174","topic":"Lexis and Structure - Synonyms","question":"The professor's lecture was quite ESOTERIC.","options":["Obscure","Simple","Boring","Long"],"answer":"Obscure"},
{"id":"ENG175","topic":"Lexis and Structure - Fill Gaps","question":"He was charged ____ murder.","options":["with","of","for","by"],"answer":"with"},
{"id":"ENG176","topic":"Lexis and Structure - Antonyms","question":"The evidence was quite SUBSTANTIVE.","options":["Insignificant","Strong","Clear","Real"],"answer":"Insignificant"},
{"id":"ENG177","topic":"Lexis and Structure - Idioms","question":"'To take something with a grain of salt' means to ____.","options":["not fully believe it","enjoy it fully","season food properly","reject it completely"],"answer":"not fully believe it"},
{"id":"ENG178","topic":"Comprehension","question":"Passage: 'The rise of social media has transformed how businesses reach their customers.' What has transformed business marketing?","options":["Social media","Television","Radio","Print media"],"answer":"Social media"},
{"id":"ENG179","topic":"Lexis and Structure - Grammar","question":"He acted as if he ____ everything.","options":["knew","knows","know","known"],"answer":"knew"},
{"id":"ENG180","topic":"Lexis and Structure - Synonyms","question":"The old law was finally ABOLISHED.","options":["Ended","Started","Amended","Enforced"],"answer":"Ended"},
{"id":"ENG181","topic":"Oral Forms - Vowels","question":"Choose the word with the same vowel sound as 'CHAIR'.","options":["Fair","Fear","Fur","Far"],"answer":"Fair"},
{"id":"ENG182","topic":"Lexis and Structure - Antonyms","question":"The soldiers displayed remarkable VALOUR.","options":["Cowardice","Bravery","Strength","Discipline"],"answer":"Cowardice"},
{"id":"ENG183","topic":"Comprehension","question":"Passage: 'Rapid urbanization has strained the city's water and electricity supply.' What has strained city resources?","options":["Rapid urbanization","Government policy","Foreign investment","Tourism"],"answer":"Rapid urbanization"},
{"id":"ENG184","topic":"Lexis and Structure - Fill Gaps","question":"She was disappointed ____ the results.","options":["with","of","for","from"],"answer":"with"},
{"id":"ENG185","topic":"Oral Forms - Stress","question":"Choose the word with stress on the second syllable.","options":["comPUTer","COMputer","compuTER","COMPUter"],"answer":"comPUTer"},
{"id":"ENG186","topic":"Lexis and Structure - Synonyms","question":"His remarks were considered quite DEROGATORY.","options":["Insulting","Complimentary","Neutral","Formal"],"answer":"Insulting"},
{"id":"ENG187","topic":"Lexis and Structure - Idioms","question":"'To go the extra mile' means to ____.","options":["make additional effort","travel far","waste time","give up early"],"answer":"make additional effort"},
{"id":"ENG188","topic":"Comprehension","question":"Passage: 'The company's new policy encourages employees to work remotely at least twice a week.' What does the new policy encourage?","options":["Remote work","Overtime","Early retirement","Team building"],"answer":"Remote work"},
{"id":"ENG189","topic":"Lexis and Structure - Grammar","question":"The number of students ____ increasing every year.","options":["is","are","were","have"],"answer":"is"},
{"id":"ENG190","topic":"Lexis and Structure - Antonyms","question":"The old man's memory was surprisingly LUCID.","options":["Confused","Sharp","Clear","Accurate"],"answer":"Confused"},
{"id":"ENG191","topic":"Oral Forms - Consonants","question":"Choose the word in which 'x' is pronounced as /z/.","options":["Xylophone","Box","Fix","Six"],"answer":"Xylophone"},
{"id":"ENG192","topic":"Oral Forms - Rhymes","question":"Choose the word that rhymes with 'WOUND' (injury).","options":["Sound","Mound","Found","Round"],"answer":"Sound"},
{"id":"ENG193","topic":"Comprehension","question":"Passage: 'The introduction of mobile banking has made financial services accessible to rural populations.' Who benefits from mobile banking, according to the passage?","options":["Rural populations","Urban elites","Banks only","Government agencies"],"answer":"Rural populations"},
{"id":"ENG194","topic":"Lexis and Structure - Synonyms","question":"The professor was known for his PROLIFIC writing.","options":["Productive","Rare","Slow","Poor"],"answer":"Productive"},
{"id":"ENG195","topic":"Lexis and Structure - Fill Gaps","question":"He is known ____ his honesty.","options":["for","of","by","with"],"answer":"for"},
{"id":"ENG196","topic":"Lexis and Structure - Antonyms","question":"The old regime was known for its OPPRESSIVE policies.","options":["Liberating","Harsh","Strict","Cruel"],"answer":"Liberating"},
{"id":"ENG197","topic":"Lexis and Structure - Idioms","question":"'To be in hot water' means to ____.","options":["be in trouble","take a bath","feel angry","cook something"],"answer":"be in trouble"},
{"id":"ENG198","topic":"Comprehension","question":"Passage: 'The novel explores themes of betrayal, loss, and redemption through its central character.' What themes does the novel explore?","options":["Betrayal, loss, redemption","Love and war","Politics and religion","Nature and science"],"answer":"Betrayal, loss, redemption"},
{"id":"ENG199","topic":"Lexis and Structure - Grammar","question":"He is used ____ working at night.","options":["to","for","with","by"],"answer":"to"},
{"id":"ENG200","topic":"Lexis and Structure - Synonyms","question":"The old palace was known for its OPULENCE.","options":["Luxury","Poverty","Simplicity","Age"],"answer":"Luxury"},

  {
    "id": "ENG201",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The chairman was ADAMANT about his decision.",
    "options": ["Flexible", "Firm", "Confused", "Careless"],
    "answer": "Firm"
  },
  {
    "id": "ENG202",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The student was ELATED after receiving the award.",
    "options": ["Angry", "Excitedly happy", "Worried", "Disappointed"],
    "answer": "Excitedly happy"
  },
  {
    "id": "ENG203",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The man's statement was AMBIGUOUS.",
    "options": ["Clear", "Doubtful in meaning", "Correct", "Brief"],
    "answer": "Doubtful in meaning"
  },
  {
    "id": "ENG204",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The manager REPRIMANDED the worker.",
    "options": ["Praised", "Promoted", "Rebuked", "Rewarded"],
    "answer": "Rebuked"
  },
  {
    "id": "ENG205",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The politician made a VAGUE statement.",
    "options": ["Unclear", "Honest", "Detailed", "Interesting"],
    "answer": "Unclear"
  },
  {
    "id": "ENG206",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The witness gave a CREDIBLE account.",
    "options": ["Believable", "False", "Lengthy", "Funny"],
    "answer": "Believable"
  },
  {
    "id": "ENG207",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The company suffered a SEVERE loss.",
    "options": ["Minor", "Serious", "Temporary", "Unexpected"],
    "answer": "Serious"
  },
  {
    "id": "ENG208",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The teacher was RELUCTANT to punish the student.",
    "options": ["Unwilling", "Eager", "Ready", "Determined"],
    "answer": "Unwilling"
  },
  {
    "id": "ENG209",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The old building was DILAPIDATED.",
    "options": ["Beautiful", "New", "Run-down", "Spacious"],
    "answer": "Run-down"
  },
  {
    "id": "ENG210",
    "topic": "Synonyms",
    "question": "Choose the option nearest in meaning to the word in capital letters: The workers were COMMENDED for their efforts.",
    "options": ["Punished", "Praised", "Ignored", "Dismissed"],
    "answer": "Praised"
  },

  {
    "id": "ENG211",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The man's behaviour was GENEROUS.",
    "options": ["Kind", "Selfish", "Helpful", "Friendly"],
    "answer": "Selfish"
  },
  {
    "id": "ENG212",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The road was WIDE.",
    "options": ["Long", "Narrow", "Smooth", "Straight"],
    "answer": "Narrow"
  },
  {
    "id": "ENG213",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The evidence was CONVINCING.",
    "options": ["Persuasive", "Weak", "Strong", "Reliable"],
    "answer": "Weak"
  },
  {
    "id": "ENG214",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The manager was LENIENT.",
    "options": ["Strict", "Kind", "Gentle", "Helpful"],
    "answer": "Strict"
  },
  {
    "id": "ENG215",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The child was OBEDIENT.",
    "options": ["Respectful", "Disobedient", "Careful", "Polite"],
    "answer": "Disobedient"
  },
  {
    "id": "ENG216",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The politician was OPTIMISTIC.",
    "options": ["Hopeful", "Pessimistic", "Confident", "Cheerful"],
    "answer": "Pessimistic"
  },
  {
    "id": "ENG217",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The examination was VOLUNTARY.",
    "options": ["Optional", "Compulsory", "Simple", "Difficult"],
    "answer": "Compulsory"
  },
  {
    "id": "ENG218",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The man's explanation was RELEVANT.",
    "options": ["Useful", "Appropriate", "Irrelevant", "Accurate"],
    "answer": "Irrelevant"
  },
  {
    "id": "ENG219",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The water was TRANSPARENT.",
    "options": ["Clear", "Opaque", "Pure", "Clean"],
    "answer": "Opaque"
  },
  {
    "id": "ENG220",
    "topic": "Antonyms",
    "question": "Choose the option opposite in meaning to the word in capital letters: The company made a PROFIT.",
    "options": ["Gain", "Loss", "Reward", "Bonus"],
    "answer": "Loss"
  },

  {
    "id": "ENG221",
    "topic": "Idioms",
    "question": "What does the expression 'to spill the beans' mean?",
    "options": ["To waste food", "To reveal a secret", "To make a mistake", "To cook badly"],
    "answer": "To reveal a secret"
  },
  {
    "id": "ENG222",
    "topic": "Idioms",
    "question": "What does 'to hit the nail on the head' mean?",
    "options": ["To cause an accident", "To say exactly the right thing", "To work carelessly", "To damage something"],
    "answer": "To say exactly the right thing"
  },
  {
    "id": "ENG223",
    "topic": "Idioms",
    "question": "If someone 'keeps an eye on' something, the person",
    "options": ["Destroys it", "Watches it carefully", "Ignores it", "Hides it"],
    "answer": "Watches it carefully"
  },
  {
    "id": "ENG224",
    "topic": "Idioms",
    "question": "What does 'once in a blue moon' mean?",
    "options": ["Every day", "Very rarely", "At night", "Very quickly"],
    "answer": "Very rarely"
  },
  {
    "id": "ENG225",
    "topic": "Idioms",
    "question": "If a student 'burns the midnight oil', the student",
    "options": ["Sleeps early", "Studies or works late at night", "Starts a fire", "Travels at night"],
    "answer": "Studies or works late at night"
  },
  {
    "id": "ENG226",
    "topic": "Idioms",
    "question": "What does 'a blessing in disguise' mean?",
    "options": ["Something that appears bad but turns out beneficial", "A religious ceremony", "A hidden enemy", "A false promise"],
    "answer": "Something that appears bad but turns out beneficial"
  },
  {
    "id": "ENG227",
    "topic": "Idioms",
    "question": "To 'cut corners' means to",
    "options": ["Take shortcuts, often by reducing effort or standards", "Cut a piece of paper", "Build a road", "Turn around quickly"],
    "answer": "Take shortcuts, often by reducing effort or standards"
  },
  {
    "id": "ENG228",
    "topic": "Idioms",
    "question": "What does 'to be in hot water' mean?",
    "options": ["To be bathing", "To be in trouble", "To be comfortable", "To be successful"],
    "answer": "To be in trouble"
  },
  {
    "id": "ENG229",
    "topic": "Idioms",
    "question": "What does 'a piece of cake' mean?",
    "options": ["A difficult task", "An easy task", "A sweet meal", "A large problem"],
    "answer": "An easy task"
  },
  {
    "id": "ENG230",
    "topic": "Idioms",
    "question": "If someone 'goes the extra mile', the person",
    "options": ["Travels abroad", "Makes an additional effort", "Gets lost", "Stops working"],
    "answer": "Makes an additional effort"
  },

  {
    "id": "ENG231",
    "topic": "Sentence Interpretation",
    "question": "The expression 'the project is at a standstill' means that the project",
    "options": ["Has been completed", "Has stopped progressing", "Is progressing rapidly", "Has become successful"],
    "answer": "Has stopped progressing"
  },
  {
    "id": "ENG232",
    "topic": "Sentence Interpretation",
    "question": "If a person is described as 'a man of his word', it means that he",
    "options": ["Talks too much", "Keeps his promises", "Writes books", "Speaks loudly"],
    "answer": "Keeps his promises"
  },
  {
    "id": "ENG233",
    "topic": "Sentence Interpretation",
    "question": "The principal's decision took everyone by surprise. This means that the decision was",
    "options": ["Expected", "Unexpected", "Popular", "Unimportant"],
    "answer": "Unexpected"
  },
  {
    "id": "ENG234",
    "topic": "Sentence Interpretation",
    "question": "The chairman called the meeting off. This means that he",
    "options": ["Started the meeting", "Cancelled the meeting", "Attended the meeting", "Delayed the meeting briefly"],
    "answer": "Cancelled the meeting"
  },
  {
    "id": "ENG235",
    "topic": "Sentence Interpretation",
    "question": "The new employee is learning the ropes. This means that the employee is",
    "options": ["Learning how things are done", "Leaving the company", "Working outdoors", "Repairing equipment"],
    "answer": "Learning how things are done"
  },
  {
    "id": "ENG236",
    "topic": "Sentence Interpretation",
    "question": "The witness gave a clean bill of health to the project. This means that the witness",
    "options": ["Declared the project satisfactory", "Cancelled the project", "Destroyed the project", "Refused to inspect it"],
    "answer": "Declared the project satisfactory"
  },
  {
    "id": "ENG237",
    "topic": "Sentence Interpretation",
    "question": "The teacher's explanation was crystal clear. This means it was",
    "options": ["Confusing", "Very clear", "Very long", "Incorrect"],
    "answer": "Very clear"
  },
  {
    "id": "ENG238",
    "topic": "Sentence Interpretation",
    "question": "The manager turned down the proposal. This means that he",
    "options": ["Accepted it", "Rejected it", "Improved it", "Copied it"],
    "answer": "Rejected it"
  },
  {
    "id": "ENG239",
    "topic": "Sentence Interpretation",
    "question": "The student came out with flying colours. This means that the student",
    "options": ["Failed badly", "Performed very well", "Left the country", "Changed schools"],
    "answer": "Performed very well"
  },
  {
    "id": "ENG240",
    "topic": "Sentence Interpretation",
    "question": "The company is on the verge of collapse. This means the company is",
    "options": ["Far from collapsing", "Close to collapsing", "Already successful", "Expanding rapidly"],
    "answer": "Close to collapsing"
  },

  {
    "id": "ENG241",
    "topic": "Grammar",
    "question": "Neither the teacher nor the students ____ aware of the change.",
    "options": ["was", "were", "is", "has"],
    "answer": "were"
  },
  {
    "id": "ENG242",
    "topic": "Grammar",
    "question": "Each of the candidates ____ a copy of the question paper.",
    "options": ["have", "has", "were having", "are having"],
    "answer": "has"
  },
  {
    "id": "ENG243",
    "topic": "Grammar",
    "question": "The boys ____ football when the rain started.",
    "options": ["play", "played", "were playing", "have played"],
    "answer": "were playing"
  },
  {
    "id": "ENG244",
    "topic": "Grammar",
    "question": "By the time we arrived, the film ____.",
    "options": ["starts", "had started", "has started", "will start"],
    "answer": "had started"
  },
  {
    "id": "ENG245",
    "topic": "Grammar",
    "question": "She has lived in Lagos ____ 2020.",
    "options": ["for", "since", "during", "from"],
    "answer": "since"
  },
  {
    "id": "ENG246",
    "topic": "Grammar",
    "question": "The students have been studying ____ three hours.",
    "options": ["since", "for", "at", "by"],
    "answer": "for"
  },
  {
    "id": "ENG247",
    "topic": "Grammar",
    "question": "If I ____ you, I would accept the offer.",
    "options": ["am", "was", "were", "be"],
    "answer": "were"
  },
  {
    "id": "ENG248",
    "topic": "Grammar",
    "question": "He would have passed if he ____ harder.",
    "options": ["studies", "studied", "had studied", "has studied"],
    "answer": "had studied"
  },
  {
    "id": "ENG249",
    "topic": "Grammar",
    "question": "The woman ____ son won the competition is a teacher.",
    "options": ["who", "whose", "whom", "which"],
    "answer": "whose"
  },
  {
    "id": "ENG250",
    "topic": "Grammar",
    "question": "The man ____ I met yesterday is a doctor.",
    "options": ["which", "whose", "whom", "what"],
    "answer": "whom"
  },

  {
    "id": "ENG251",
    "topic": "Concord",
    "question": "The news ____ encouraging.",
    "options": ["are", "were", "is", "have"],
    "answer": "is"
  },
  {
    "id": "ENG252",
    "topic": "Concord",
    "question": "Mathematics ____ my favourite subject.",
    "options": ["are", "is", "were", "have"],
    "answer": "is"
  },
  {
    "id": "ENG253",
    "topic": "Concord",
    "question": "The committee ____ divided in their opinions.",
    "options": ["was", "were", "is", "has"],
    "answer": "were"
  },
  {
    "id": "ENG254",
    "topic": "Concord",
    "question": "A number of students ____ absent today.",
    "options": ["is", "was", "are", "has"],
    "answer": "are"
  },
  {
    "id": "ENG255",
    "topic": "Concord",
    "question": "The number of students in the class ____ increasing.",
    "options": ["are", "were", "is", "have"],
    "answer": "is"
  },
  {
    "id": "ENG256",
    "topic": "Concord",
    "question": "Either the manager or the workers ____ responsible for the mistake.",
    "options": ["is", "was", "are", "has"],
    "answer": "are"
  },
  {
    "id": "ENG257",
    "topic": "Concord",
    "question": "Bread and butter ____ my usual breakfast.",
    "options": ["are", "were", "is", "have"],
    "answer": "is"
  },
  {
    "id": "ENG258",
    "topic": "Concord",
    "question": "The cattle ____ grazing in the field.",
    "options": ["is", "was", "are", "has"],
    "answer": "are"
  },
  {
    "id": "ENG259",
    "topic": "Concord",
    "question": "Every boy and girl ____ expected to attend.",
    "options": ["are", "were", "is", "have"],
    "answer": "is"
  },
  {
    "id": "ENG260",
    "topic": "Concord",
    "question": "The police ____ investigating the case.",
    "options": ["is", "was", "are", "has"],
    "answer": "are"
  },

  {
    "id": "ENG261",
    "topic": "Word Classes",
    "question": "Identify the word class of the underlined word: She sang beautifully.",
    "options": ["Noun", "Adjective", "Adverb", "Pronoun"],
    "answer": "Adverb"
  },
  {
    "id": "ENG262",
    "topic": "Word Classes",
    "question": "Identify the word class of the word 'honest' in: He is an honest man.",
    "options": ["Noun", "Adjective", "Verb", "Adverb"],
    "answer": "Adjective"
  },
  {
    "id": "ENG263",
    "topic": "Word Classes",
    "question": "Identify the word class of 'quickly' in: The boy ran quickly.",
    "options": ["Noun", "Verb", "Adverb", "Preposition"],
    "answer": "Adverb"
  },
  {
    "id": "ENG264",
    "topic": "Word Classes",
    "question": "Which of the following is a pronoun?",
    "options": ["Beautiful", "They", "Run", "Quickly"],
    "answer": "They"
  },
  {
    "id": "ENG265",
    "topic": "Word Classes",
    "question": "Which of the following is a conjunction?",
    "options": ["Because", "Beautiful", "Quickly", "House"],
    "answer": "Because"
  },
  {
    "id": "ENG266",
    "topic": "Word Classes",
    "question": "Which of the following is a preposition?",
    "options": ["Under", "Run", "Beautiful", "Slowly"],
    "answer": "Under"
  },
  {
    "id": "ENG267",
    "topic": "Word Classes",
    "question": "Which of the following is an interjection?",
    "options": ["Alas!", "House", "Quickly", "Write"],
    "answer": "Alas!"
  },
  {
    "id": "ENG268",
    "topic": "Word Classes",
    "question": "Which of the following is a verb?",
    "options": ["Honesty", "Beautiful", "Write", "Quickly"],
    "answer": "Write"
  },
  {
    "id": "ENG269",
    "topic": "Word Classes",
    "question": "Which of the following is an abstract noun?",
    "options": ["Table", "Honesty", "Chair", "Bottle"],
    "answer": "Honesty"
  },
  {
    "id": "ENG270",
    "topic": "Word Classes",
    "question": "Which of the following is a collective noun?",
    "options": ["Team", "Book", "Student", "Chair"],
    "answer": "Team"
  },

  {
    "id": "ENG271",
    "topic": "Prepositions",
    "question": "The students arrived ____ the classroom before the teacher.",
    "options": ["at", "on", "in", "by"],
    "answer": "at"
  },
  {
    "id": "ENG272",
    "topic": "Prepositions",
    "question": "He is good ____ mathematics.",
    "options": ["in", "at", "on", "for"],
    "answer": "at"
  },
  {
    "id": "ENG273",
    "topic": "Prepositions",
    "question": "She is interested ____ learning French.",
    "options": ["on", "at", "in", "for"],
    "answer": "in"
  },
  {
    "id": "ENG274",
    "topic": "Prepositions",
    "question": "The book belongs ____ me.",
    "options": ["with", "to", "for", "at"],
    "answer": "to"
  },
  {
    "id": "ENG275",
    "topic": "Prepositions",
    "question": "The meeting will begin ____ 10 a.m.",
    "options": ["in", "on", "at", "by"],
    "answer": "at"
  },
  {
    "id": "ENG276",
    "topic": "Prepositions",
    "question": "The examination is ____ Monday.",
    "options": ["at", "on", "in", "by"],
    "answer": "on"
  },
  {
    "id": "ENG277",
    "topic": "Prepositions",
    "question": "He has been absent ____ school for two days.",
    "options": ["from", "at", "to", "by"],
    "answer": "from"
  },
  {
    "id": "ENG278",
    "topic": "Prepositions",
    "question": "The children were sitting ____ the tree.",
    "options": ["under", "at", "to", "by"],
    "answer": "under"
  },
  {
    "id": "ENG279",
    "topic": "Prepositions",
    "question": "The teacher divided the class ____ four groups.",
    "options": ["into", "at", "by", "on"],
    "answer": "into"
  },
  {
    "id": "ENG280",
    "topic": "Prepositions",
    "question": "He apologized ____ his teacher for arriving late.",
    "options": ["with", "to", "at", "on"],
    "answer": "to"
  },

  {
    "id": "ENG281",
    "topic": "Question Tags",
    "question": "You are coming with us, ____?",
    "options": ["aren't you", "are you", "won't you", "don't you"],
    "answer": "aren't you"
  },
  {
    "id": "ENG282",
    "topic": "Question Tags",
    "question": "She doesn't like coffee, ____?",
    "options": ["does she", "doesn't she", "is she", "did she"],
    "answer": "does she"
  },
  {
    "id": "ENG283",
    "topic": "Question Tags",
    "question": "They went home early, ____?",
    "options": ["didn't they", "did they", "weren't they", "haven't they"],
    "answer": "didn't they"
  },
  {
    "id": "ENG284",
    "topic": "Question Tags",
    "question": "Let's go now, ____?",
    "options": ["shall we", "will we", "do we", "aren't we"],
    "answer": "shall we"
  },
  {
    "id": "ENG285",
    "topic": "Question Tags",
    "question": "Open the door, ____?",
    "options": ["will you", "do you", "are you", "shall you"],
    "answer": "will you"
  },

  {
    "id": "ENG286",
    "topic": "Active and Passive Voice",
    "question": "Choose the passive form of: The boy broke the window.",
    "options": ["The window broke the boy.", "The window was broken by the boy.", "The boy was broken by the window.", "The window has broken the boy."],
    "answer": "The window was broken by the boy."
  },
  {
    "id": "ENG287",
    "topic": "Active and Passive Voice",
    "question": "Choose the passive form of: They built the bridge last year.",
    "options": ["The bridge was built last year.", "The bridge built them last year.", "They were built by the bridge.", "The bridge has built them."],
    "answer": "The bridge was built last year."
  },
  {
    "id": "ENG288",
    "topic": "Active and Passive Voice",
    "question": "Choose the active form of: The letter was written by Mary.",
    "options": ["Mary wrote the letter.", "Mary writes the letter.", "Mary has written the letter.", "The letter wrote Mary."],
    "answer": "Mary wrote the letter."
  },
  {
    "id": "ENG289",
    "topic": "Active and Passive Voice",
    "question": "The food ____ by the chef yesterday.",
    "options": ["cooked", "was cooked", "is cooking", "has cook"],
    "answer": "was cooked"
  },
  {
    "id": "ENG290",
    "topic": "Active and Passive Voice",
    "question": "The students were praised by the principal. The active form is:",
    "options": ["The principal praised the students.", "The students praised the principal.", "The principal was praised by students.", "The students praise the principal."],
    "answer": "The principal praised the students."
  },

  {
    "id": "ENG291",
    "topic": "Reported Speech",
    "question": "Change to reported speech: John said, 'I am tired.'",
    "options": ["John said that I am tired.", "John said that he was tired.", "John says that he was tired.", "John said that he is tired."],
    "answer": "John said that he was tired."
  },
  {
    "id": "ENG292",
    "topic": "Reported Speech",
    "question": "Change to reported speech: Mary said, 'I have finished my work.'",
    "options": ["Mary said that she had finished her work.", "Mary said that I finished my work.", "Mary says she had finished my work.", "Mary said she finishes her work."],
    "answer": "Mary said that she had finished her work."
  },
  {
    "id": "ENG293",
    "topic": "Reported Speech",
    "question": "Change to reported speech: He said, 'I will come tomorrow.'",
    "options": ["He said that he would come the next day.", "He said that I will come tomorrow.", "He says that he would come tomorrow.", "He said that he came the next day."],
    "answer": "He said that he would come the next day."
  },
  {
    "id": "ENG294",
    "topic": "Reported Speech",
    "question": "Change to reported speech: She said, 'Do you know him?'",
    "options": ["She asked if I knew him.", "She said if I know him.", "She asked that I know him.", "She says whether I knew him."],
    "answer": "She asked if I knew him."
  },
  {
    "id": "ENG295",
    "topic": "Reported Speech",
    "question": "Change to reported speech: The teacher said, 'Work hard.'",
    "options": ["The teacher said that work hard.", "The teacher advised us to work hard.", "The teacher asked us working hard.", "The teacher says we worked hard."],
    "answer": "The teacher advised us to work hard."
  },

  {
    "id": "ENG296",
    "topic": "Cloze Test",
    "question": "The students were advised to ____ attention during the lecture.",
    "options": ["make", "pay", "give", "put"],
    "answer": "pay"
  },
  {
    "id": "ENG297",
    "topic": "Cloze Test",
    "question": "The manager asked the workers to ____ the instructions carefully.",
    "options": ["follow", "do", "make", "take"],
    "answer": "follow"
  },
  {
    "id": "ENG298",
    "topic": "Cloze Test",
    "question": "The driver was arrested for ____ the traffic rules.",
    "options": ["breaking", "opening", "cutting", "creating"],
    "answer": "breaking"
  },
  {
    "id": "ENG299",
    "topic": "Cloze Test",
    "question": "The child was punished because he ____ a lie.",
    "options": ["told", "said", "spoke", "talked"],
    "answer": "told"
  },
  {
    "id": "ENG300",
    "topic": "Cloze Test",
    "question": "The chairman called ____ the meeting because of the emergency.",
    "options": ["off", "up", "in", "out"],
    "answer": "off"
  },

  {
    "id": "ENG301",
    "topic": "Cloze Test",
    "question": "The doctor advised him to ____ smoking.",
    "options": ["give up", "give out", "give in", "give away"],
    "answer": "give up"
  },
  {
    "id": "ENG302",
    "topic": "Cloze Test",
    "question": "The company is looking ____ qualified applicants.",
    "options": ["after", "for", "at", "into"],
    "answer": "for"
  },
  {
    "id": "ENG303",
    "topic": "Cloze Test",
    "question": "The athlete trained hard in order to ____ the competition.",
    "options": ["win", "beat", "gain", "earn"],
    "answer": "win"
  },
  {
    "id": "ENG304",
    "topic": "Cloze Test",
    "question": "The teacher asked the student to ____ the mistake.",
    "options": ["correct", "repair", "mend", "construct"],
    "answer": "correct"
  },
  {
    "id": "ENG305",
    "topic": "Cloze Test",
    "question": "The police are trying to ____ the cause of the accident.",
    "options": ["find out", "find in", "find over", "find across"],
    "answer": "find out"
  },

  {
    "id": "ENG306",
    "topic": "Registers",
    "question": "In banking, money deposited into an account is called a",
    "options": ["Premium", "Deposit", "Dividend", "Tariff"],
    "answer": "Deposit"
  },
  {
    "id": "ENG307",
    "topic": "Registers",
    "question": "In medicine, a person who receives treatment is called a",
    "options": ["Defendant", "Patient", "Tenant", "Passenger"],
    "answer": "Patient"
  },
  {
    "id": "ENG308",
    "topic": "Registers",
    "question": "In law, a person accused of committing a crime is called a",
    "options": ["Defendant", "Patient", "Debtor", "Tenant"],
    "answer": "Defendant"
  },
  {
    "id": "ENG309",
    "topic": "Registers",
    "question": "In agriculture, the young plant produced from a seed is called a",
    "options": ["Seedling", "Calf", "Pup", "Chick"],
    "answer": "Seedling"
  },
  {
    "id": "ENG310",
    "topic": "Registers",
    "question": "In journalism, the title of a newspaper article is called a",
    "options": ["Headline", "Paragraph", "Footnote", "Caption"],
    "answer": "Headline"
  },
  {
    "id": "ENG311",
    "topic": "Registers",
    "question": "In aviation, the place where an aircraft lands is called a",
    "options": ["Runway", "Harbour", "Platform", "Garage"],
    "answer": "Runway"
  },
  {
    "id": "ENG312",
    "topic": "Registers",
    "question": "In football, a player who protects the goal is the",
    "options": ["Striker", "Goalkeeper", "Referee", "Winger"],
    "answer": "Goalkeeper"
  },
  {
    "id": "ENG313",
    "topic": "Registers",
    "question": "In the theatre, a person who directs a performance is the",
    "options": ["Director", "Spectator", "Audience", "Publisher"],
    "answer": "Director"
  },
  {
    "id": "ENG314",
    "topic": "Registers",
    "question": "In computing, a program designed to detect and remove malicious software is called",
    "options": ["Antivirus", "Compiler", "Browser", "Database"],
    "answer": "Antivirus"
  },
  {
    "id": "ENG315",
    "topic": "Registers",
    "question": "In economics, a sustained increase in the general price level is called",
    "options": ["Inflation", "Deflation", "Production", "Subsidy"],
    "answer": "Inflation"
  },

  {
    "id": "ENG316",
    "topic": "Oral English",
    "question": "Which word has the same vowel sound as 'seat'?",
    "options": ["Sit", "Beat", "Set", "Sat"],
    "answer": "Beat"
  },
  {
    "id": "ENG317",
    "topic": "Oral English",
    "question": "Which word has the same vowel sound as 'ship'?",
    "options": ["Sheep", "Sit", "Shape", "Shop"],
    "answer": "Sit"
  },
  {
    "id": "ENG318",
    "topic": "Oral English",
    "question": "Which word has the same vowel sound as 'food'?",
    "options": ["Good", "Mood", "Foot", "Blood"],
    "answer": "Mood"
  },
  {
    "id": "ENG319",
    "topic": "Oral English",
    "question": "Which word has the same vowel sound as 'cat'?",
    "options": ["Cut", "Cart", "Man", "Late"],
    "answer": "Man"
  },
  {
    "id": "ENG320",
    "topic": "Oral English",
    "question": "Which word has the same vowel sound as 'cup'?",
    "options": ["Cope", "Luck", "Look", "Cool"],
    "answer": "Luck"
  },
  {
    "id": "ENG321",
    "topic": "Oral English",
    "question": "Which word rhymes with 'light'?",
    "options": ["Late", "Fight", "Lot", "Let"],
    "answer": "Fight"
  },
  {
    "id": "ENG322",
    "topic": "Oral English",
    "question": "Which word rhymes with 'chair'?",
    "options": ["Cheer", "Share", "Sure", "Shore"],
    "answer": "Share"
  },
  {
    "id": "ENG323",
    "topic": "Oral English",
    "question": "Which word has a silent letter?",
    "options": ["Knee", "Cat", "Man", "Run"],
    "answer": "Knee"
  },
  {
    "id": "ENG324",
    "topic": "Oral English",
    "question": "Which word contains a silent 'b'?",
    "options": ["Comb", "Boat", "Baby", "Table"],
    "answer": "Comb"
  },
  {
    "id": "ENG325",
    "topic": "Oral English",
    "question": "Which word contains a silent 'k'?",
    "options": ["Know", "King", "Keep", "Kind"],
    "answer": "Know"
  },

  {
    "id": "ENG326",
    "topic": "Oral English",
    "question": "Which word contains the /ʃ/ sound?",
    "options": ["Ship", "Sip", "Zip", "Tip"],
    "answer": "Ship"
  },
  {
    "id": "ENG327",
    "topic": "Oral English",
    "question": "Which word begins with the /θ/ sound?",
    "options": ["Think", "Sink", "Drink", "Link"],
    "answer": "Think"
  },
  {
    "id": "ENG328",
    "topic": "Oral English",
    "question": "Which word begins with the /ð/ sound?",
    "options": ["Then", "Thin", "Tin", "Sin"],
    "answer": "Then"
  },
  {
    "id": "ENG329",
    "topic": "Oral English",
    "question": "Which word contains the /tʃ/ sound?",
    "options": ["Chair", "Share", "Measure", "Vision"],
    "answer": "Chair"
  },
  {
    "id": "ENG330",
    "topic": "Oral English",
    "question": "Which word contains the /dʒ/ sound?",
    "options": ["Judge", "Church", "Cheap", "Ship"],
    "answer": "Judge"
  },

  {
    "id": "ENG331",
    "topic": "Comprehension",
    "question": "A passage that explains how something works is mainly",
    "options": ["Narrative", "Expository", "Dramatic", "Poetic"],
    "answer": "Expository"
  },
  {
    "id": "ENG332",
    "topic": "Comprehension",
    "question": "The main idea of a passage refers to",
    "options": ["A minor detail", "The central point", "A quotation", "The title only"],
    "answer": "The central point"
  },
  {
    "id": "ENG333",
    "topic": "Comprehension",
    "question": "An inference is a conclusion that is",
    "options": ["Directly copied from the passage", "Drawn from available evidence", "Always false", "Unrelated to the passage"],
    "answer": "Drawn from available evidence"
  },
  {
    "id": "ENG334",
    "topic": "Comprehension",
    "question": "The tone of a passage refers to the writer's",
    "options": ["Attitude or feeling", "Number of paragraphs", "Handwriting", "Vocabulary size"],
    "answer": "Attitude or feeling"
  },
  {
    "id": "ENG335",
    "topic": "Comprehension",
    "question": "A writer who presents facts without showing personal feelings is likely to have a ____ tone.",
    "options": ["Objective", "Angry", "Sarcastic", "Hostile"],
    "answer": "Objective"
  },
  {
    "id": "ENG336",
    "topic": "Comprehension",
    "question": "The purpose of a persuasive passage is mainly to",
    "options": ["Entertain only", "Convince the reader", "Describe a place", "List names"],
    "answer": "Convince the reader"
  },
  {
    "id": "ENG337",
    "topic": "Comprehension",
    "question": "A passage that tells a story is mainly",
    "options": ["Narrative", "Expository", "Argumentative", "Technical"],
    "answer": "Narrative"
  },
  {
    "id": "ENG338",
    "topic": "Comprehension",
    "question": "A writer's attitude can often be identified from the",
    "options": ["Choice of words", "Number of pages only", "Font size", "Paper colour"],
    "answer": "Choice of words"
  },
  {
    "id": "ENG339",
    "topic": "Comprehension",
    "question": "A statement that can be proved true or false is a",
    "options": ["Fact", "Feeling", "Prediction", "Opinion"],
    "answer": "Fact"
  },
  {
    "id": "ENG340",
    "topic": "Comprehension",
    "question": "A personal belief or judgement expressed by a writer is an",
    "options": ["Fact", "Opinion", "Instruction", "Example"],
    "answer": "Opinion"
  },

  {
    "id": "ENG341",
    "topic": "Vocabulary",
    "question": "A person who cannot read or write is",
    "options": ["Illiterate", "Immigrant", "Innocent", "Inexperienced"],
    "answer": "Illiterate"
  },
  {
    "id": "ENG342",
    "topic": "Vocabulary",
    "question": "A person who loves mankind is called a",
    "options": ["Misanthrope", "Philanthropist", "Pessimist", "Misogynist"],
    "answer": "Philanthropist"
  },
  {
    "id": "ENG343",
    "topic": "Vocabulary",
    "question": "A person who hates mankind is called a",
    "options": ["Misanthrope", "Philanthropist", "Patriot", "Optimist"],
    "answer": "Misanthrope"
  },
  {
    "id": "ENG344",
    "topic": "Vocabulary",
    "question": "A person who loves books is called a",
    "options": ["Bibliophile", "Biologist", "Geologist", "Philanthropist"],
    "answer": "Bibliophile"
  },
  {
    "id": "ENG345",
    "topic": "Vocabulary",
    "question": "A person who speaks two languages fluently is",
    "options": ["Monolingual", "Bilingual", "Illiterate", "Anonymous"],
    "answer": "Bilingual"
  },
  {
    "id": "ENG346",
    "topic": "Vocabulary",
    "question": "A person who studies stars and planets is an",
    "options": ["Astrologer", "Astronomer", "Archaeologist", "Anatomist"],
    "answer": "Astronomer"
  },
  {
    "id": "ENG347",
    "topic": "Vocabulary",
    "question": "A person who designs buildings is an",
    "options": ["Architect", "Accountant", "Agronomist", "Artist"],
    "answer": "Architect"
  },
  {
    "id": "ENG348",
    "topic": "Vocabulary",
    "question": "A place where aircraft are kept and maintained is a",
    "options": ["Hangar", "Harbour", "Hostel", "Warehouse"],
    "answer": "Hangar"
  },
  {
    "id": "ENG349",
    "topic": "Vocabulary",
    "question": "A person who is unable to pay debts is described as",
    "options": ["Insolvent", "Affluent", "Generous", "Credible"],
    "answer": "Insolvent"
  },
  {
    "id": "ENG350",
    "topic": "Vocabulary",
    "question": "A speech made without preparation is called",
    "options": ["Extempore", "Memorandum", "Dialogue", "Debate"],
    "answer": "Extempore"
  },

  {
    "id": "ENG351",
    "topic": "Sentence Completion",
    "question": "If you had informed me earlier, I ____ you.",
    "options": ["will help", "would help", "would have helped", "helped"],
    "answer": "would have helped"
  },
  {
    "id": "ENG352",
    "topic": "Sentence Completion",
    "question": "She would rather ____ at home than go out.",
    "options": ["stays", "stayed", "stay", "staying"],
    "answer": "stay"
  },
  {
    "id": "ENG353",
    "topic": "Sentence Completion",
    "question": "It is high time you ____ your studies seriously.",
    "options": ["take", "took", "will take", "have taken"],
    "answer": "took"
  },
  {
    "id": "ENG354",
    "topic": "Sentence Completion",
    "question": "No sooner had the bell rung ____ the students left the class.",
    "options": ["when", "than", "then", "and"],
    "answer": "than"
  },
  {
    "id": "ENG355",
    "topic": "Sentence Completion",
    "question": "Hardly had he arrived ____ it began to rain.",
    "options": ["than", "when", "and", "then"],
    "answer": "when"
  },
  {
    "id": "ENG356",
    "topic": "Sentence Completion",
    "question": "The teacher insisted that every student ____ present.",
    "options": ["is", "was", "be", "being"],
    "answer": "be"
  },
  {
    "id": "ENG357",
    "topic": "Sentence Completion",
    "question": "I prefer tea ____ coffee.",
    "options": ["than", "to", "from", "over than"],
    "answer": "to"
  },
  {
    "id": "ENG358",
    "topic": "Sentence Completion",
    "question": "He is senior ____ me in the organization.",
    "options": ["than", "to", "from", "with"],
    "answer": "to"
  },
  {
    "id": "ENG359",
    "topic": "Sentence Completion",
    "question": "The book is worth ____.",
    "options": ["to read", "reading", "read", "to be read"],
    "answer": "reading"
  },
  {
    "id": "ENG360",
    "topic": "Sentence Completion",
    "question": "She is accustomed to ____ early.",
    "options": ["wake", "waking", "woke", "wakes"],
    "answer": "waking"
  },

  {
    "id": "ENG361",
    "topic": "Punctuation",
    "question": "Which sentence is correctly punctuated?",
    "options": ["John said, 'I am ready.'", "John said 'I am ready'.", "John said I am ready.", "John, said 'I am ready'."],
    "answer": "John said, 'I am ready.'"
  },
  {
    "id": "ENG362",
    "topic": "Punctuation",
    "question": "Which punctuation mark is used to show possession?",
    "options": ["Comma", "Apostrophe", "Colon", "Semicolon"],
    "answer": "Apostrophe"
  },
  {
    "id": "ENG363",
    "topic": "Punctuation",
    "question": "Which punctuation mark is normally used at the end of a direct question?",
    "options": ["Full stop", "Question mark", "Comma", "Colon"],
    "answer": "Question mark"
  },
  {
    "id": "ENG364",
    "topic": "Punctuation",
    "question": "Which punctuation mark is used to separate items in a list?",
    "options": ["Comma", "Apostrophe", "Question mark", "Hyphen"],
    "answer": "Comma"
  },
  {
    "id": "ENG365",
    "topic": "Punctuation",
    "question": "Which sentence is correctly punctuated?",
    "options": ["However I decided to stay.", "However, I decided to stay.", "However I, decided to stay.", "However; I decided to stay."],
    "answer": "However, I decided to stay."
  },

  {
    "id": "ENG366",
    "topic": "Word Formation",
    "question": "The noun form of 'decide' is",
    "options": ["Decision", "Deciding", "Decisive", "Decided"],
    "answer": "Decision"
  },
  {
    "id": "ENG367",
    "topic": "Word Formation",
    "question": "The adjective form of 'beauty' is",
    "options": ["Beautiful", "Beautify", "Beautifully", "Beautician"],
    "answer": "Beautiful"
  },
  {
    "id": "ENG368",
    "topic": "Word Formation",
    "question": "The noun form of 'strong' is",
    "options": ["Strength", "Strongly", "Strengthen", "Stronger"],
    "answer": "Strength"
  },
  {
    "id": "ENG369",
    "topic": "Word Formation",
    "question": "The adverb form of 'careful' is",
    "options": ["Care", "Carefully", "Caring", "Careless"],
    "answer": "Carefully"
  },
  {
    "id": "ENG370",
    "topic": "Word Formation",
    "question": "The adjective form of 'danger' is",
    "options": ["Dangerously", "Dangerous", "Endanger", "Danger"],
    "answer": "Dangerous"
  },

  {
    "id": "ENG371",
    "topic": "Vocabulary in Context",
    "question": "The word 'draft' in 'The committee prepared a draft of the report' means",
    "options": ["A final copy", "A preliminary version", "A drawing", "A payment"],
    "answer": "A preliminary version"
  },
  {
    "id": "ENG372",
    "topic": "Vocabulary in Context",
    "question": "The word 'issue' in 'The government addressed the issue' means",
    "options": ["Problem or matter", "Newspaper only", "Money", "Departure"],
    "answer": "Problem or matter"
  },
  {
    "id": "ENG373",
    "topic": "Vocabulary in Context",
    "question": "The word 'capital' in 'Abuja is the capital of Nigeria' means",
    "options": ["Money", "Principal city", "Building", "Letter"],
    "answer": "Principal city"
  },
  {
    "id": "ENG374",
    "topic": "Vocabulary in Context",
    "question": "The word 'novel' in 'She bought a new novel' means",
    "options": ["Newspaper", "Long fictional book", "Poem", "Dictionary"],
    "answer": "Long fictional book"
  },
  {
    "id": "ENG375",
    "topic": "Vocabulary in Context",
    "question": "The word 'fair' in 'The judge gave a fair decision' means",
    "options": ["Beautiful", "Just", "Light-coloured", "Large"],
    "answer": "Just"
  },

  {
    "id": "ENG376",
    "topic": "Literary Devices",
    "question": "The expression 'The wind whispered through the trees' contains",
    "options": ["Personification", "Irony", "Hyperbole", "Oxymoron"],
    "answer": "Personification"
  },
  {
    "id": "ENG377",
    "topic": "Literary Devices",
    "question": "The expression 'as brave as a lion' is an example of",
    "options": ["Metaphor", "Simile", "Irony", "Pun"],
    "answer": "Simile"
  },
  {
    "id": "ENG378",
    "topic": "Literary Devices",
    "question": "The statement 'He is a lion on the battlefield' is an example of",
    "options": ["Simile", "Metaphor", "Alliteration", "Irony"],
    "answer": "Metaphor"
  },
  {
    "id": "ENG379",
    "topic": "Literary Devices",
    "question": "The repetition of initial consonant sounds in nearby words is called",
    "options": ["Alliteration", "Assonance", "Irony", "Personification"],
    "answer": "Alliteration"
  },
  {
    "id": "ENG380",
    "topic": "Literary Devices",
    "question": "Exaggeration used for emphasis is called",
    "options": ["Hyperbole", "Euphemism", "Pun", "Metonymy"],
    "answer": "Hyperbole"
  },

  {
    "id": "ENG381",
    "topic": "Oral English",
    "question": "Which word has a different vowel sound from the others?",
    "options": ["Seat", "Beat", "Meat", "Sit"],
    "answer": "Sit"
  },
  {
    "id": "ENG382",
    "topic": "Oral English",
    "question": "Which word has a different vowel sound from the others?",
    "options": ["Pool", "Food", "Good", "Moon"],
    "answer": "Good"
  },
  {
    "id": "ENG383",
    "topic": "Oral English",
    "question": "Which word has a different vowel sound from the others?",
    "options": ["Cut", "Luck", "Put", "Cup"],
    "answer": "Put"
  },
  {
    "id": "ENG384",
    "topic": "Oral English",
    "question": "Which word has a different consonant sound from the others?",
    "options": ["Chair", "Church", "Cheap", "Share"],
    "answer": "Share"
  },
  {
    "id": "ENG385",
    "topic": "Oral English",
    "question": "Which word begins with the same consonant sound as 'phone'?",
    "options": ["Fan", "Van", "Pan", "Ban"],
    "answer": "Fan"
  },
  {
    "id": "ENG386",
    "topic": "Oral English",
    "question": "Which word begins with the same consonant sound as 'judge'?",
    "options": ["Jam", "Sham", "Yam", "Chair"],
    "answer": "Jam"
  },
  {
    "id": "ENG387",
    "topic": "Oral English",
    "question": "Which word ends with the same consonant sound as 'laugh'?",
    "options": ["Cough", "Love", "Leave", "Bag"],
    "answer": "Cough"
  },
  {
    "id": "ENG388",
    "topic": "Oral English",
    "question": "Which word has the stress on the second syllable?",
    "options": ["TAble", "PREsent", "beGIN", "WINdow"],
    "answer": "beGIN"
  },
  {
    "id": "ENG389",
    "topic": "Oral English",
    "question": "Which word has the stress on the first syllable?",
    "options": ["beGIN", "reLAX", "TAble", "aRRIVE"],
    "answer": "TAble"
  },
  {
    "id": "ENG390",
    "topic": "Oral English",
    "question": "Which word has the same final sound as 'bags'?",
    "options": ["Books", "Dogs", "Cups", "Laughs"],
    "answer": "Dogs"
  },

  {
    "id": "ENG391",
    "topic": "Sentence Correction",
    "question": "Choose the correctly written sentence.",
    "options": ["She don't like rice.", "She doesn't likes rice.", "She doesn't like rice.", "She don't likes rice."],
    "answer": "She doesn't like rice."
  },
  {
    "id": "ENG392",
    "topic": "Sentence Correction",
    "question": "Choose the correctly written sentence.",
    "options": ["He have gone home.", "He has gone home.", "He has went home.", "He having gone home."],
    "answer": "He has gone home."
  },
  {
    "id": "ENG393",
    "topic": "Sentence Correction",
    "question": "Choose the correctly written sentence.",
    "options": ["Neither of the boys are ready.", "Neither of the boys is ready.", "Neither of the boys were ready.", "Neither boys is ready."],
    "answer": "Neither of the boys is ready."
  },
  {
    "id": "ENG394",
    "topic": "Sentence Correction",
    "question": "Choose the correctly written sentence.",
    "options": ["She is more taller than me.", "She is taller than me.", "She is most taller than me.", "She is tallest than me."],
    "answer": "She is taller than me."
  },
  {
    "id": "ENG395",
    "topic": "Sentence Correction",
    "question": "Choose the correctly written sentence.",
    "options": ["I have seen him yesterday.", "I saw him yesterday.", "I had see him yesterday.", "I seeing him yesterday."],
    "answer": "I saw him yesterday."
  },

  {
    "id": "ENG396",
    "topic": "Vocabulary",
    "question": "A person who deliberately sets fire to property is an",
    "options": ["Arsonist", "Alchemist", "Artist", "Activist"],
    "answer": "Arsonist"
  },
  {
    "id": "ENG397",
    "topic": "Vocabulary",
    "question": "A person who travels from one place to another for pleasure is a",
    "options": ["Tourist", "Tenant", "Trader", "Refugee"],
    "answer": "Tourist"
  },
  {
    "id": "ENG398",
    "topic": "Vocabulary",
    "question": "A person who has fled his country because of danger or persecution is a",
    "options": ["Refugee", "Tourist", "Citizen", "Tenant"],
    "answer": "Refugee"
  },
  {
    "id": "ENG399",
    "topic": "Vocabulary",
    "question": "A person who cannot be corrected or improved despite advice may be described as",
    "options": ["Incorrigible", "Flexible", "Generous", "Credible"],
    "answer": "Incorrigible"
  },
  {
    "id": "ENG400",
    "topic": "Vocabulary",
    "question": "A person who deliberately avoids society and prefers to live alone is a",
    "options": ["Recluse", "Patriot", "Diplomat", "Tourist"],
    "answer": "Recluse"
  }

    ],

    "Biology":[
  {"id":"BIO001","topic":"Cell Biology","question":"Which organelle is known as the 'powerhouse of the cell'?","options":["Mitochondrion","Nucleus","Ribosome","Golgi body"],"answer":"Mitochondrion"},
{"id":"BIO002","topic":"Classification","question":"The basic unit of classification in living organisms is the ____.","options":["Species","Genus","Family","Kingdom"],"answer":"Species"},
{"id":"BIO003","topic":"Ecology","question":"The flow of energy in an ecosystem is ____.","options":["Unidirectional","Cyclic","Bidirectional","Random"],"answer":"Unidirectional"},
{"id":"BIO004","topic":"Genetics","question":"A cross between a homozygous tall plant and a homozygous short plant produces offspring that are all ____.","options":["Tall (heterozygous)","Short","Half tall, half short","Sterile"],"answer":"Tall (heterozygous)"},
{"id":"BIO005","topic":"Nutrition","question":"Which vitamin deficiency causes scurvy?","options":["Vitamin C","Vitamin A","Vitamin D","Vitamin K"],"answer":"Vitamin C"},
{"id":"BIO006","topic":"Reproduction in Plants","question":"The transfer of pollen from the anther to the stigma of the same flower is called ____.","options":["Self-pollination","Cross-pollination","Fertilization","Germination"],"answer":"Self-pollination"},
{"id":"BIO007","topic":"Cell Biology","question":"The structure that controls the entry and exit of substances in a cell is the ____.","options":["Cell membrane","Cell wall","Nucleus","Vacuole"],"answer":"Cell membrane"},
{"id":"BIO008","topic":"Respiration","question":"The process by which glucose is broken down without oxygen is called ____.","options":["Anaerobic respiration","Aerobic respiration","Photosynthesis","Transpiration"],"answer":"Anaerobic respiration"},
{"id":"BIO009","topic":"Ecology","question":"Organisms that make their own food are called ____.","options":["Autotrophs","Heterotrophs","Decomposers","Saprophytes"],"answer":"Autotrophs"},
{"id":"BIO010","topic":"Human Anatomy - Digestive System","question":"Bile is produced by the ____.","options":["Liver","Pancreas","Gall bladder","Stomach"],"answer":"Liver"},
{"id":"BIO011","topic":"Classification","question":"Which of the following is a characteristic of the kingdom Fungi?","options":["Cell walls made of chitin","Photosynthetic","Motile","Prokaryotic"],"answer":"Cell walls made of chitin"},
{"id":"BIO012","topic":"Genetics","question":"The physical appearance of an organism is called its ____.","options":["Phenotype","Genotype","Genome","Allele"],"answer":"Phenotype"},
{"id":"BIO013","topic":"Cell Biology","question":"Which of these is found only in plant cells and not animal cells?","options":["Cell wall","Nucleus","Mitochondria","Cytoplasm"],"answer":"Cell wall"},
{"id":"BIO014","topic":"Ecology","question":"A community of organisms interacting with their physical environment is called a(n) ____.","options":["Ecosystem","Population","Habitat","Biome"],"answer":"Ecosystem"},
{"id":"BIO015","topic":"Human Anatomy - Circulatory System","question":"The chamber of the heart that pumps blood to the lungs is the ____.","options":["Right ventricle","Left ventricle","Right atrium","Left atrium"],"answer":"Right ventricle"},
{"id":"BIO016","topic":"Reproduction in Animals","question":"In mammals, fertilization occurs in the ____.","options":["Fallopian tube","Uterus","Ovary","Vagina"],"answer":"Fallopian tube"},
{"id":"BIO017","topic":"Nutrition","question":"Which of the following is a source of protein?","options":["Beans","Rice","Yam","Sugar cane"],"answer":"Beans"},
{"id":"BIO018","topic":"Cell Biology","question":"Which process describes the movement of water from a region of high concentration to low concentration through a semi-permeable membrane?","options":["Osmosis","Diffusion","Active transport","Plasmolysis"],"answer":"Osmosis"},
{"id":"BIO019","topic":"Genetics","question":"Genes are located on structures called ____.","options":["Chromosomes","Ribosomes","Mitochondria","Vacuoles"],"answer":"Chromosomes"},
{"id":"BIO020","topic":"Classification","question":"Which taxonomic group is more inclusive: Family or Order?","options":["Order","Family","They are equal","Species"],"answer":"Order"},
{"id":"BIO021","topic":"Ecology","question":"Organisms that break down dead organic matter are called ____.","options":["Decomposers","Producers","Consumers","Predators"],"answer":"Decomposers"},
{"id":"BIO022","topic":"Human Anatomy - Respiratory System","question":"Gaseous exchange in humans takes place in the ____.","options":["Alveoli","Bronchi","Trachea","Larynx"],"answer":"Alveoli"},
{"id":"BIO023","topic":"Plant Physiology","question":"The green pigment in plants responsible for photosynthesis is ____.","options":["Chlorophyll","Chitin","Cellulose","Xylem"],"answer":"Chlorophyll"},
{"id":"BIO024","topic":"Reproduction in Plants","question":"The male reproductive part of a flower is the ____.","options":["Stamen","Pistil","Sepal","Petal"],"answer":"Stamen"},
{"id":"BIO025","topic":"Nutrition","question":"Kwashiorkor is a disease caused by deficiency of ____.","options":["Protein","Vitamin C","Iron","Calcium"],"answer":"Protein"},
{"id":"BIO026","topic":"Cell Biology","question":"Ribosomes are responsible for ____.","options":["Protein synthesis","Energy production","Waste storage","Cell division"],"answer":"Protein synthesis"},
{"id":"BIO027","topic":"Genetics","question":"An organism with two identical alleles for a trait is said to be ____.","options":["Homozygous","Heterozygous","Hybrid","Recessive"],"answer":"Homozygous"},
{"id":"BIO028","topic":"Ecology","question":"The relationship where one organism benefits and the other is harmed is called ____.","options":["Parasitism","Mutualism","Commensalism","Competition"],"answer":"Parasitism"},
{"id":"BIO029","topic":"Human Anatomy - Nervous System","question":"The basic functional unit of the nervous system is the ____.","options":["Neuron","Nephron","Axon","Synapse"],"answer":"Neuron"},
{"id":"BIO030","topic":"Classification","question":"Which of the following organisms belongs to the kingdom Protista?","options":["Amoeba","Mushroom","Mould","Bacteria"],"answer":"Amoeba"},
{"id":"BIO031","topic":"Plant Physiology","question":"Water and mineral salts are transported in plants through the ____.","options":["Xylem","Phloem","Stomata","Cambium"],"answer":"Xylem"},
{"id":"BIO032","topic":"Reproduction in Animals","question":"Animals that lay eggs are called ____.","options":["Oviparous","Viviparous","Ovoviviparous","Asexual"],"answer":"Oviparous"},
{"id":"BIO033","topic":"Nutrition","question":"Which enzyme breaks down starch into simple sugars in the mouth?","options":["Amylase","Pepsin","Lipase","Trypsin"],"answer":"Amylase"},
{"id":"BIO034","topic":"Cell Biology","question":"The jelly-like substance in a cell where organelles are suspended is called ____.","options":["Cytoplasm","Nucleoplasm","Vacuole","Cell sap"],"answer":"Cytoplasm"},
{"id":"BIO035","topic":"Ecology","question":"A group of the same species living in the same area at the same time is called a ____.","options":["Population","Community","Ecosystem","Habitat"],"answer":"Population"},
{"id":"BIO036","topic":"Human Anatomy - Excretory System","question":"The functional unit of the kidney is the ____.","options":["Nephron","Neuron","Alveolus","Villus"],"answer":"Nephron"},
{"id":"BIO037","topic":"Genetics","question":"Which scientist is known as the father of genetics?","options":["Gregor Mendel","Charles Darwin","Louis Pasteur","Robert Hooke"],"answer":"Gregor Mendel"},
{"id":"BIO038","topic":"Classification","question":"Viruses are generally considered ____.","options":["Non-living outside a host cell","Fully living organisms","Autotrophic","Multicellular"],"answer":"Non-living outside a host cell"},
{"id":"BIO039","topic":"Plant Physiology","question":"The loss of water vapour from the leaves of plants is called ____.","options":["Transpiration","Respiration","Photosynthesis","Guttation"],"answer":"Transpiration"},
{"id":"BIO040","topic":"Nutrition","question":"Lack of Vitamin D in the diet leads to ____.","options":["Rickets","Scurvy","Anaemia","Goitre"],"answer":"Rickets"},
{"id":"BIO041","topic":"Cell Biology","question":"Which organelle is responsible for packaging and modifying proteins?","options":["Golgi apparatus","Mitochondria","Lysosome","Nucleolus"],"answer":"Golgi apparatus"},
{"id":"BIO042","topic":"Ecology","question":"The largest ecological unit is the ____.","options":["Biosphere","Ecosystem","Biome","Community"],"answer":"Biosphere"},
{"id":"BIO043","topic":"Human Anatomy - Skeletal System","question":"The longest bone in the human body is the ____.","options":["Femur","Tibia","Humerus","Fibula"],"answer":"Femur"},
{"id":"BIO044","topic":"Reproduction in Plants","question":"The process by which a seed develops into a new plant is called ____.","options":["Germination","Pollination","Fertilization","Transpiration"],"answer":"Germination"},
{"id":"BIO045","topic":"Genetics","question":"A gene that expresses itself only when two copies are present is called ____.","options":["Recessive","Dominant","Codominant","Linked"],"answer":"Recessive"},
{"id":"BIO046","topic":"Classification","question":"Which of the following is a characteristic feature of the kingdom Monera?","options":["Prokaryotic cells","Eukaryotic cells","Multicellular bodies","Presence of chlorophyll only"],"answer":"Prokaryotic cells"},
{"id":"BIO047","topic":"Plant Physiology","question":"Small pores on the leaf surface for gaseous exchange are called ____.","options":["Stomata","Lenticels","Guard cells","Cuticles"],"answer":"Stomata"},
{"id":"BIO048","topic":"Nutrition","question":"Which of the following food substances provides the most energy per gram?","options":["Fat","Protein","Carbohydrate","Vitamin"],"answer":"Fat"},
{"id":"BIO049","topic":"Cell Biology","question":"The control centre of the cell that contains genetic material is the ____.","options":["Nucleus","Cytoplasm","Ribosome","Vacuole"],"answer":"Nucleus"},
{"id":"BIO050","topic":"Ecology","question":"A relationship in which both organisms benefit is called ____.","options":["Mutualism","Parasitism","Commensalism","Predation"],"answer":"Mutualism"},
{"id":"BIO051","topic":"Human Anatomy - Circulatory System","question":"Which blood vessels carry blood away from the heart?","options":["Arteries","Veins","Capillaries","Venules"],"answer":"Arteries"},
{"id":"BIO052","topic":"Reproduction in Animals","question":"The process of external fertilization is common in ____.","options":["Fish","Mammals","Birds","Reptiles"],"answer":"Fish"},
{"id":"BIO053","topic":"Genetics","question":"The alternative forms of a gene are called ____.","options":["Alleles","Chromosomes","Genotypes","Phenotypes"],"answer":"Alleles"},
{"id":"BIO054","topic":"Classification","question":"Ferns belong to which plant division?","options":["Pteridophyta","Bryophyta","Spermatophyta","Thallophyta"],"answer":"Pteridophyta"},
{"id":"BIO055","topic":"Plant Physiology","question":"Photosynthesis mainly takes place in the ____.","options":["Leaf","Root","Stem","Flower"],"answer":"Leaf"},
{"id":"BIO056","topic":"Nutrition","question":"Anaemia is commonly caused by deficiency of ____.","options":["Iron","Calcium","Vitamin C","Iodine"],"answer":"Iron"},
{"id":"BIO057","topic":"Cell Biology","question":"Which structure stores water, food and waste products in plant cells?","options":["Vacuole","Nucleus","Ribosome","Mitochondrion"],"answer":"Vacuole"},
{"id":"BIO058","topic":"Ecology","question":"The struggle between organisms for the same limited resource is called ____.","options":["Competition","Predation","Symbiosis","Commensalism"],"answer":"Competition"},
{"id":"BIO059","topic":"Human Anatomy - Digestive System","question":"Protein digestion begins in the ____.","options":["Stomach","Mouth","Small intestine","Large intestine"],"answer":"Stomach"},
{"id":"BIO060","topic":"Reproduction in Plants","question":"Pollination carried out by insects is called ____.","options":["Entomophily","Anemophily","Hydrophily","Ornithophily"],"answer":"Entomophily"},
{"id":"BIO061","topic":"Genetics","question":"A cross involving one pair of contrasting characters is called a ____.","options":["Monohybrid cross","Dihybrid cross","Test cross","Back cross"],"answer":"Monohybrid cross"},
{"id":"BIO062","topic":"Classification","question":"Which of the following is NOT a vertebrate class?","options":["Insecta","Mammalia","Aves","Pisces"],"answer":"Insecta"},
{"id":"BIO063","topic":"Plant Physiology","question":"The upward movement of water in plants is largely due to ____.","options":["Transpiration pull","Root pressure only","Osmosis only","Gravity"],"answer":"Transpiration pull"},
{"id":"BIO064","topic":"Nutrition","question":"A balanced diet must contain all of the following EXCEPT ____.","options":["Only carbohydrates","Proteins","Fats","Vitamins"],"answer":"Only carbohydrates"},
{"id":"BIO065","topic":"Cell Biology","question":"Which of these processes requires energy (ATP)?","options":["Active transport","Diffusion","Osmosis","Filtration"],"answer":"Active transport"},
{"id":"BIO066","topic":"Ecology","question":"Which of the following is an abiotic factor in an ecosystem?","options":["Temperature","Predators","Competitors","Parasites"],"answer":"Temperature"},
{"id":"BIO067","topic":"Human Anatomy - Respiratory System","question":"The muscle that separates the thoracic cavity from the abdominal cavity is the ____.","options":["Diaphragm","Trachea","Larynx","Pleura"],"answer":"Diaphragm"},
{"id":"BIO068","topic":"Reproduction in Animals","question":"The development of an unfertilized egg into a new organism is called ____.","options":["Parthenogenesis","Fertilization","Fission","Budding"],"answer":"Parthenogenesis"},
{"id":"BIO069","topic":"Genetics","question":"The ratio of phenotypes in a typical monohybrid cross (F2) is ____.","options":["3:1","1:1","9:3:3:1","1:2:1"],"answer":"3:1"},
{"id":"BIO070","topic":"Classification","question":"The scientific naming system using two names (genus and species) is called ____.","options":["Binomial nomenclature","Taxonomy","Phylogeny","Cladistics"],"answer":"Binomial nomenclature"},
{"id":"BIO071","topic":"Plant Physiology","question":"Which factor is NOT required for photosynthesis?","options":["Oxygen","Sunlight","Water","Carbon dioxide"],"answer":"Oxygen"},
{"id":"BIO072","topic":"Nutrition","question":"Which vitamin is important for blood clotting?","options":["Vitamin K","Vitamin A","Vitamin C","Vitamin E"],"answer":"Vitamin K"},
{"id":"BIO073","topic":"Cell Biology","question":"The cell theory states that all living things are made up of ____.","options":["Cells","Tissues only","Organs only","Molecules only"],"answer":"Cells"},
{"id":"BIO074","topic":"Ecology","question":"The process by which nitrogen gas is converted into usable forms by bacteria is called ____.","options":["Nitrogen fixation","Denitrification","Nitrification","Ammonification"],"answer":"Nitrogen fixation"},
{"id":"BIO075","topic":"Human Anatomy - Nervous System","question":"The part of the brain responsible for balance and coordination is the ____.","options":["Cerebellum","Cerebrum","Medulla oblongata","Hypothalamus"],"answer":"Cerebellum"},
{"id":"BIO076","topic":"Reproduction in Plants","question":"The female reproductive part of a flower is the ____.","options":["Pistil","Stamen","Anther","Filament"],"answer":"Pistil"},
{"id":"BIO077","topic":"Genetics","question":"Down syndrome in humans is caused by ____.","options":["An extra chromosome 21","A missing chromosome","A gene mutation only","A viral infection"],"answer":"An extra chromosome 21"},
{"id":"BIO078","topic":"Classification","question":"Which group of animals is characterized by having a backbone?","options":["Vertebrates","Invertebrates","Arthropods","Molluscs"],"answer":"Vertebrates"},
{"id":"BIO079","topic":"Plant Physiology","question":"Root hairs increase the surface area for ____.","options":["Water absorption","Photosynthesis","Respiration","Reproduction"],"answer":"Water absorption"},
{"id":"BIO080","topic":"Nutrition","question":"Goitre is caused by deficiency of ____.","options":["Iodine","Iron","Calcium","Zinc"],"answer":"Iodine"},
{"id":"BIO081","topic":"Cell Biology","question":"Which of these is a unicellular organism?","options":["Amoeba","Human","Frog","Mushroom"],"answer":"Amoeba"},
{"id":"BIO082","topic":"Ecology","question":"A food web is made up of interconnected ____.","options":["Food chains","Populations","Habitats","Biomes"],"answer":"Food chains"},
{"id":"BIO083","topic":"Human Anatomy - Circulatory System","question":"Red blood cells transport ____ around the body.","options":["Oxygen","Carbon dioxide only","Nutrients only","Hormones only"],"answer":"Oxygen"},
{"id":"BIO084","topic":"Reproduction in Animals","question":"Which of these is an example of asexual reproduction?","options":["Binary fission","Sexual mating","External fertilization","Internal fertilization"],"answer":"Binary fission"},
{"id":"BIO085","topic":"Genetics","question":"Mutation refers to a ____ in the genetic material.","options":["Sudden change","Gradual growth","Fixed pattern","Normal process only"],"answer":"Sudden change"},
{"id":"BIO086","topic":"Classification","question":"Which of the following is a feature of Arthropoda?","options":["Jointed legs","No legs","Soft body without segments","Presence of notochord"],"answer":"Jointed legs"},
{"id":"BIO087","topic":"Plant Physiology","question":"Guard cells regulate the opening and closing of the ____.","options":["Stomata","Xylem","Phloem","Cuticle"],"answer":"Stomata"},
{"id":"BIO088","topic":"Nutrition","question":"Cellulose in the human diet mainly serves as ____.","options":["Roughage/fibre","A source of energy","A source of protein","A vitamin"],"answer":"Roughage/fibre"},
{"id":"BIO089","topic":"Cell Biology","question":"Which term describes cells that have a true nucleus?","options":["Eukaryotic","Prokaryotic","Autotrophic","Heterotrophic"],"answer":"Eukaryotic"},
{"id":"BIO090","topic":"Ecology","question":"Which of the following best defines a habitat?","options":["The natural home of an organism","A group of species","The food an organism eats","The climate of a region"],"answer":"The natural home of an organism"},
{"id":"BIO091","topic":"Human Anatomy - Excretory System","question":"Urine is temporarily stored in the ____.","options":["Bladder","Kidney","Ureter","Urethra"],"answer":"Bladder"},
{"id":"BIO092","topic":"Reproduction in Plants","question":"Vegetative propagation is a form of ____ reproduction.","options":["Asexual","Sexual","External","Internal"],"answer":"Asexual"},
{"id":"BIO093","topic":"Genetics","question":"In humans, sex is determined by the ____ chromosomes.","options":["X and Y","A and B","M and N","P and Q"],"answer":"X and Y"},
{"id":"BIO094","topic":"Classification","question":"Which kingdom includes organisms like moulds and yeast?","options":["Fungi","Plantae","Animalia","Monera"],"answer":"Fungi"},
{"id":"BIO095","topic":"Plant Physiology","question":"The tissue responsible for transporting manufactured food in plants is the ____.","options":["Phloem","Xylem","Cambium","Cortex"],"answer":"Phloem"},
{"id":"BIO096","topic":"Nutrition","question":"Which of these is a fat-soluble vitamin?","options":["Vitamin A","Vitamin C","Vitamin B1","Vitamin B12"],"answer":"Vitamin A"},
{"id":"BIO097","topic":"Cell Biology","question":"Lysosomes contain enzymes used mainly for ____.","options":["Digestion of cell waste","Energy production","Protein synthesis","Photosynthesis"],"answer":"Digestion of cell waste"},
{"id":"BIO098","topic":"Ecology","question":"Which trophic level do herbivores occupy?","options":["Primary consumers","Producers","Secondary consumers","Decomposers"],"answer":"Primary consumers"},
{"id":"BIO099","topic":"Human Anatomy - Skeletal System","question":"The joint found at the elbow is an example of a ____ joint.","options":["Hinge","Ball and socket","Pivot","Gliding"],"answer":"Hinge"},
{"id":"BIO100","topic":"Reproduction in Animals","question":"Animals that give birth to live young are called ____.","options":["Viviparous","Oviparous","Ovoviviparous","Asexual"],"answer":"Viviparous"},
{"id":"BIO101","topic":"Genetics","question":"A test cross is used to determine the ____ of an organism showing a dominant trait.","options":["Genotype","Phenotype","Mutation rate","Chromosome number"],"answer":"Genotype"},
{"id":"BIO102","topic":"Classification","question":"Mosses belong to which plant group?","options":["Bryophyta","Pteridophyta","Spermatophyta","Thallophyta"],"answer":"Bryophyta"},
{"id":"BIO103","topic":"Plant Physiology","question":"Which pigment absorbs light energy for photosynthesis?","options":["Chlorophyll","Haemoglobin","Melanin","Carotene only"],"answer":"Chlorophyll"},
{"id":"BIO104","topic":"Nutrition","question":"Which of these foods is a good source of carbohydrate?","options":["Rice","Fish","Beans","Groundnut"],"answer":"Rice"},
{"id":"BIO105","topic":"Cell Biology","question":"Plasmolysis occurs when a plant cell is placed in a ____ solution.","options":["Hypertonic","Hypotonic","Isotonic","Neutral"],"answer":"Hypertonic"},
{"id":"BIO106","topic":"Ecology","question":"Which of the following is a biotic factor?","options":["Predators","Rainfall","Temperature","Soil pH"],"answer":"Predators"},
{"id":"BIO107","topic":"Human Anatomy - Digestive System","question":"Absorption of digested food mainly occurs in the ____.","options":["Small intestine","Large intestine","Stomach","Oesophagus"],"answer":"Small intestine"},
{"id":"BIO108","topic":"Reproduction in Plants","question":"The fusion of male and female gametes in plants is called ____.","options":["Fertilization","Pollination","Germination","Dispersal"],"answer":"Fertilization"},
{"id":"BIO109","topic":"Genetics","question":"DNA stands for ____.","options":["Deoxyribonucleic acid","Deoxyribose nucleotide acid","Diribonucleic acid","Dioxyribonucleic acid"],"answer":"Deoxyribonucleic acid"},
{"id":"BIO110","topic":"Classification","question":"Which of the following is an example of an invertebrate?","options":["Earthworm","Frog","Lizard","Fish"],"answer":"Earthworm"},
{"id":"BIO111","topic":"Plant Physiology","question":"Which part of the plant anchors it to the soil and absorbs water?","options":["Root","Stem","Leaf","Flower"],"answer":"Root"},
{"id":"BIO112","topic":"Nutrition","question":"Marasmus results primarily from deficiency of ____.","options":["Overall calories and protein","Vitamin C only","Iron only","Iodine only"],"answer":"Overall calories and protein"},
{"id":"BIO113","topic":"Cell Biology","question":"Which of the following best describes diffusion?","options":["Movement of particles from high to low concentration","Movement of water only","Movement requiring energy","Movement against a concentration gradient"],"answer":"Movement of particles from high to low concentration"},
{"id":"BIO114","topic":"Ecology","question":"The continuous movement of water between the earth and atmosphere is called the ____.","options":["Water cycle","Carbon cycle","Nitrogen cycle","Oxygen cycle"],"answer":"Water cycle"},
{"id":"BIO115","topic":"Human Anatomy - Circulatory System","question":"Which blood vessel carries oxygenated blood from the lungs to the heart?","options":["Pulmonary vein","Pulmonary artery","Vena cava","Aorta"],"answer":"Pulmonary vein"},
{"id":"BIO116","topic":"Reproduction in Animals","question":"The process by which a single organism splits to form two is called ____.","options":["Binary fission","Budding","Sporulation","Regeneration"],"answer":"Binary fission"},
{"id":"BIO117","topic":"Genetics","question":"An organism's complete set of genetic material is called its ____.","options":["Genome","Genotype","Phenotype","Allele"],"answer":"Genome"},
{"id":"BIO118","topic":"Classification","question":"Which of the following is a distinguishing feature between plants and animals?","options":["Presence of cell wall in plants","Presence of nucleus in plants only","Presence of cytoplasm in plants only","Ability to move in plants"],"answer":"Presence of cell wall in plants"},
{"id":"BIO119","topic":"Plant Physiology","question":"Which gas is released as a by-product of photosynthesis?","options":["Oxygen","Carbon dioxide","Nitrogen","Hydrogen"],"answer":"Oxygen"},
{"id":"BIO120","topic":"Nutrition","question":"Which mineral is essential for strong bones and teeth?","options":["Calcium","Iron","Iodine","Sodium"],"answer":"Calcium"},
{"id":"BIO121","topic":"Cell Biology","question":"The cell wall in plants is mainly made of ____.","options":["Cellulose","Chitin","Protein","Lipid"],"answer":"Cellulose"},
{"id":"BIO122","topic":"Ecology","question":"An organism that feeds on both plants and animals is called a(n) ____.","options":["Omnivore","Herbivore","Carnivore","Decomposer"],"answer":"Omnivore"},
{"id":"BIO123","topic":"Human Anatomy - Nervous System","question":"The gap between two neurons is called the ____.","options":["Synapse","Axon","Dendrite","Node"],"answer":"Synapse"},
{"id":"BIO124","topic":"Reproduction in Plants","question":"Seeds dispersed by wind usually have ____.","options":["Wings or hairs","Hooks","Fleshy fruits","Heavy coats"],"answer":"Wings or hairs"},
{"id":"BIO125","topic":"Genetics","question":"Identical twins arise from ____.","options":["The splitting of a single fertilized egg","Two different fertilized eggs","Mutation only","Cross-fertilization"],"answer":"The splitting of a single fertilized egg"},
{"id":"BIO126","topic":"Classification","question":"Which of the following is a shared feature of all members of the plant kingdom?","options":["Cell wall made of cellulose","Ability to move","Heterotrophic nutrition","Absence of chlorophyll"],"answer":"Cell wall made of cellulose"},
{"id":"BIO127","topic":"Plant Physiology","question":"Auxins are examples of plant ____.","options":["Hormones","Enzymes","Vitamins","Pigments"],"answer":"Hormones"},
{"id":"BIO128","topic":"Nutrition","question":"A food test using Benedict's solution is used to detect the presence of ____.","options":["Reducing sugars","Protein","Starch","Fat"],"answer":"Reducing sugars"},
{"id":"BIO129","topic":"Cell Biology","question":"Which structure is responsible for cell division in animal cells?","options":["Centriole","Chloroplast","Cell wall","Vacuole"],"answer":"Centriole"},
{"id":"BIO130","topic":"Ecology","question":"Which of the following describes commensalism?","options":["One organism benefits, the other is unaffected","Both organisms benefit","One organism benefits, the other is harmed","Neither organism benefits"],"answer":"One organism benefits, the other is unaffected"},
{"id":"BIO131","topic":"Human Anatomy - Reproductive System","question":"Sperm cells are produced in the ____.","options":["Testes","Ovaries","Prostate gland","Epididymis"],"answer":"Testes"},
{"id":"BIO132","topic":"Reproduction in Animals","question":"Metamorphosis is best exemplified by the life cycle of a ____.","options":["Butterfly","Dog","Human","Cow"],"answer":"Butterfly"},
{"id":"BIO133","topic":"Genetics","question":"A dihybrid cross typically produces a phenotypic ratio of ____.","options":["9:3:3:1","3:1","1:1","1:2:1"],"answer":"9:3:3:1"},
{"id":"BIO134","topic":"Classification","question":"Which of the following animals is classified under Class Aves?","options":["Eagle","Frog","Snake","Fish"],"answer":"Eagle"},
{"id":"BIO135","topic":"Plant Physiology","question":"Which factor speeds up the rate of transpiration?","options":["High temperature","High humidity","Cloudy weather","Low wind speed"],"answer":"High temperature"},
{"id":"BIO136","topic":"Nutrition","question":"Which food test is used to detect the presence of starch?","options":["Iodine test","Biuret test","Benedict's test","Sudan III test"],"answer":"Iodine test"},
{"id":"BIO137","topic":"Cell Biology","question":"The process of cell division that produces gametes is called ____.","options":["Meiosis","Mitosis","Binary fission","Budding"],"answer":"Meiosis"},
{"id":"BIO138","topic":"Ecology","question":"Which cycle involves the process of photosynthesis and respiration?","options":["Carbon cycle","Nitrogen cycle","Water cycle","Phosphorus cycle"],"answer":"Carbon cycle"},
{"id":"BIO139","topic":"Human Anatomy - Skeletal System","question":"Which of the following is a function of the human skeleton?","options":["Support and protection","Digestion","Excretion","Respiration only"],"answer":"Support and protection"},
{"id":"BIO140","topic":"Reproduction in Plants","question":"A fruit develops from the ____.","options":["Ovary","Petal","Sepal","Anther"],"answer":"Ovary"},
{"id":"BIO141","topic":"Genetics","question":"Which of the following best describes a mutation?","options":["A change in the DNA sequence","A normal cell process","The result of pollination","A type of respiration"],"answer":"A change in the DNA sequence"},
{"id":"BIO142","topic":"Classification","question":"Which of these is NOT a class of vertebrates?","options":["Arachnida","Mammalia","Reptilia","Amphibia"],"answer":"Arachnida"},
{"id":"BIO143","topic":"Plant Physiology","question":"The exchange of gases in plants mainly occurs through ____.","options":["Stomata and lenticels","Roots only","Flowers only","Seeds only"],"answer":"Stomata and lenticels"},
{"id":"BIO144","topic":"Nutrition","question":"Which of the following diseases is linked to excessive intake of fat?","options":["Obesity","Scurvy","Rickets","Kwashiorkor"],"answer":"Obesity"},
{"id":"BIO145","topic":"Cell Biology","question":"The nucleolus within the nucleus is mainly involved in producing ____.","options":["Ribosomes","Lysosomes","Mitochondria","Chloroplasts"],"answer":"Ribosomes"},
{"id":"BIO146","topic":"Ecology","question":"Which of the following is an example of a decomposer?","options":["Bacteria","Lion","Eagle","Grass"],"answer":"Bacteria"},
{"id":"BIO147","topic":"Human Anatomy - Reproductive System","question":"The site of egg production and maturation in females is the ____.","options":["Ovary","Uterus","Fallopian tube","Vagina"],"answer":"Ovary"},
{"id":"BIO148","topic":"Reproduction in Animals","question":"Which structure protects and nourishes a developing chick inside an egg?","options":["Yolk","Shell","Albumen only","Air sac only"],"answer":"Yolk"},
{"id":"BIO149","topic":"Genetics","question":"Crossing over occurs during which stage of meiosis?","options":["Prophase I","Metaphase I","Anaphase I","Telophase I"],"answer":"Prophase I"},
{"id":"BIO150","topic":"Classification","question":"Which of the following belongs to the phylum Mollusca?","options":["Snail","Spider","Earthworm","Housefly"],"answer":"Snail"},
{"id":"BIO151","topic":"Plant Physiology","question":"Which condition would cause a plant to wilt?","options":["Excessive transpiration with insufficient water uptake","Excess water absorption","High humidity","Low temperature"],"answer":"Excessive transpiration with insufficient water uptake"},
{"id":"BIO152","topic":"Nutrition","question":"Which of the following best defines a balanced diet?","options":["A diet containing all nutrients in the right proportions","A diet containing only proteins","A diet containing only carbohydrates","A diet free of fats"],"answer":"A diet containing all nutrients in the right proportions"},
{"id":"BIO153","topic":"Cell Biology","question":"Which of the following is a function of the cell membrane?","options":["Selective permeability","Photosynthesis","Protein synthesis","Genetic storage"],"answer":"Selective permeability"},
{"id":"BIO154","topic":"Ecology","question":"Which of the following best describes a food chain?","options":["A sequence showing the flow of energy from one organism to another","A group of similar organisms","A single organism's diet","The total mass of organisms in an area"],"answer":"A sequence showing the flow of energy from one organism to another"},
{"id":"BIO155","topic":"Human Anatomy - Digestive System","question":"Which enzyme is responsible for the digestion of fats?","options":["Lipase","Amylase","Pepsin","Trypsin"],"answer":"Lipase"},
{"id":"BIO156","topic":"Reproduction in Plants","question":"Which of the following is an agent of pollination?","options":["Wind","Digestion","Respiration","Excretion"],"answer":"Wind"},
{"id":"BIO157","topic":"Genetics","question":"A person with blood group AB is considered a universal ____.","options":["Recipient","Donor","Carrier","Neutral type"],"answer":"Recipient"},
{"id":"BIO158","topic":"Classification","question":"Which of the following is a key feature distinguishing amphibians from reptiles?","options":["Amphibians have moist, permeable skin","Reptiles lay eggs in water","Amphibians have scales","Reptiles undergo metamorphosis"],"answer":"Amphibians have moist, permeable skin"},
{"id":"BIO159","topic":"Plant Physiology","question":"Which part of a seed provides food for the developing embryo?","options":["Cotyledon/endosperm","Testa","Radicle","Plumule"],"answer":"Cotyledon/endosperm"},
{"id":"BIO160","topic":"Nutrition","question":"Which of the following is classified as a micronutrient?","options":["Vitamins","Carbohydrates","Proteins","Fats"],"answer":"Vitamins"},
{"id":"BIO161","topic":"Cell Biology","question":"Which of the following organelles is involved in detoxification and lipid synthesis?","options":["Smooth endoplasmic reticulum","Rough endoplasmic reticulum","Golgi apparatus","Ribosome"],"answer":"Smooth endoplasmic reticulum"},
{"id":"BIO162","topic":"Ecology","question":"Which term describes the number of individuals of a species per unit area?","options":["Population density","Biomass","Biodiversity","Carrying capacity"],"answer":"Population density"},
{"id":"BIO163","topic":"Human Anatomy - Circulatory System","question":"Which component of blood is responsible for clotting?","options":["Platelets","Red blood cells","White blood cells","Plasma"],"answer":"Platelets"},
{"id":"BIO164","topic":"Reproduction in Animals","question":"The stage between egg and adult in insects with complete metamorphosis includes ____.","options":["Larva and pupa","Nymph only","Egg only","Adult only"],"answer":"Larva and pupa"},
{"id":"BIO165","topic":"Genetics","question":"Which term describes genes located close together on the same chromosome that tend to be inherited together?","options":["Linked genes","Alleles","Homologous genes","Recessive genes"],"answer":"Linked genes"},
{"id":"BIO166","topic":"Classification","question":"Which feature is used to classify insects within Arthropoda?","options":["Three pairs of legs","Four pairs of legs","No legs","Eight legs"],"answer":"Three pairs of legs"},
{"id":"BIO167","topic":"Plant Physiology","question":"Which hormone is responsible for fruit ripening in plants?","options":["Ethylene","Auxin","Gibberellin","Cytokinin"],"answer":"Ethylene"},
{"id":"BIO168","topic":"Nutrition","question":"Which of the following best explains why fibre is important in the diet?","options":["It aids digestion and prevents constipation","It provides energy","It builds muscle","It clots blood"],"answer":"It aids digestion and prevents constipation"},
{"id":"BIO169","topic":"Cell Biology","question":"Which of these best describes tissue?","options":["A group of similar cells performing the same function","A single cell","An organ","A whole organism"],"answer":"A group of similar cells performing the same function"},
{"id":"BIO170","topic":"Ecology","question":"Which of the following would most likely increase due to eutrophication of a water body?","options":["Algal bloom","Fish population","Oxygen levels","Water clarity"],"answer":"Algal bloom"},
{"id":"BIO171","topic":"Human Anatomy - Excretory System","question":"Which organ, besides the kidney, is involved in excretion?","options":["Skin","Heart","Stomach","Pancreas"],"answer":"Skin"},
{"id":"BIO172","topic":"Reproduction in Plants","question":"Which of the following is an example of vegetative propagation?","options":["Propagation by cuttings","Seed germination","Pollination","Fertilization"],"answer":"Propagation by cuttings"},
{"id":"BIO173","topic":"Genetics","question":"Which of the following genetic disorders is sex-linked?","options":["Haemophilia","Down syndrome","Albinism","Sickle cell anaemia"],"answer":"Haemophilia"},
{"id":"BIO174","topic":"Classification","question":"Which of the following is a shared characteristic of all Chordates?","options":["Presence of a notochord at some stage","Presence of a shell","Presence of jointed legs","Absence of a nervous system"],"answer":"Presence of a notochord at some stage"},
{"id":"BIO175","topic":"Plant Physiology","question":"Which structure in a seed develops into the shoot?","options":["Plumule","Radicle","Testa","Hilum"],"answer":"Plumule"},
{"id":"BIO176","topic":"Nutrition","question":"Which vitamin deficiency is associated with night blindness?","options":["Vitamin A","Vitamin B","Vitamin C","Vitamin D"],"answer":"Vitamin A"},
{"id":"BIO177","topic":"Cell Biology","question":"Which process describes the copying of DNA before cell division?","options":["Replication","Transcription","Translation","Mutation"],"answer":"Replication"},
{"id":"BIO178","topic":"Ecology","question":"Which of these best describes biodiversity?","options":["The variety of living organisms in an area","The total mass of a population","The number of ecosystems in a region","The climate of an area"],"answer":"The variety of living organisms in an area"},
{"id":"BIO179","topic":"Human Anatomy - Nervous System","question":"Which part of the brain controls voluntary muscle movement and higher mental functions?","options":["Cerebrum","Cerebellum","Medulla oblongata","Spinal cord"],"answer":"Cerebrum"},
{"id":"BIO180","topic":"Reproduction in Animals","question":"Which of the following best describes internal fertilization?","options":["Fusion of gametes inside the female body","Fusion of gametes in water","Fusion of gametes outside the body","Fusion without gametes"],"answer":"Fusion of gametes inside the female body"},
{"id":"BIO181","topic":"Genetics","question":"Which of the following is an example of continuous variation?","options":["Height in humans","Blood group","Sex","Eye colour in Drosophila"],"answer":"Height in humans"},
{"id":"BIO182","topic":"Classification","question":"Which of the following is a distinguishing feature of gymnosperms?","options":["Naked seeds not enclosed in fruit","Seeds enclosed in fruit","Absence of seeds","Presence of flowers"],"answer":"Naked seeds not enclosed in fruit"},
{"id":"BIO183","topic":"Plant Physiology","question":"Which of the following best explains geotropism in plant roots?","options":["Roots grow towards the pull of gravity","Roots grow away from gravity","Roots grow towards light","Roots grow away from water"],"answer":"Roots grow towards the pull of gravity"},
{"id":"BIO184","topic":"Nutrition","question":"Which of the following is the primary function of carbohydrates in the body?","options":["Providing energy","Building tissues","Fighting infection","Clotting blood"],"answer":"Providing energy"},
{"id":"BIO185","topic":"Cell Biology","question":"Which of the following organelles contains its own DNA?","options":["Mitochondrion","Ribosome","Golgi apparatus","Lysosome"],"answer":"Mitochondrion"},
{"id":"BIO186","topic":"Ecology","question":"Which of the following is a man-made cause of environmental pollution?","options":["Industrial waste discharge","Volcanic eruption","Earthquake","Lightning"],"answer":"Industrial waste discharge"},
{"id":"BIO187","topic":"Human Anatomy - Reproductive System","question":"Which hormone is responsible for the development of secondary sexual characteristics in males?","options":["Testosterone","Oestrogen","Insulin","Progesterone"],"answer":"Testosterone"},
{"id":"BIO188","topic":"Reproduction in Plants","question":"Which agent commonly disperses seeds with hooks or spines?","options":["Animals","Wind","Water","Self-dispersal only"],"answer":"Animals"},
{"id":"BIO189","topic":"Genetics","question":"Which of the following best describes codominance?","options":["Both alleles are fully expressed in the phenotype","One allele completely masks the other","Alleles blend to form an intermediate phenotype","One allele is always recessive"],"answer":"Both alleles are fully expressed in the phenotype"},
{"id":"BIO190","topic":"Classification","question":"Which of the following organisms is classified as a bryophyte?","options":["Moss","Fern","Pine tree","Maize"],"answer":"Moss"},
{"id":"BIO191","topic":"Plant Physiology","question":"Which of the following environmental factors most directly affects the rate of photosynthesis?","options":["Light intensity","Wind speed","Soil texture","Air pressure"],"answer":"Light intensity"},
{"id":"BIO192","topic":"Nutrition","question":"Which food test would confirm the presence of protein in a sample?","options":["Biuret test","Iodine test","Benedict's test","Sudan III test"],"answer":"Biuret test"},
{"id":"BIO193","topic":"Cell Biology","question":"Which of the following would most likely happen to an animal cell placed in a hypotonic solution?","options":["It would swell and possibly burst","It would shrink","It would remain unchanged","It would form a cell wall"],"answer":"It would swell and possibly burst"},
{"id":"BIO194","topic":"Ecology","question":"Which of the following is a consequence of deforestation?","options":["Loss of habitat and soil erosion","Increased rainfall in all cases","Decreased carbon dioxide levels","Increased biodiversity"],"answer":"Loss of habitat and soil erosion"},
{"id":"BIO195","topic":"Human Anatomy - Skeletal System","question":"Which type of joint is found in the skull sutures?","options":["Fixed/immovable joint","Hinge joint","Ball and socket joint","Pivot joint"],"answer":"Fixed/immovable joint"},
{"id":"BIO196","topic":"Reproduction in Animals","question":"Which of the following is a feature of ovoviviparous reproduction?","options":["Eggs develop and hatch inside the mother's body","Eggs are laid and hatch outside","Young are born without eggs at all","Fertilization occurs outside the body"],"answer":"Eggs develop and hatch inside the mother's body"},
{"id":"BIO197","topic":"Genetics","question":"Which term describes an organism's genetic makeup for a particular trait?","options":["Genotype","Phenotype","Genome","Species"],"answer":"Genotype"},
{"id":"BIO198","topic":"Classification","question":"Which of the following is the correct hierarchical order from broadest to narrowest?","options":["Kingdom, Phylum, Class, Order, Family, Genus, Species","Species, Genus, Family, Order, Class, Phylum, Kingdom","Phylum, Kingdom, Class, Order, Family, Genus, Species","Kingdom, Class, Phylum, Family, Order, Genus, Species"],"answer":"Kingdom, Phylum, Class, Order, Family, Genus, Species"},
{"id":"BIO199","topic":"Plant Physiology","question":"Which of the following best describes the function of xylem tissue?","options":["Conducting water and mineral salts upward","Conducting manufactured food downward","Storing genetic material","Producing hormones"],"answer":"Conducting water and mineral salts upward"},
{"id":"BIO200","topic":"Nutrition","question":"Which of the following best describes the role of enzymes in digestion?","options":["They speed up the breakdown of food molecules","They provide energy directly","They store nutrients","They transport oxygen"],"answer":"They speed up the breakdown of food molecules"},

  {
    "id": "BIO201",
    "topic": "Cell Biology",
    "question": "Which organelle is primarily responsible for controlling the activities of a cell?",
    "options": ["Ribosome", "Nucleus", "Vacuole", "Lysosome"],
    "answer": "Nucleus"
  },
  {
    "id": "BIO202",
    "topic": "Cell Biology",
    "question": "The site of protein synthesis in a cell is the",
    "options": ["Ribosome", "Golgi apparatus", "Vacuole", "Centrosome"],
    "answer": "Ribosome"
  },
  {
    "id": "BIO203",
    "topic": "Cell Biology",
    "question": "Which organelle is responsible for aerobic respiration?",
    "options": ["Mitochondrion", "Chloroplast", "Nucleus", "Lysosome"],
    "answer": "Mitochondrion"
  },
  {
    "id": "BIO204",
    "topic": "Cell Biology",
    "question": "The selectively permeable structure surrounding the cytoplasm is the",
    "options": ["Cell wall", "Cell membrane", "Nuclear membrane", "Capsule"],
    "answer": "Cell membrane"
  },
  {
    "id": "BIO205",
    "topic": "Cell Biology",
    "question": "Which structure is present in plant cells but absent in animal cells?",
    "options": ["Cell wall", "Ribosome", "Cytoplasm", "Cell membrane"],
    "answer": "Cell wall"
  },
  {
    "id": "BIO206",
    "topic": "Cell Biology",
    "question": "The movement of water molecules through a selectively permeable membrane is called",
    "options": ["Diffusion", "Osmosis", "Active transport", "Transpiration"],
    "answer": "Osmosis"
  },
  {
    "id": "BIO207",
    "topic": "Cell Biology",
    "question": "The movement of particles from a region of higher concentration to a region of lower concentration is",
    "options": ["Diffusion", "Osmosis", "Active transport", "Endocytosis"],
    "answer": "Diffusion"
  },
  {
    "id": "BIO208",
    "topic": "Cell Biology",
    "question": "Active transport requires",
    "options": ["Light energy only", "Energy from respiration", "No energy", "Carbon dioxide only"],
    "answer": "Energy from respiration"
  },
  {
    "id": "BIO209",
    "topic": "Cell Biology",
    "question": "Which organelle modifies, packages and transports proteins?",
    "options": ["Golgi apparatus", "Ribosome", "Mitochondrion", "Chloroplast"],
    "answer": "Golgi apparatus"
  },
  {
    "id": "BIO210",
    "topic": "Cell Biology",
    "question": "The jelly-like substance in which cell organelles are suspended is the",
    "options": ["Cell wall", "Cytoplasm", "Nucleolus", "Capsule"],
    "answer": "Cytoplasm"
  },

  {
    "id": "BIO211",
    "topic": "Cell Division",
    "question": "Mitosis produces",
    "options": ["Two genetically identical daughter cells", "Four genetically different cells", "Two haploid cells", "Four diploid cells"],
    "answer": "Two genetically identical daughter cells"
  },
  {
    "id": "BIO212",
    "topic": "Cell Division",
    "question": "Meiosis is important in the formation of",
    "options": ["Body cells", "Gametes", "Red blood cells only", "Muscle cells"],
    "answer": "Gametes"
  },
  {
    "id": "BIO213",
    "topic": "Cell Division",
    "question": "Crossing over occurs during",
    "options": ["Prophase I of meiosis", "Prophase of mitosis", "Telophase II", "Cytokinesis"],
    "answer": "Prophase I of meiosis"
  },
  {
    "id": "BIO214",
    "topic": "Cell Division",
    "question": "The chromosome number in human gametes is",
    "options": ["46", "23", "44", "92"],
    "answer": "23"
  },
  {
    "id": "BIO215",
    "topic": "Cell Division",
    "question": "The process by which the cytoplasm divides after nuclear division is called",
    "options": ["Cytokinesis", "Synapsis", "Replication", "Mutation"],
    "answer": "Cytokinesis"
  },

  {
    "id": "BIO216",
    "topic": "Nutrition",
    "question": "The mode of nutrition in green plants is mainly",
    "options": ["Holozoic", "Autotrophic", "Parasitic", "Saprophytic"],
    "answer": "Autotrophic"
  },
  {
    "id": "BIO217",
    "topic": "Nutrition",
    "question": "Which mineral element is essential for the formation of chlorophyll?",
    "options": ["Magnesium", "Sodium", "Chlorine", "Gold"],
    "answer": "Magnesium"
  },
  {
    "id": "BIO218",
    "topic": "Nutrition",
    "question": "The raw materials required for photosynthesis are",
    "options": ["Oxygen and glucose", "Carbon dioxide and water", "Nitrogen and oxygen", "Glucose and oxygen"],
    "answer": "Carbon dioxide and water"
  },
  {
    "id": "BIO219",
    "topic": "Nutrition",
    "question": "The green pigment that traps light energy during photosynthesis is",
    "options": ["Haemoglobin", "Chlorophyll", "Melanin", "Carotene"],
    "answer": "Chlorophyll"
  },
  {
    "id": "BIO220",
    "topic": "Nutrition",
    "question": "Which part of a leaf contains the highest concentration of chloroplasts?",
    "options": ["Palisade mesophyll", "Upper epidermis", "Lower epidermis", "Vein"],
    "answer": "Palisade mesophyll"
  },
  {
    "id": "BIO221",
    "topic": "Nutrition",
    "question": "The opening through which gases enter and leave a leaf is the",
    "options": ["Stoma", "Lenticel", "Root hair", "Xylem"],
    "answer": "Stoma"
  },
  {
    "id": "BIO222",
    "topic": "Nutrition",
    "question": "The cells that control the opening and closing of stomata are called",
    "options": ["Guard cells", "Palisade cells", "Companion cells", "Root cells"],
    "answer": "Guard cells"
  },
  {
    "id": "BIO223",
    "topic": "Nutrition",
    "question": "Which condition is necessary for the formation of starch during photosynthesis?",
    "options": ["Light", "Darkness", "Absence of chlorophyll", "Absence of water"],
    "answer": "Light"
  },
  {
    "id": "BIO224",
    "topic": "Nutrition",
    "question": "The food manufactured by green plants during photosynthesis is initially stored as",
    "options": ["Protein", "Starch", "Fat", "Mineral salt"],
    "answer": "Starch"
  },
  {
    "id": "BIO225",
    "topic": "Nutrition",
    "question": "Which gas is released as a by-product of photosynthesis?",
    "options": ["Nitrogen", "Oxygen", "Carbon dioxide", "Hydrogen"],
    "answer": "Oxygen"
  },

  {
    "id": "BIO226",
    "topic": "Animal Nutrition",
    "question": "The enzyme in saliva that begins the digestion of starch is",
    "options": ["Pepsin", "Amylase", "Lipase", "Trypsin"],
    "answer": "Amylase"
  },
  {
    "id": "BIO227",
    "topic": "Animal Nutrition",
    "question": "Protein digestion begins mainly in the",
    "options": ["Mouth", "Stomach", "Large intestine", "Rectum"],
    "answer": "Stomach"
  },
  {
    "id": "BIO228",
    "topic": "Animal Nutrition",
    "question": "Pepsin acts mainly on",
    "options": ["Fats", "Proteins", "Starch", "Vitamins"],
    "answer": "Proteins"
  },
  {
    "id": "BIO229",
    "topic": "Animal Nutrition",
    "question": "Bile is produced by the",
    "options": ["Pancreas", "Liver", "Gall bladder", "Stomach"],
    "answer": "Liver"
  },
  {
    "id": "BIO230",
    "topic": "Animal Nutrition",
    "question": "The main function of bile in digestion is to",
    "options": ["Digest proteins", "Emulsify fats", "Digest starch", "Absorb glucose"],
    "answer": "Emulsify fats"
  },
  {
    "id": "BIO231",
    "topic": "Animal Nutrition",
    "question": "Most absorption of digested food occurs in the",
    "options": ["Stomach", "Small intestine", "Large intestine", "Oesophagus"],
    "answer": "Small intestine"
  },
  {
    "id": "BIO232",
    "topic": "Animal Nutrition",
    "question": "The finger-like projections that increase the absorptive surface of the small intestine are",
    "options": ["Villi", "Alveoli", "Nephrons", "Cilia"],
    "answer": "Villi"
  },
  {
    "id": "BIO233",
    "topic": "Animal Nutrition",
    "question": "The enzyme that digests fats is",
    "options": ["Lipase", "Amylase", "Pepsin", "Maltase"],
    "answer": "Lipase"
  },
  {
    "id": "BIO234",
    "topic": "Animal Nutrition",
    "question": "The end products of protein digestion are mainly",
    "options": ["Fatty acids", "Amino acids", "Glucose", "Glycerol"],
    "answer": "Amino acids"
  },
  {
    "id": "BIO235",
    "topic": "Animal Nutrition",
    "question": "A deficiency of vitamin C causes",
    "options": ["Rickets", "Scurvy", "Night blindness", "Beriberi"],
    "answer": "Scurvy"
  },

  {
    "id": "BIO236",
    "topic": "Respiration",
    "question": "The organelle in which aerobic respiration mainly occurs is the",
    "options": ["Ribosome", "Mitochondrion", "Chloroplast", "Vacuole"],
    "answer": "Mitochondrion"
  },
  {
    "id": "BIO237",
    "topic": "Respiration",
    "question": "The energy currency of the cell is",
    "options": ["DNA", "ATP", "RNA", "Glucose"],
    "answer": "ATP"
  },
  {
    "id": "BIO238",
    "topic": "Respiration",
    "question": "The complete aerobic breakdown of glucose produces carbon dioxide, water and",
    "options": ["Energy", "Nitrogen", "Urea", "Chlorophyll"],
    "answer": "Energy"
  },
  {
    "id": "BIO239",
    "topic": "Respiration",
    "question": "Anaerobic respiration in yeast produces alcohol and",
    "options": ["Oxygen", "Carbon dioxide", "Water only", "Nitrogen"],
    "answer": "Carbon dioxide"
  },
  {
    "id": "BIO240",
    "topic": "Respiration",
    "question": "Anaerobic respiration in human muscles may result in the production of",
    "options": ["Lactic acid", "Ethanol", "Oxygen", "Urea"],
    "answer": "Lactic acid"
  },

  {
    "id": "BIO241",
    "topic": "Transport in Plants",
    "question": "The tissue responsible for transporting water and mineral salts in plants is",
    "options": ["Phloem", "Xylem", "Cambium", "Epidermis"],
    "answer": "Xylem"
  },
  {
    "id": "BIO242",
    "topic": "Transport in Plants",
    "question": "The tissue responsible for transporting manufactured food is",
    "options": ["Xylem", "Phloem", "Cortex", "Epidermis"],
    "answer": "Phloem"
  },
  {
    "id": "BIO243",
    "topic": "Transport in Plants",
    "question": "The loss of water vapour from the aerial parts of a plant is called",
    "options": ["Transpiration", "Translocation", "Respiration", "Guttation"],
    "answer": "Transpiration"
  },
  {
    "id": "BIO244",
    "topic": "Transport in Plants",
    "question": "Which factor generally increases the rate of transpiration?",
    "options": ["High humidity", "High temperature", "Low wind speed", "Darkness"],
    "answer": "High temperature"
  },
  {
    "id": "BIO245",
    "topic": "Transport in Plants",
    "question": "The upward movement of water through the xylem is aided by",
    "options": ["Transpiration pull", "Photosynthesis only", "Digestion", "Fermentation"],
    "answer": "Transpiration pull"
  },

  {
    "id": "BIO246",
    "topic": "Transport in Animals",
    "question": "The liquid portion of blood is called",
    "options": ["Plasma", "Lymph", "Serum only", "Platelet"],
    "answer": "Plasma"
  },
  {
    "id": "BIO247",
    "topic": "Transport in Animals",
    "question": "The red pigment in red blood cells is",
    "options": ["Chlorophyll", "Haemoglobin", "Melanin", "Insulin"],
    "answer": "Haemoglobin"
  },
  {
    "id": "BIO248",
    "topic": "Transport in Animals",
    "question": "The main function of red blood cells is to transport",
    "options": ["Oxygen", "Hormones only", "Digestive enzymes", "Urea only"],
    "answer": "Oxygen"
  },
  {
    "id": "BIO249",
    "topic": "Transport in Animals",
    "question": "Blood clotting is mainly associated with",
    "options": ["Red blood cells", "Platelets", "Plasma proteins only", "White blood cells"],
    "answer": "Platelets"
  },
  {
    "id": "BIO250",
    "topic": "Transport in Animals",
    "question": "White blood cells are primarily involved in",
    "options": ["Defence against disease", "Transport of oxygen", "Blood clotting only", "Transport of glucose only"],
    "answer": "Defence against disease"
  },

  {
    "id": "BIO251",
    "topic": "Circulatory System",
    "question": "The chamber of the heart that pumps oxygenated blood to the body is the",
    "options": ["Right atrium", "Right ventricle", "Left atrium", "Left ventricle"],
    "answer": "Left ventricle"
  },
  {
    "id": "BIO252",
    "topic": "Circulatory System",
    "question": "The blood vessel that carries blood away from the heart is an",
    "options": ["Artery", "Vein", "Capillary", "Venule"],
    "answer": "Artery"
  },
  {
    "id": "BIO253",
    "topic": "Circulatory System",
    "question": "The blood vessel that carries blood toward the heart is a",
    "options": ["Vein", "Artery", "Capillary", "Aorta"],
    "answer": "Vein"
  },
  {
    "id": "BIO254",
    "topic": "Circulatory System",
    "question": "The largest artery in the human body is the",
    "options": ["Aorta", "Vena cava", "Pulmonary vein", "Carotid artery"],
    "answer": "Aorta"
  },
  {
    "id": "BIO255",
    "topic": "Circulatory System",
    "question": "The exchange of materials between blood and body tissues occurs mainly through",
    "options": ["Arteries", "Veins", "Capillaries", "Aorta"],
    "answer": "Capillaries"
  },

  {
    "id": "BIO256",
    "topic": "Respiratory System",
    "question": "The tiny air sacs in the lungs where gaseous exchange occurs are called",
    "options": ["Bronchi", "Alveoli", "Trachea", "Larynx"],
    "answer": "Alveoli"
  },
  {
    "id": "BIO257",
    "topic": "Respiratory System",
    "question": "The windpipe is also known as the",
    "options": ["Bronchus", "Trachea", "Oesophagus", "Pharynx"],
    "answer": "Trachea"
  },
  {
    "id": "BIO258",
    "topic": "Respiratory System",
    "question": "During inhalation, the diaphragm",
    "options": ["Relaxes and moves upward", "Contracts and moves downward", "Stops moving", "Contracts and moves upward"],
    "answer": "Contracts and moves downward"
  },
  {
    "id": "BIO259",
    "topic": "Respiratory System",
    "question": "The main respiratory pigment in humans is",
    "options": ["Haemoglobin", "Chlorophyll", "Melanin", "Insulin"],
    "answer": "Haemoglobin"
  },
  {
    "id": "BIO260",
    "topic": "Respiratory System",
    "question": "Gaseous exchange in the alveoli occurs mainly by",
    "options": ["Osmosis", "Diffusion", "Active transport", "Transpiration"],
    "answer": "Diffusion"
  },

  {
    "id": "BIO261",
    "topic": "Excretion",
    "question": "The major excretory organ in humans is the",
    "options": ["Kidney", "Heart", "Stomach", "Pancreas"],
    "answer": "Kidney"
  },
  {
    "id": "BIO262",
    "topic": "Excretion",
    "question": "The functional unit of the kidney is the",
    "options": ["Neuron", "Nephron", "Alveolus", "Villus"],
    "answer": "Nephron"
  },
  {
    "id": "BIO263",
    "topic": "Excretion",
    "question": "The nitrogenous waste product mainly excreted by humans is",
    "options": ["Urea", "Glucose", "Starch", "Oxygen"],
    "answer": "Urea"
  },
  {
    "id": "BIO264",
    "topic": "Excretion",
    "question": "Ultrafiltration in the nephron occurs in the",
    "options": ["Glomerulus", "Collecting duct", "Ureter", "Loop of Henle"],
    "answer": "Glomerulus"
  },
  {
    "id": "BIO265",
    "topic": "Excretion",
    "question": "The hormone that increases water reabsorption in the kidney is",
    "options": ["Insulin", "ADH", "Adrenaline", "Thyroxine"],
    "answer": "ADH"
  },

  {
    "id": "BIO266",
    "topic": "Homeostasis",
    "question": "The maintenance of a relatively constant internal environment is called",
    "options": ["Homeostasis", "Evolution", "Adaptation", "Respiration"],
    "answer": "Homeostasis"
  },
  {
    "id": "BIO267",
    "topic": "Homeostasis",
    "question": "When body temperature rises, the skin responds by increasing",
    "options": ["Sweating", "Shivering", "Hair erection", "Vasoconstriction"],
    "answer": "Sweating"
  },
  {
    "id": "BIO268",
    "topic": "Homeostasis",
    "question": "The hormone that lowers blood glucose concentration is",
    "options": ["Insulin", "Glucagon", "Adrenaline", "Thyroxine"],
    "answer": "Insulin"
  },
  {
    "id": "BIO269",
    "topic": "Homeostasis",
    "question": "When blood glucose falls below normal, the pancreas releases",
    "options": ["Insulin", "Glucagon", "ADH", "Oestrogen"],
    "answer": "Glucagon"
  },
  {
    "id": "BIO270",
    "topic": "Homeostasis",
    "question": "The part of the brain involved in regulating body temperature is the",
    "options": ["Cerebellum", "Hypothalamus", "Medulla", "Cerebrum"],
    "answer": "Hypothalamus"
  },

  {
    "id": "BIO271",
    "topic": "Coordination",
    "question": "The structural and functional unit of the nervous system is the",
    "options": ["Neuron", "Nephron", "Alveolus", "Hormone"],
    "answer": "Neuron"
  },
  {
    "id": "BIO272",
    "topic": "Coordination",
    "question": "The part of the neuron that receives impulses is mainly the",
    "options": ["Dendrite", "Axon", "Myelin sheath", "Synapse"],
    "answer": "Dendrite"
  },
  {
    "id": "BIO273",
    "topic": "Coordination",
    "question": "The junction between two neurons is called a",
    "options": ["Synapse", "Dendrite", "Node", "Receptor"],
    "answer": "Synapse"
  },
  {
    "id": "BIO274",
    "topic": "Coordination",
    "question": "A rapid automatic response to a stimulus is called a",
    "options": ["Reflex action", "Voluntary action", "Hormonal action", "Growth response"],
    "answer": "Reflex action"
  },
  {
    "id": "BIO275",
    "topic": "Coordination",
    "question": "The part of the brain responsible mainly for balance and coordination is the",
    "options": ["Cerebrum", "Cerebellum", "Medulla", "Hypothalamus"],
    "answer": "Cerebellum"
  },

  {
    "id": "BIO276",
    "topic": "Sense Organs",
    "question": "The light-sensitive layer of the eye is the",
    "options": ["Cornea", "Retina", "Iris", "Sclera"],
    "answer": "Retina"
  },
  {
    "id": "BIO277",
    "topic": "Sense Organs",
    "question": "The part of the eye that controls the amount of light entering it is the",
    "options": ["Iris", "Retina", "Lens", "Sclera"],
    "answer": "Iris"
  },
  {
    "id": "BIO278",
    "topic": "Sense Organs",
    "question": "The structure that changes shape to focus light onto the retina is the",
    "options": ["Lens", "Cornea", "Iris", "Optic nerve"],
    "answer": "Lens"
  },
  {
    "id": "BIO279",
    "topic": "Sense Organs",
    "question": "The receptors responsible for colour vision are the",
    "options": ["Rods", "Cones", "Cochlea", "Cilia"],
    "answer": "Cones"
  },
  {
    "id": "BIO280",
    "topic": "Sense Organs",
    "question": "The organ responsible for hearing and maintaining balance is the",
    "options": ["Eye", "Ear", "Nose", "Tongue"],
    "answer": "Ear"
  },

  {
    "id": "BIO281",
    "topic": "Hormones",
    "question": "The endocrine gland known as the master gland is the",
    "options": ["Pituitary gland", "Thyroid gland", "Pancreas", "Adrenal gland"],
    "answer": "Pituitary gland"
  },
  {
    "id": "BIO282",
    "topic": "Hormones",
    "question": "Thyroxine is produced by the",
    "options": ["Thyroid gland", "Pituitary gland", "Pancreas", "Adrenal gland"],
    "answer": "Thyroid gland"
  },
  {
    "id": "BIO283",
    "topic": "Hormones",
    "question": "Adrenaline is produced by the",
    "options": ["Adrenal glands", "Thyroid gland", "Pancreas", "Ovaries"],
    "answer": "Adrenal glands"
  },
  {
    "id": "BIO284",
    "topic": "Hormones",
    "question": "Oestrogen is mainly produced by the",
    "options": ["Ovaries", "Testes", "Pancreas", "Adrenal glands"],
    "answer": "Ovaries"
  },
  {
    "id": "BIO285",
    "topic": "Hormones",
    "question": "Testosterone is mainly produced by the",
    "options": ["Testes", "Ovaries", "Thyroid", "Pituitary"],
    "answer": "Testes"
  },

  {
    "id": "BIO286",
    "topic": "Reproduction",
    "question": "The male reproductive organ that produces sperm is the",
    "options": ["Testis", "Prostate gland", "Penis", "Scrotum"],
    "answer": "Testis"
  },
  {
    "id": "BIO287",
    "topic": "Reproduction",
    "question": "The female reproductive organ that produces ova is the",
    "options": ["Uterus", "Ovary", "Vagina", "Fallopian tube"],
    "answer": "Ovary"
  },
  {
    "id": "BIO288",
    "topic": "Reproduction",
    "question": "Fertilization in humans normally occurs in the",
    "options": ["Uterus", "Fallopian tube", "Vagina", "Ovary"],
    "answer": "Fallopian tube"
  },
  {
    "id": "BIO289",
    "topic": "Reproduction",
    "question": "The attachment of the embryo to the wall of the uterus is called",
    "options": ["Ovulation", "Implantation", "Fertilization", "Gestation"],
    "answer": "Implantation"
  },
  {
    "id": "BIO290",
    "topic": "Reproduction",
    "question": "The release of a mature ovum from the ovary is called",
    "options": ["Ovulation", "Implantation", "Menstruation", "Fertilization"],
    "answer": "Ovulation"
  },

  {
    "id": "BIO291",
    "topic": "Reproduction",
    "question": "The period during which the developing embryo is carried in the uterus is called",
    "options": ["Gestation", "Ovulation", "Menstruation", "Puberty"],
    "answer": "Gestation"
  },
  {
    "id": "BIO292",
    "topic": "Reproduction",
    "question": "The placenta is important because it",
    "options": ["Produces sperm", "Allows exchange of materials between mother and foetus", "Digests food in the stomach", "Stores urine"],
    "answer": "Allows exchange of materials between mother and foetus"
  },
  {
    "id": "BIO293",
    "topic": "Reproduction",
    "question": "The hormone that stimulates milk production after childbirth is",
    "options": ["Prolactin", "Insulin", "Adrenaline", "Thyroxine"],
    "answer": "Prolactin"
  },
  {
    "id": "BIO294",
    "topic": "Reproduction",
    "question": "The hormone responsible mainly for milk ejection is",
    "options": ["Oxytocin", "Insulin", "Glucagon", "Thyroxine"],
    "answer": "Oxytocin"
  },
  {
    "id": "BIO295",
    "topic": "Reproduction",
    "question": "The fusion of male and female gametes is called",
    "options": ["Fertilization", "Ovulation", "Implantation", "Germination"],
    "answer": "Fertilization"
  },

  {
    "id": "BIO296",
    "topic": "Genetics",
    "question": "The basic unit of heredity is the",
    "options": ["Gene", "Cell", "Tissue", "Organ"],
    "answer": "Gene"
  },
  {
    "id": "BIO297",
    "topic": "Genetics",
    "question": "The physical appearance of an organism resulting from its genotype and environment is its",
    "options": ["Phenotype", "Genotype", "Allele", "Karyotype"],
    "answer": "Phenotype"
  },
  {
    "id": "BIO298",
    "topic": "Genetics",
    "question": "The genetic constitution of an organism is its",
    "options": ["Phenotype", "Genotype", "Variation", "Species"],
    "answer": "Genotype"
  },
  {
    "id": "BIO299",
    "topic": "Genetics",
    "question": "Alternative forms of a gene are called",
    "options": ["Alleles", "Chromatids", "Gametes", "Centromeres"],
    "answer": "Alleles"
  },
  {
    "id": "BIO300",
    "topic": "Genetics",
    "question": "An organism with two identical alleles for a character is",
    "options": ["Heterozygous", "Homozygous", "Hybrid", "Dominant"],
    "answer": "Homozygous"
  },

  {
    "id": "BIO301",
    "topic": "Genetics",
    "question": "An organism with two different alleles for a character is",
    "options": ["Homozygous", "Heterozygous", "Pure-breeding", "Recessive"],
    "answer": "Heterozygous"
  },
  {
    "id": "BIO302",
    "topic": "Genetics",
    "question": "A trait that expresses itself in a heterozygous individual is described as",
    "options": ["Recessive", "Dominant", "Lethal", "Mutant"],
    "answer": "Dominant"
  },
  {
    "id": "BIO303",
    "topic": "Genetics",
    "question": "A recessive trait is expressed when the individual has",
    "options": ["Two recessive alleles", "Two dominant alleles", "One dominant allele only", "No genes"],
    "answer": "Two recessive alleles"
  },
  {
    "id": "BIO304",
    "topic": "Genetics",
    "question": "A cross between an individual of unknown genotype and a homozygous recessive individual is called a",
    "options": ["Test cross", "Back cross", "Dihybrid cross", "Self-pollination"],
    "answer": "Test cross"
  },
  {
    "id": "BIO305",
    "topic": "Genetics",
    "question": "The phenotypic ratio expected from a typical monohybrid cross of two heterozygotes is",
    "options": ["1:1", "3:1", "9:3:3:1", "1:2:1:1"],
    "answer": "3:1"
  },

  {
    "id": "BIO306",
    "topic": "Variation",
    "question": "Variation caused by differences in genes is called",
    "options": ["Genetic variation", "Environmental variation", "Seasonal variation", "Behavioural variation"],
    "answer": "Genetic variation"
  },
  {
    "id": "BIO307",
    "topic": "Variation",
    "question": "Which of the following is an example of continuous variation?",
    "options": ["Blood group", "Height", "Tongue rolling", "Sex"],
    "answer": "Height"
  },
  {
    "id": "BIO308",
    "topic": "Variation",
    "question": "Which of the following is an example of discontinuous variation?",
    "options": ["Height", "Body mass", "Blood group", "Skin shade"],
    "answer": "Blood group"
  },
  {
    "id": "BIO309",
    "topic": "Variation",
    "question": "A sudden change in genetic material is called a",
    "options": ["Mutation", "Adaptation", "Selection", "Hybrid"],
    "answer": "Mutation"
  },
  {
    "id": "BIO310",
    "topic": "Variation",
    "question": "Mutations can be caused by exposure to",
    "options": ["Radiation", "Pure water", "Oxygen only", "Starch"],
    "answer": "Radiation"
  },

  {
    "id": "BIO311",
    "topic": "Evolution",
    "question": "The theory of natural selection is strongly associated with",
    "options": ["Charles Darwin", "Gregor Mendel", "Robert Hooke", "Louis Pasteur"],
    "answer": "Charles Darwin"
  },
  {
    "id": "BIO312",
    "topic": "Evolution",
    "question": "Natural selection favours organisms that are",
    "options": ["Better adapted to their environment", "Always the largest", "Always the fastest", "Unable to reproduce"],
    "answer": "Better adapted to their environment"
  },
  {
    "id": "BIO313",
    "topic": "Evolution",
    "question": "The gradual change in inherited characteristics of organisms over generations is",
    "options": ["Evolution", "Digestion", "Respiration", "Excretion"],
    "answer": "Evolution"
  },
  {
    "id": "BIO314",
    "topic": "Evolution",
    "question": "Structures with similar basic anatomy but different functions are called",
    "options": ["Homologous structures", "Analogous structures", "Vestigial organs", "Rudimentary cells"],
    "answer": "Homologous structures"
  },
  {
    "id": "BIO315",
    "topic": "Evolution",
    "question": "The wings of a bird and wings of an insect are examples of",
    "options": ["Homologous structures", "Analogous structures", "Identical organs", "Vestigial structures"],
    "answer": "Analogous structures"
  },

  {
    "id": "BIO316",
    "topic": "Ecology",
    "question": "The study of relationships between organisms and their environment is called",
    "options": ["Ecology", "Genetics", "Physiology", "Anatomy"],
    "answer": "Ecology"
  },
  {
    "id": "BIO317",
    "topic": "Ecology",
    "question": "A group of organisms of the same species living in a particular area is a",
    "options": ["Community", "Population", "Biome", "Ecosystem"],
    "answer": "Population"
  },
  {
    "id": "BIO318",
    "topic": "Ecology",
    "question": "All the populations of different species living together in an area form a",
    "options": ["Community", "Species", "Population", "Habitat"],
    "answer": "Community"
  },
  {
    "id": "BIO319",
    "topic": "Ecology",
    "question": "A community together with its physical environment forms an",
    "options": ["Ecosystem", "Organism", "Population", "Niche"],
    "answer": "Ecosystem"
  },
  {
    "id": "BIO320",
    "topic": "Ecology",
    "question": "The natural place where an organism lives is its",
    "options": ["Habitat", "Niche", "Community", "Population"],
    "answer": "Habitat"
  },

  {
    "id": "BIO321",
    "topic": "Ecology",
    "question": "Green plants in an ecosystem are called",
    "options": ["Consumers", "Producers", "Decomposers", "Parasites"],
    "answer": "Producers"
  },
  {
    "id": "BIO322",
    "topic": "Ecology",
    "question": "Organisms that obtain energy by feeding on other organisms are",
    "options": ["Consumers", "Producers", "Autotrophs", "Minerals"],
    "answer": "Consumers"
  },
  {
    "id": "BIO323",
    "topic": "Ecology",
    "question": "Bacteria and fungi that break down dead organic matter are mainly",
    "options": ["Producers", "Decomposers", "Herbivores", "Predators"],
    "answer": "Decomposers"
  },
  {
    "id": "BIO324",
    "topic": "Ecology",
    "question": "A sequence showing the transfer of food energy from one organism to another is a",
    "options": ["Food chain", "Habitat", "Niche", "Population"],
    "answer": "Food chain"
  },
  {
    "id": "BIO325",
    "topic": "Ecology",
    "question": "In a food chain, energy is transferred from",
    "options": ["Consumers to the Sun", "Producers to consumers", "Decomposers to producers only", "Predators to plants"],
    "answer": "Producers to consumers"
  },

  {
    "id": "BIO326",
    "topic": "Ecology",
    "question": "Which ecological pyramid is always upright?",
    "options": ["Pyramid of energy", "Pyramid of numbers", "Pyramid of biomass", "All pyramids"],
    "answer": "Pyramid of energy"
  },
  {
    "id": "BIO327",
    "topic": "Ecology",
    "question": "The amount of living material present at a trophic level is called",
    "options": ["Biomass", "Population", "Density", "Productivity"],
    "answer": "Biomass"
  },
  {
    "id": "BIO328",
    "topic": "Ecology",
    "question": "The position occupied by an organism in a food chain is its",
    "options": ["Trophic level", "Habitat", "Biome", "Population"],
    "answer": "Trophic level"
  },
  {
    "id": "BIO329",
    "topic": "Ecology",
    "question": "The first trophic level in a typical food chain consists of",
    "options": ["Herbivores", "Producers", "Carnivores", "Decomposers"],
    "answer": "Producers"
  },
  {
    "id": "BIO330",
    "topic": "Ecology",
    "question": "Energy decreases at successive trophic levels mainly because energy is",
    "options": ["Lost as heat during metabolic activities", "Created at each level", "Stored completely", "Converted into minerals"],
    "answer": "Lost as heat during metabolic activities"
  },

  {
    "id": "BIO331",
    "topic": "Population Ecology",
    "question": "The number of organisms of a species per unit area is called population",
    "options": ["Density", "Growth", "Migration", "Frequency"],
    "answer": "Density"
  },
  {
    "id": "BIO332",
    "topic": "Population Ecology",
    "question": "An increase in population size due to births is called",
    "options": ["Natality", "Mortality", "Migration", "Emigration"],
    "answer": "Natality"
  },
  {
    "id": "BIO333",
    "topic": "Population Ecology",
    "question": "The death rate in a population is called",
    "options": ["Natality", "Mortality", "Fertility", "Migration"],
    "answer": "Mortality"
  },
  {
    "id": "BIO334",
    "topic": "Population Ecology",
    "question": "The movement of organisms into a population is called",
    "options": ["Emigration", "Immigration", "Extinction", "Predation"],
    "answer": "Immigration"
  },
  {
    "id": "BIO335",
    "topic": "Population Ecology",
    "question": "The movement of organisms out of a population is called",
    "options": ["Immigration", "Emigration", "Natality", "Reproduction"],
    "answer": "Emigration"
  },

  {
    "id": "BIO336",
    "topic": "Ecological Relationships",
    "question": "A relationship in which both organisms benefit is called",
    "options": ["Mutualism", "Parasitism", "Predation", "Competition"],
    "answer": "Mutualism"
  },
  {
    "id": "BIO337",
    "topic": "Ecological Relationships",
    "question": "A relationship in which one organism benefits while the other is harmed is",
    "options": ["Mutualism", "Parasitism", "Commensalism", "Cooperation"],
    "answer": "Parasitism"
  },
  {
    "id": "BIO338",
    "topic": "Ecological Relationships",
    "question": "A relationship in which one organism benefits and the other is neither significantly helped nor harmed is",
    "options": ["Commensalism", "Parasitism", "Predation", "Competition"],
    "answer": "Commensalism"
  },
  {
    "id": "BIO339",
    "topic": "Ecological Relationships",
    "question": "The interaction in which organisms compete for limited resources is",
    "options": ["Competition", "Mutualism", "Commensalism", "Decomposition"],
    "answer": "Competition"
  },
  {
    "id": "BIO340",
    "topic": "Ecological Relationships",
    "question": "A lion feeding on an antelope is an example of",
    "options": ["Parasitism", "Predation", "Mutualism", "Commensalism"],
    "answer": "Predation"
  },

  {
    "id": "BIO341",
    "topic": "Adaptation",
    "question": "A structural feature that enables an organism to survive in its environment is an",
    "options": ["Adaptation", "Mutation only", "Infection", "Extinction"],
    "answer": "Adaptation"
  },
  {
    "id": "BIO342",
    "topic": "Adaptation",
    "question": "The thick fur of polar bears is mainly an adaptation for",
    "options": ["Heat loss", "Insulation", "Photosynthesis", "Water absorption"],
    "answer": "Insulation"
  },
  {
    "id": "BIO343",
    "topic": "Adaptation",
    "question": "The presence of a waxy cuticle on leaves helps reduce",
    "options": ["Photosynthesis", "Water loss", "Respiration", "Mineral absorption"],
    "answer": "Water loss"
  },
  {
    "id": "BIO344",
    "topic": "Adaptation",
    "question": "The streamlined body of a fish helps it to",
    "options": ["Reduce resistance in water", "Increase water loss", "Produce seeds", "Digest cellulose"],
    "answer": "Reduce resistance in water"
  },
  {
    "id": "BIO345",
    "topic": "Adaptation",
    "question": "A cactus has spines mainly to",
    "options": ["Increase water loss", "Reduce water loss and discourage herbivores", "Increase transpiration", "Absorb more sunlight"],
    "answer": "Reduce water loss and discourage herbivores"
  },

  {
    "id": "BIO346",
    "topic": "Microorganisms",
    "question": "Which of the following is a microorganism?",
    "options": ["Bacterium", "Elephant", "Mango tree", "Eagle"],
    "answer": "Bacterium"
  },
  {
    "id": "BIO347",
    "topic": "Microorganisms",
    "question": "Which microorganism is used in bread making?",
    "options": ["Yeast", "Virus", "Protozoan", "Alga"],
    "answer": "Yeast"
  },
  {
    "id": "BIO348",
    "topic": "Microorganisms",
    "question": "The organism responsible for malaria is a",
    "options": ["Bacterium", "Protozoan", "Virus", "Fungus"],
    "answer": "Protozoan"
  },
  {
    "id": "BIO349",
    "topic": "Microorganisms",
    "question": "Malaria is transmitted mainly by the bite of an infected",
    "options": ["Male mosquito", "Female Anopheles mosquito", "Housefly", "Tsetse fly"],
    "answer": "Female Anopheles mosquito"
  },
  {
    "id": "BIO350",
    "topic": "Microorganisms",
    "question": "Tuberculosis is caused by a",
    "options": ["Bacterium", "Virus", "Fungus", "Protozoan"],
    "answer": "Bacterium"
  },

  {
    "id": "BIO351",
    "topic": "Disease and Immunity",
    "question": "The body's ability to resist disease-causing organisms is called",
    "options": ["Immunity", "Digestion", "Respiration", "Excretion"],
    "answer": "Immunity"
  },
  {
    "id": "BIO352",
    "topic": "Disease and Immunity",
    "question": "Antibodies are produced mainly by",
    "options": ["White blood cells", "Red blood cells", "Platelets", "Bone cells"],
    "answer": "White blood cells"
  },
  {
    "id": "BIO353",
    "topic": "Disease and Immunity",
    "question": "Vaccination protects an individual by stimulating the production of",
    "options": ["Antibodies and immune memory", "Digestive enzymes", "Red blood cells only", "Bile"],
    "answer": "Antibodies and immune memory"
  },
  {
    "id": "BIO354",
    "topic": "Disease and Immunity",
    "question": "Which disease is caused by a virus?",
    "options": ["Measles", "Malaria", "Tuberculosis", "Cholera"],
    "answer": "Measles"
  },
  {
    "id": "BIO355",
    "topic": "Disease and Immunity",
    "question": "Cholera is commonly caused by a",
    "options": ["Bacterium", "Virus", "Fungus", "Protozoan"],
    "answer": "Bacterium"
  },

  {
    "id": "BIO356",
    "topic": "Plant Reproduction",
    "question": "The male reproductive part of a flower is the",
    "options": ["Stamen", "Carpel", "Sepal", "Petal"],
    "answer": "Stamen"
  },
  {
    "id": "BIO357",
    "topic": "Plant Reproduction",
    "question": "The female reproductive part of a flower is the",
    "options": ["Stamen", "Carpel", "Anther", "Filament"],
    "answer": "Carpel"
  },
  {
    "id": "BIO358",
    "topic": "Plant Reproduction",
    "question": "Pollen grains are produced in the",
    "options": ["Anther", "Stigma", "Ovary", "Style"],
    "answer": "Anther"
  },
  {
    "id": "BIO359",
    "topic": "Plant Reproduction",
    "question": "The part of the carpel that receives pollen grains is the",
    "options": ["Ovary", "Stigma", "Style", "Ovule"],
    "answer": "Stigma"
  },
  {
    "id": "BIO360",
    "topic": "Plant Reproduction",
    "question": "The transfer of pollen grains from anther to stigma is called",
    "options": ["Pollination", "Fertilization", "Germination", "Dispersal"],
    "answer": "Pollination"
  },

  {
    "id": "BIO361",
    "topic": "Plant Reproduction",
    "question": "The fusion of male and female gametes in flowering plants results in the formation of a",
    "options": ["Zygote", "Pollen grain", "Seed coat", "Fruit wall"],
    "answer": "Zygote"
  },
  {
    "id": "BIO362",
    "topic": "Plant Reproduction",
    "question": "After fertilization, the ovule develops into a",
    "options": ["Fruit", "Seed", "Leaf", "Root"],
    "answer": "Seed"
  },
  {
    "id": "BIO363",
    "topic": "Plant Reproduction",
    "question": "After fertilization, the ovary usually develops into a",
    "options": ["Seed", "Fruit", "Root", "Pollen grain"],
    "answer": "Fruit"
  },
  {
    "id": "BIO364",
    "topic": "Plant Reproduction",
    "question": "Self-pollination occurs when pollen is transferred to the stigma of",
    "options": ["A flower on the same plant or a genetically identical plant", "A completely unrelated species", "A root", "A leaf"],
    "answer": "A flower on the same plant or a genetically identical plant"
  },
  {
    "id": "BIO365",
    "topic": "Plant Reproduction",
    "question": "Cross-pollination generally increases",
    "options": ["Genetic variation", "Asexual reproduction", "Cloning", "Genetic uniformity"],
    "answer": "Genetic variation"
  },

  {
    "id": "BIO366",
    "topic": "Seed Germination",
    "question": "Which of the following is NOT generally necessary for seed germination?",
    "options": ["Water", "Oxygen", "Suitable temperature", "Chlorophyll"],
    "answer": "Chlorophyll"
  },
  {
    "id": "BIO367",
    "topic": "Seed Germination",
    "question": "The first structure to emerge from a germinating seed is usually the",
    "options": ["Radicle", "Plumule", "Flower", "Fruit"],
    "answer": "Radicle"
  },
  {
    "id": "BIO368",
    "topic": "Seed Germination",
    "question": "The young shoot of a germinating seed is the",
    "options": ["Radicle", "Plumule", "Testa", "Cotyledon"],
    "answer": "Plumule"
  },
  {
    "id": "BIO369",
    "topic": "Seed Germination",
    "question": "The seed coat is called the",
    "options": ["Testa", "Plumule", "Radicle", "Endosperm"],
    "answer": "Testa"
  },
  {
    "id": "BIO370",
    "topic": "Seed Germination",
    "question": "The food reserve in many seeds is stored mainly in the",
    "options": ["Cotyledons or endosperm", "Root hairs", "Stomata", "Xylem"],
    "answer": "Cotyledons or endosperm"
  },

  {
    "id": "BIO371",
    "topic": "Plant Growth",
    "question": "Growth in plants occurs mainly at regions containing",
    "options": ["Meristematic tissues", "Dead cells only", "Xylem vessels only", "Guard cells only"],
    "answer": "Meristematic tissues"
  },
  {
    "id": "BIO372",
    "topic": "Plant Growth",
    "question": "The plant hormone responsible mainly for cell elongation is",
    "options": ["Auxin", "Insulin", "Adrenaline", "Thyroxine"],
    "answer": "Auxin"
  },
  {
    "id": "BIO373",
    "topic": "Plant Growth",
    "question": "The growth response of a plant shoot toward light is called",
    "options": ["Positive phototropism", "Negative phototropism", "Geotropism", "Hydrotropism"],
    "answer": "Positive phototropism"
  },
  {
    "id": "BIO374",
    "topic": "Plant Growth",
    "question": "The growth response of roots toward gravity is",
    "options": ["Positive geotropism", "Negative geotropism", "Phototropism", "Chemotropism"],
    "answer": "Positive geotropism"
  },
  {
    "id": "BIO375",
    "topic": "Plant Growth",
    "question": "The hormone associated with fruit ripening is",
    "options": ["Ethylene", "Auxin", "Cytokinin", "Gibberellin"],
    "answer": "Ethylene"
  },

  {
    "id": "BIO376",
    "topic": "Classification",
    "question": "The science of classifying organisms is called",
    "options": ["Taxonomy", "Ecology", "Physiology", "Histology"],
    "answer": "Taxonomy"
  },
  {
    "id": "BIO377",
    "topic": "Classification",
    "question": "The basic unit of biological classification is the",
    "options": ["Kingdom", "Species", "Family", "Order"],
    "answer": "Species"
  },
  {
    "id": "BIO378",
    "topic": "Classification",
    "question": "The two-part scientific naming system is called",
    "options": ["Binomial nomenclature", "Natural selection", "Artificial selection", "Classification index"],
    "answer": "Binomial nomenclature"
  },
  {
    "id": "BIO379",
    "topic": "Classification",
    "question": "In binomial nomenclature, the first name represents the",
    "options": ["Species", "Genus", "Family", "Order"],
    "answer": "Genus"
  },
  {
    "id": "BIO380",
    "topic": "Classification",
    "question": "Which kingdom contains organisms such as mushrooms?",
    "options": ["Fungi", "Animalia", "Plantae", "Protista"],
    "answer": "Fungi"
  },

  {
    "id": "BIO381",
    "topic": "Classification",
    "question": "Bacteria are classified among the",
    "options": ["Prokaryotes", "Eukaryotes", "Mammals", "Fungi"],
    "answer": "Prokaryotes"
  },
  {
    "id": "BIO382",
    "topic": "Classification",
    "question": "Which group contains organisms with chlorophyll but no true roots, stems or leaves?",
    "options": ["Algae", "Mammals", "Birds", "Reptiles"],
    "answer": "Algae"
  },
  {
    "id": "BIO383",
    "topic": "Classification",
    "question": "Animals with backbones are classified as",
    "options": ["Vertebrates", "Invertebrates", "Arthropods", "Molluscs"],
    "answer": "Vertebrates"
  },
  {
    "id": "BIO384",
    "topic": "Classification",
    "question": "Which of the following is an invertebrate?",
    "options": ["Fish", "Earthworm", "Frog", "Lizard"],
    "answer": "Earthworm"
  },
  {
    "id": "BIO385",
    "topic": "Classification",
    "question": "The body of an insect is divided into",
    "options": ["Head, thorax and abdomen", "Head and trunk only", "Cephalothorax and abdomen", "Head and abdomen only"],
    "answer": "Head, thorax and abdomen"
  },

  {
    "id": "BIO386",
    "topic": "Animal Diversity",
    "question": "Which class of vertebrates has feathers?",
    "options": ["Aves", "Mammalia", "Reptilia", "Amphibia"],
    "answer": "Aves"
  },
  {
    "id": "BIO387",
    "topic": "Animal Diversity",
    "question": "Mammals are distinguished from other vertebrates mainly by the presence of",
    "options": ["Mammary glands and hair", "Scales", "Feathers", "Gills"],
    "answer": "Mammary glands and hair"
  },
  {
    "id": "BIO388",
    "topic": "Animal Diversity",
    "question": "Amphibians generally spend part of their lives",
    "options": ["Only in deserts", "In water and on land", "Only in trees", "Only underground"],
    "answer": "In water and on land"
  },
  {
    "id": "BIO389",
    "topic": "Animal Diversity",
    "question": "Fish obtain oxygen mainly through their",
    "options": ["Lungs", "Gills", "Skin only", "Trachea"],
    "answer": "Gills"
  },
  {
    "id": "BIO390",
    "topic": "Animal Diversity",
    "question": "Reptiles generally have",
    "options": ["Dry scaly skin", "Feathers", "Moist naked skin", "Gills throughout life"],
    "answer": "Dry scaly skin"
  },

  {
    "id": "BIO391",
    "topic": "Agricultural Biology",
    "question": "The removal of unwanted plants from a farm is called",
    "options": ["Weeding", "Harvesting", "Irrigation", "Pollination"],
    "answer": "Weeding"
  },
  {
    "id": "BIO392",
    "topic": "Agricultural Biology",
    "question": "The artificial supply of water to crops is called",
    "options": ["Irrigation", "Drainage", "Mulching", "Pruning"],
    "answer": "Irrigation"
  },
  {
    "id": "BIO393",
    "topic": "Agricultural Biology",
    "question": "The addition of decaying organic matter to soil improves its",
    "options": ["Fertility", "Salinity only", "Acidity only", "Temperature only"],
    "answer": "Fertility"
  },
  {
    "id": "BIO394",
    "topic": "Agricultural Biology",
    "question": "Which organism helps to improve soil nitrogen content through nitrogen fixation?",
    "options": ["Rhizobium", "Yeast", "Plasmodium", "Amoeba"],
    "answer": "Rhizobium"
  },
  {
    "id": "BIO395",
    "topic": "Agricultural Biology",
    "question": "Crop rotation helps maintain soil fertility by",
    "options": ["Reducing all soil organisms", "Including crops with different nutrient requirements", "Preventing rainfall", "Removing all nitrogen"],
    "answer": "Including crops with different nutrient requirements"
  },

  {
    "id": "BIO396",
    "topic": "Biotechnology",
    "question": "The use of living organisms or biological processes to produce useful products is called",
    "options": ["Biotechnology", "Taxonomy", "Ecology", "Anatomy"],
    "answer": "Biotechnology"
  },
  {
    "id": "BIO397",
    "topic": "Biotechnology",
    "question": "Genetic engineering involves the",
    "options": ["Manipulation of genetic material", "Removal of all genes", "Destruction of cells", "Prevention of reproduction"],
    "answer": "Manipulation of genetic material"
  },
  {
    "id": "BIO398",
    "topic": "Biotechnology",
    "question": "Insulin can be produced using genetically modified",
    "options": ["Bacteria", "Rocks", "Viruses only", "Minerals"],
    "answer": "Bacteria"
  },
  {
    "id": "BIO399",
    "topic": "Biotechnology",
    "question": "The process of producing identical organisms from a single parent is called",
    "options": ["Cloning", "Cross-pollination", "Mutation", "Meiosis"],
    "answer": "Cloning"
  },
  {
    "id": "BIO400",
    "topic": "Conservation",
    "question": "The protection and proper management of natural resources is known as",
    "options": ["Conservation", "Pollution", "Deforestation", "Urbanization"],
    "answer": "Conservation"
  }

],

"Economics":[
  {
    "id": "ECO001",
    "topic": "Economics as a Science",
    "question": "The fundamental economic problem arises because human wants are ___ while resources are ___.",
    "options": [
      "limited; unlimited",
      "unlimited; scarce",
      "scarce; unlimited",
      "equal; abundant"
    ],
    "answer": "unlimited; scarce"
  },
  {
    "id": "ECO002",
    "topic": "Economics as a Science",
    "question": "If a student chooses Economics instead of Mathematics for an evening study period, the opportunity cost is the ___ of the chosen activity.",
    "options": [
      "money spent on books",
      "next best alternative forgone",
      "total benefit from Economics",
      "time spent studying"
    ],
    "answer": "next best alternative forgone"
  },
  {
    "id": "ECO003",
    "topic": "Economics as a Science",
    "question": "A production possibility frontier bowed outward from the origin mainly illustrates ___ opportunity cost.",
    "options": [
      "constant",
      "zero",
      "increasing",
      "negative"
    ],
    "answer": "increasing"
  },
  {
    "id": "ECO004",
    "topic": "Economics as a Science",
    "question": "Which question is concerned with the distribution of output among members of society?",
    "options": [
      "What to produce?",
      "How to produce?",
      "For whom to produce?",
      "Where to produce?"
    ],
    "answer": "For whom to produce?"
  },
  {
    "id": "ECO005",
    "topic": "Economics as a Science",
    "question": "An economy is productively efficient when it produces on its ___ frontier.",
    "options": [
      "inside the PPF",
      "outside the PPF",
      "production possibility",
      "utility"
    ],
    "answer": "production possibility"
  },
  {
    "id": "ECO006",
    "topic": "Economics as a Science",
    "question": "A movement from an inefficient point inside a PPF to a point on the PPF indicates an improvement in ___.",
    "options": [
      "resource efficiency",
      "scarcity",
      "opportunity cost only",
      "consumer sovereignty"
    ],
    "answer": "resource efficiency"
  },
  {
    "id": "ECO007",
    "topic": "Economics as a Science",
    "question": "Which of the following is a normative economic statement?",
    "options": [
      "An increase in price reduces quantity demanded, ceteris paribus.",
      "Nigeria's unemployment rate is 5%.",
      "Government ought to reduce income inequality.",
      "A fall in price increases quantity demanded."
    ],
    "answer": "Government ought to reduce income inequality."
  },
  {
    "id": "ECO008",
    "topic": "Economics as a Science",
    "question": "The assumption of rationality in economics implies that a consumer generally attempts to ___ given constraints.",
    "options": [
      "maximize satisfaction",
      "eliminate scarcity",
      "avoid all opportunity costs",
      "increase population"
    ],
    "answer": "maximize satisfaction"
  },
  {
    "id": "ECO009",
    "topic": "Economics as a Science",
    "question": "Which activity is primarily a production activity?",
    "options": [
      "Using a phone",
      "Teaching in a school",
      "Watching a film",
      "Eating lunch"
    ],
    "answer": "Teaching in a school"
  },
  {
    "id": "ECO010",
    "topic": "Economics as a Science",
    "question": "When all resources are fully employed, producing more of one good generally requires ___ of another good.",
    "options": [
      "less sacrifice",
      "no sacrifice",
      "sacrifice",
      "unlimited resources"
    ],
    "answer": "sacrifice"
  },
  {
    "id": "ECO011",
    "topic": "Economics as a Science",
    "question": "A scale of preference is useful because it helps an individual ___.",
    "options": [
      "eliminate wants",
      "rank wants in order of importance",
      "increase available resources",
      "avoid scarcity"
    ],
    "answer": "rank wants in order of importance"
  },
  {
    "id": "ECO012",
    "topic": "Economics as a Science",
    "question": "Which of the following is a capital resource rather than a consumer good?",
    "options": [
      "Bread",
      "A personal shirt",
      "A factory machine",
      "A bottle of water"
    ],
    "answer": "A factory machine"
  },
  {
    "id": "ECO013",
    "topic": "Economics as a Science",
    "question": "If the price of a good rises and consumers switch to alternatives, this illustrates the economic principle of ___ cost and choice.",
    "options": [
      "opportunity",
      "fixed",
      "accounting",
      "sunk"
    ],
    "answer": "opportunity"
  },
  {
    "id": "ECO014",
    "topic": "Economics as a Science",
    "question": "A point outside a country's current PPF is ___ with its present resources and technology.",
    "options": [
      "efficient",
      "inefficient but attainable",
      "unattainable",
      "optimal"
    ],
    "answer": "unattainable"
  },
  {
    "id": "ECO015",
    "topic": "Economics as a Science",
    "question": "A technological improvement that increases productive capacity will normally shift the PPF ___.",
    "options": [
      "inward",
      "outward",
      "downward only",
      "to the origin"
    ],
    "answer": "outward"
  },
  {
    "id": "ECO016",
    "topic": "Economics as a Science",
    "question": "The central economic problem requires society to decide how scarce resources should be ___ among competing uses.",
    "options": [
      "destroyed",
      "allocated",
      "duplicated",
      "unlimited"
    ],
    "answer": "allocated"
  },
  {
    "id": "ECO017",
    "topic": "Economics as a Science",
    "question": "Which pair consists entirely of economic resources?",
    "options": [
      "Air and sunshine",
      "Land and labour",
      "Wants and utility",
      "Prices and demand"
    ],
    "answer": "Land and labour"
  },
  {
    "id": "ECO018",
    "topic": "Economic Systems",
    "question": "In a pure capitalist economy, resource allocation is mainly guided by the ___ mechanism.",
    "options": [
      "price",
      "central planning",
      "rationing by government",
      "traditional authority"
    ],
    "answer": "price"
  },
  {
    "id": "ECO019",
    "topic": "Economic Systems",
    "question": "A centrally planned economy is characterized by major decisions being made largely by the ___ authority.",
    "options": [
      "market",
      "household",
      "government",
      "foreign sector"
    ],
    "answer": "government"
  },
  {
    "id": "ECO020",
    "topic": "Economic Systems",
    "question": "A mixed economy combines features of ___ and ___ systems.",
    "options": [
      "traditional and feudal",
      "capitalist and socialist",
      "subsistence and barter",
      "monetary and barter"
    ],
    "answer": "capitalist and socialist"
  },
  {
    "id": "ECO021",
    "topic": "Economic Systems",
    "question": "One major advantage of a free-market system is that prices can provide ___ to producers and consumers.",
    "options": [
      "ration cards",
      "signals",
      "subsidized wages",
      "legal ownership"
    ],
    "answer": "signals"
  },
  {
    "id": "ECO022",
    "topic": "Economic Systems",
    "question": "A major weakness of an unregulated market is the possibility of ___.",
    "options": [
      "resource allocation",
      "market failure",
      "consumer choice",
      "specialization"
    ],
    "answer": "market failure"
  },
  {
    "id": "ECO023",
    "topic": "Economic Systems",
    "question": "In a socialist system, ownership of major means of production is predominantly ___ controlled.",
    "options": [
      "privately",
      "publicly",
      "foreignly",
      "informally"
    ],
    "answer": "publicly"
  },
  {
    "id": "ECO024",
    "topic": "Economic Systems",
    "question": "Which system relies most heavily on customs and inherited practices for economic decisions?",
    "options": [
      "Capitalist",
      "Traditional",
      "Mixed",
      "Centrally planned"
    ],
    "answer": "Traditional"
  },
  {
    "id": "ECO025",
    "topic": "Economic Systems",
    "question": "Government regulation of a privately owned telecommunications industry is most consistent with a ___ economy.",
    "options": [
      "pure traditional",
      "mixed",
      "pure socialist",
      "subsistence"
    ],
    "answer": "mixed"
  },
  {
    "id": "ECO026",
    "topic": "Economic Systems",
    "question": "The profit motive in a capitalist system tends to encourage firms to ___.",
    "options": [
      "ignore consumers",
      "seek efficient production",
      "eliminate competition automatically",
      "avoid innovation"
    ],
    "answer": "seek efficient production"
  },
  {
    "id": "ECO027",
    "topic": "Economic Systems",
    "question": "A centrally planned system may face difficulty because planners may lack ___ information about millions of individual preferences.",
    "options": [
      "perfect",
      "historical",
      "legal",
      "financial"
    ],
    "answer": "perfect"
  },
  {
    "id": "ECO028",
    "topic": "Economic Systems",
    "question": "Consumer sovereignty is most closely associated with an economy where ___ influence production decisions.",
    "options": [
      "consumers' choices",
      "military orders",
      "traditional chiefs",
      "central planners only"
    ],
    "answer": "consumers' choices"
  },
  {
    "id": "ECO029",
    "topic": "Economic Systems",
    "question": "One reason governments intervene in mixed economies is to correct ___.",
    "options": [
      "scarcity itself",
      "market failures",
      "all opportunity costs",
      "all consumer choices"
    ],
    "answer": "market failures"
  },
  {
    "id": "ECO030",
    "topic": "Economic Systems",
    "question": "If the government fixes quantities of basic goods and allocates them administratively, the economy is displaying a feature of ___ planning.",
    "options": [
      "central",
      "competitive",
      "traditional",
      "private"
    ],
    "answer": "central"
  },
  {
    "id": "ECO031",
    "topic": "Economic Systems",
    "question": "Private property rights are a major feature of the ___ economic system.",
    "options": [
      "capitalist",
      "centrally planned",
      "traditional",
      "subsistence"
    ],
    "answer": "capitalist"
  },
  {
    "id": "ECO032",
    "topic": "Economic Systems",
    "question": "Which policy is least consistent with a pure laissez-faire system?",
    "options": [
      "Free entry into markets",
      "Private ownership",
      "Extensive price controls",
      "Profit incentives"
    ],
    "answer": "Extensive price controls"
  },
  {
    "id": "ECO033",
    "topic": "Economic Systems",
    "question": "The existence of both public hospitals and privately owned clinics is evidence of a ___ economy.",
    "options": [
      "mixed",
      "pure capitalist",
      "pure socialist",
      "traditional"
    ],
    "answer": "mixed"
  },
  {
    "id": "ECO034",
    "topic": "Economic Systems",
    "question": "Economic systems differ mainly in the way they answer questions about ___.",
    "options": [
      "weather and climate",
      "allocation of scarce resources",
      "population genetics",
      "language"
    ],
    "answer": "allocation of scarce resources"
  },
  {
    "id": "ECO035",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "A positive relationship between two variables is represented graphically by a curve that generally slopes ___.",
    "options": [
      "upward",
      "downward",
      "vertically only",
      "horizontally only"
    ],
    "answer": "upward"
  },
  {
    "id": "ECO036",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "The vertical axis of a standard demand graph normally measures ___ while the horizontal axis measures ___.",
    "options": [
      "quantity; price",
      "price; quantity",
      "income; utility",
      "utility; income"
    ],
    "answer": "price; quantity"
  },
  {
    "id": "ECO037",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "A table showing different quantities demanded at different prices is called a ___ schedule.",
    "options": [
      "supply",
      "demand",
      "production",
      "cost"
    ],
    "answer": "demand"
  },
  {
    "id": "ECO038",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "The slope of a straight-line graph is calculated as ___ change divided by horizontal change.",
    "options": [
      "percentage",
      "vertical",
      "average",
      "total"
    ],
    "answer": "vertical"
  },
  {
    "id": "ECO039",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "If a graph is drawn with price on the vertical axis and quantity on the horizontal axis, the axes have been arranged according to the conventional ___ representation.",
    "options": [
      "economic",
      "accounting",
      "legal",
      "demographic"
    ],
    "answer": "economic"
  },
  {
    "id": "ECO040",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "A variable whose value is determined within a model is called an ___ variable.",
    "options": [
      "exogenous",
      "endogenous",
      "random only",
      "constant"
    ],
    "answer": "endogenous"
  },
  {
    "id": "ECO041",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "The phrase ceteris paribus means that ___ is held constant.",
    "options": [
      "everything except the variable being studied",
      "all variables simultaneously",
      "only price",
      "only income"
    ],
    "answer": "everything except the variable being studied"
  },
  {
    "id": "ECO042",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "An economic model is mainly a simplified representation used to ___.",
    "options": [
      "replace all real-world data",
      "analyze relationships",
      "eliminate assumptions",
      "avoid measurement"
    ],
    "answer": "analyze relationships"
  },
  {
    "id": "ECO043",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "A bar chart is especially useful for comparing ___ categories.",
    "options": [
      "discrete",
      "infinitely continuous",
      "only price",
      "only time"
    ],
    "answer": "discrete"
  },
  {
    "id": "ECO044",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "A percentage change is useful in economics because it allows comparison between variables measured in ___ units.",
    "options": [
      "identical",
      "different",
      "no",
      "physical only"
    ],
    "answer": "different"
  },
  {
    "id": "ECO045",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "If a curve becomes steeper while axes remain unchanged, the absolute value of its slope has ___ .",
    "options": [
      "decreased",
      "increased",
      "become zero",
      "become negative automatically"
    ],
    "answer": "increased"
  },
  {
    "id": "ECO046",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "A time-series graph is designed to show how a variable changes ___.",
    "options": [
      "across time",
      "across firms only",
      "across products only",
      "across consumers only"
    ],
    "answer": "across time"
  },
  {
    "id": "ECO047",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "The intercept of a linear equation is the value of the dependent variable when the independent variable is ___ .",
    "options": [
      "maximum",
      "zero",
      "negative",
      "one"
    ],
    "answer": "zero"
  },
  {
    "id": "ECO048",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "When economists test a hypothesis using observed data, they are applying ___ analysis.",
    "options": [
      "empirical",
      "normative",
      "traditional",
      "ethical"
    ],
    "answer": "empirical"
  },
  {
    "id": "ECO049",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "A variable measured on the horizontal axis is usually treated as the ___ variable.",
    "options": [
      "dependent",
      "independent",
      "residual",
      "nominal"
    ],
    "answer": "independent"
  },
  {
    "id": "ECO050",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "An index number measures the relative change in a variable compared with a selected ___ period.",
    "options": [
      "base",
      "future",
      "random",
      "terminal"
    ],
    "answer": "base"
  },
  {
    "id": "ECO051",
    "topic": "Methods and Tools of Economic Analysis",
    "question": "A diagram showing flows among households, firms and government is a ___ model.",
    "options": [
      "circular-flow",
      "Lorenz",
      "production",
      "indifference"
    ],
    "answer": "circular-flow"
  },
  {
    "id": "ECO052",
    "topic": "Theory of Demand",
    "question": "The law of demand states that, ceteris paribus, quantity demanded varies ___ with price.",
    "options": [
      "directly",
      "inversely",
      "randomly",
      "proportionally always"
    ],
    "answer": "inversely"
  },
  {
    "id": "ECO053",
    "topic": "Theory of Demand",
    "question": "A movement along a demand curve is caused by a change in the good's own ___.",
    "options": [
      "income",
      "price",
      "taste",
      "population"
    ],
    "answer": "price"
  },
  {
    "id": "ECO054",
    "topic": "Theory of Demand",
    "question": "An increase in consumers' income normally shifts the demand curve for a normal good to the ___.",
    "options": [
      "left",
      "right",
      "origin",
      "vertical axis"
    ],
    "answer": "right"
  },
  {
    "id": "ECO055",
    "topic": "Theory of Demand",
    "question": "If tea and coffee are substitutes, a rise in the price of coffee is likely to increase demand for ___.",
    "options": [
      "coffee",
      "tea",
      "both equally",
      "neither"
    ],
    "answer": "tea"
  },
  {
    "id": "ECO056",
    "topic": "Theory of Demand",
    "question": "If cars and petrol are complements, a substantial fall in petrol prices may increase demand for ___.",
    "options": [
      "cars",
      "petrol only",
      "bicycles only",
      "none"
    ],
    "answer": "cars"
  },
  {
    "id": "ECO057",
    "topic": "Theory of Demand",
    "question": "A Giffen good is unusual because its demand may rise when its price ___, under special income-effect conditions.",
    "options": [
      "falls",
      "rises",
      "is fixed",
      "becomes zero"
    ],
    "answer": "rises"
  },
  {
    "id": "ECO058",
    "topic": "Theory of Demand",
    "question": "An increase in population, other things equal, is likely to shift market demand for basic food ___ .",
    "options": [
      "left",
      "right",
      "downward along supply",
      "to zero"
    ],
    "answer": "right"
  },
  {
    "id": "ECO059",
    "topic": "Theory of Demand",
    "question": "A fall in the expected future price of a product may cause current demand to ___ .",
    "options": [
      "increase",
      "decrease",
      "remain impossible to determine always",
      "become perfectly elastic"
    ],
    "answer": "decrease"
  },
  {
    "id": "ECO060",
    "topic": "Theory of Demand",
    "question": "If quantity demanded changes from 80 to 100 when price falls from â¦10 to â¦8, the percentage change in quantity demanded is ___ using the original quantity as base.",
    "options": [
      "10%",
      "20%",
      "25%",
      "40%"
    ],
    "answer": "25%"
  },
  {
    "id": "ECO061",
    "topic": "Theory of Demand",
    "question": "A demand function is Qd = 60 - 2P. At P = 15, Qd equals ___.",
    "options": [
      "20",
      "30",
      "45",
      "60"
    ],
    "answer": "30"
  },
  {
    "id": "ECO062",
    "topic": "Theory of Demand",
    "question": "If Qd = 100 - 4P and Qd = 40, the price is ___.",
    "options": [
      "10",
      "15",
      "20",
      "25"
    ],
    "answer": "15"
  },
  {
    "id": "ECO063",
    "topic": "Theory of Demand",
    "question": "When consumers buy more of a good because its price falls, this is the ___ effect of a price change.",
    "options": [
      "substitution",
      "population",
      "production",
      "tax"
    ],
    "answer": "substitution"
  },
  {
    "id": "ECO064",
    "topic": "Theory of Demand",
    "question": "A rightward shift of the demand curve means that at every given price, consumers are willing to buy a ___ quantity.",
    "options": [
      "smaller",
      "larger",
      "zero",
      "fixed"
    ],
    "answer": "larger"
  },
  {
    "id": "ECO065",
    "topic": "Theory of Demand",
    "question": "Which change would shift demand for a normal good to the left?",
    "options": [
      "Rise in income",
      "Increase in population",
      "Fall in income",
      "Favourable taste"
    ],
    "answer": "Fall in income"
  },
  {
    "id": "ECO066",
    "topic": "Theory of Demand",
    "question": "If the price of a complementary good rises sharply, demand for the related good will generally ___ .",
    "options": [
      "increase",
      "decrease",
      "become perfectly elastic",
      "not respond under any condition"
    ],
    "answer": "decrease"
  },
  {
    "id": "ECO067",
    "topic": "Theory of Demand",
    "question": "A change in the number of buyers affects ___ demand rather than an individual's demand curve.",
    "options": [
      "market",
      "personal",
      "derived",
      "joint"
    ],
    "answer": "market"
  },
  {
    "id": "ECO068",
    "topic": "Theory of Demand",
    "question": "If Qd = 90 - 3P, the maximum price consumers are willing to pay when Qd is zero is ___.",
    "options": [
      "20",
      "30",
      "45",
      "90"
    ],
    "answer": "30"
  },
  {
    "id": "ECO069",
    "topic": "Theory of Demand",
    "question": "A demand curve for a necessity is often less responsive to price changes than that for a luxury because necessities have ___ substitutes.",
    "options": [
      "many close",
      "fewer close",
      "unlimited",
      "only foreign"
    ],
    "answer": "fewer close"
  },
  {
    "id": "ECO070",
    "topic": "Theory of Consumer Behaviour",
    "question": "Utility refers to the ___ a consumer derives from consuming a commodity.",
    "options": [
      "cost",
      "satisfaction",
      "price",
      "income"
    ],
    "answer": "satisfaction"
  },
  {
    "id": "ECO071",
    "topic": "Theory of Consumer Behaviour",
    "question": "Marginal utility is the additional utility obtained from consuming one more ___ of a commodity.",
    "options": [
      "unit",
      "market",
      "price",
      "income"
    ],
    "answer": "unit"
  },
  {
    "id": "ECO072",
    "topic": "Theory of Consumer Behaviour",
    "question": "The law of diminishing marginal utility states that marginal utility tends to ___ as consumption increases, ceteris paribus.",
    "options": [
      "increase indefinitely",
      "fall",
      "remain constant",
      "become price"
    ],
    "answer": "fall"
  },
  {
    "id": "ECO073",
    "topic": "Theory of Consumer Behaviour",
    "question": "If total utility rises from 40 to 52 after consuming one more unit, marginal utility is ___.",
    "options": [
      "8",
      "10",
      "12",
      "92"
    ],
    "answer": "12"
  },
  {
    "id": "ECO074",
    "topic": "Theory of Consumer Behaviour",
    "question": "Consumer equilibrium in cardinal utility analysis occurs when marginal utility per unit of money is ___ across goods.",
    "options": [
      "unequal",
      "equal",
      "zero only",
      "negative"
    ],
    "answer": "equal"
  },
  {
    "id": "ECO075",
    "topic": "Theory of Consumer Behaviour",
    "question": "If MUx/Px = 6 and MUy/Py = 4, a rational consumer should spend relatively more on ___, holding other conditions constant.",
    "options": [
      "Y",
      "X",
      "both equally",
      "neither"
    ],
    "answer": "X"
  },
  {
    "id": "ECO076",
    "topic": "Theory of Consumer Behaviour",
    "question": "An indifference curve shows combinations of two goods that give the consumer the same ___.",
    "options": [
      "income",
      "utility",
      "price",
      "cost"
    ],
    "answer": "utility"
  },
  {
    "id": "ECO077",
    "topic": "Theory of Consumer Behaviour",
    "question": "Indifference curves are normally downward sloping because a consumer must give up some of one good to obtain more of another while keeping utility ___.",
    "options": [
      "higher",
      "constant",
      "zero",
      "negative"
    ],
    "answer": "constant"
  },
  {
    "id": "ECO078",
    "topic": "Theory of Consumer Behaviour",
    "question": "The marginal rate of substitution measures the amount of one good a consumer is willing to sacrifice for an additional unit of another while keeping ___ constant.",
    "options": [
      "income",
      "utility",
      "price",
      "supply"
    ],
    "answer": "utility"
  },
  {
    "id": "ECO079",
    "topic": "Theory of Consumer Behaviour",
    "question": "A higher indifference curve generally represents ___ satisfaction, assuming standard preferences.",
    "options": [
      "lower",
      "higher",
      "zero",
      "unchanged"
    ],
    "answer": "higher"
  },
  {
    "id": "ECO080",
    "topic": "Theory of Consumer Behaviour",
    "question": "Two indifference curves cannot intersect because intersection would imply ___ preferences for the same bundle.",
    "options": [
      "consistent",
      "inconsistent",
      "zero",
      "perfectly elastic"
    ],
    "answer": "inconsistent"
  },
  {
    "id": "ECO081",
    "topic": "Theory of Consumer Behaviour",
    "question": "The budget line represents combinations of goods a consumer can afford given income and ___ prices.",
    "options": [
      "fixed",
      "market",
      "future",
      "tax"
    ],
    "answer": "market"
  },
  {
    "id": "ECO082",
    "topic": "Theory of Consumer Behaviour",
    "question": "If income rises while prices remain unchanged, the budget line shifts ___ from the origin.",
    "options": [
      "inward",
      "outward",
      "clockwise to zero",
      "vertically only"
    ],
    "answer": "outward"
  },
  {
    "id": "ECO083",
    "topic": "Theory of Consumer Behaviour",
    "question": "A fall in the price of X rotates the budget line outward toward the ___ axis, if Y's price is unchanged.",
    "options": [
      "X",
      "Y",
      "income",
      "utility"
    ],
    "answer": "X"
  },
  {
    "id": "ECO084",
    "topic": "Theory of Consumer Behaviour",
    "question": "Consumer equilibrium in indifference-curve analysis occurs where the budget line is ___ to the highest attainable indifference curve.",
    "options": [
      "parallel but separate",
      "tangent",
      "perpendicular always",
      "vertical"
    ],
    "answer": "tangent"
  },
  {
    "id": "ECO085",
    "topic": "Theory of Consumer Behaviour",
    "question": "If total utility is maximum, marginal utility of the last unit consumed is normally ___ under the standard discrete model.",
    "options": [
      "positive indefinitely",
      "zero",
      "equal to price always",
      "negative always"
    ],
    "answer": "zero"
  },
  {
    "id": "ECO086",
    "topic": "Theory of Consumer Behaviour",
    "question": "A consumer with a fixed income faces an opportunity cost because spending more on one good leaves ___ income for alternatives.",
    "options": [
      "more",
      "less",
      "unlimited",
      "equal"
    ],
    "answer": "less"
  },
  {
    "id": "ECO087",
    "topic": "Theory of Consumer Behaviour",
    "question": "A luxury good may have a high income elasticity because demand for it changes ___ when income changes.",
    "options": [
      "very little",
      "relatively strongly",
      "never",
      "only when price falls"
    ],
    "answer": "relatively strongly"
  },
  {
    "id": "ECO088",
    "topic": "Theory of Supply",
    "question": "The law of supply states that, ceteris paribus, quantity supplied tends to rise when price ___.",
    "options": [
      "falls",
      "rises",
      "is zero",
      "is controlled below cost"
    ],
    "answer": "rises"
  },
  {
    "id": "ECO089",
    "topic": "Theory of Supply",
    "question": "A movement along a supply curve is caused by a change in the product's own ___.",
    "options": [
      "price",
      "technology",
      "tax",
      "number of firms"
    ],
    "answer": "price"
  },
  {
    "id": "ECO090",
    "topic": "Theory of Supply",
    "question": "An improvement in production technology normally shifts supply to the ___.",
    "options": [
      "left",
      "right",
      "origin",
      "vertical axis"
    ],
    "answer": "right"
  },
  {
    "id": "ECO091",
    "topic": "Theory of Supply",
    "question": "An increase in the cost of raw materials tends to shift the supply curve ___.",
    "options": [
      "right",
      "left",
      "upward along itself",
      "to zero"
    ],
    "answer": "left"
  },
  {
    "id": "ECO092",
    "topic": "Theory of Supply",
    "question": "A subsidy to producers tends to shift supply to the ___, other things equal.",
    "options": [
      "left",
      "right",
      "origin",
      "vertical axis"
    ],
    "answer": "right"
  },
  {
    "id": "ECO093",
    "topic": "Theory of Supply",
    "question": "An increase in the number of firms in an industry generally increases ___ supply.",
    "options": [
      "market",
      "individual",
      "fixed",
      "joint"
    ],
    "answer": "market"
  },
  {
    "id": "ECO094",
    "topic": "Theory of Supply",
    "question": "If Qs = 20 + 3P, quantity supplied at P = 10 is ___.",
    "options": [
      "30",
      "40",
      "50",
      "60"
    ],
    "answer": "50"
  },
  {
    "id": "ECO095",
    "topic": "Theory of Supply",
    "question": "If Qs = -10 + 2P, the price required for Qs = 30 is ___.",
    "options": [
      "10",
      "20",
      "30",
      "40"
    ],
    "answer": "20"
  },
  {
    "id": "ECO096",
    "topic": "Theory of Supply",
    "question": "A decrease in expected future prices may encourage producers to supply ___ today.",
    "options": [
      "more",
      "less",
      "the same regardless",
      "zero"
    ],
    "answer": "more"
  },
  {
    "id": "ECO097",
    "topic": "Theory of Supply",
    "question": "A per-unit tax imposed on producers tends to shift the supply curve ___ because production becomes more costly.",
    "options": [
      "right",
      "left",
      "downward only",
      "to the origin"
    ],
    "answer": "left"
  },
  {
    "id": "ECO098",
    "topic": "Theory of Supply",
    "question": "The supply of agricultural products is often less flexible in the very short run because output depends on ___ factors.",
    "options": [
      "biological",
      "monetary",
      "legal only",
      "foreign exchange only"
    ],
    "answer": "biological"
  },
  {
    "id": "ECO099",
    "topic": "Theory of Supply",
    "question": "An increase in productivity tends to reduce unit cost and therefore can increase ___ at each price.",
    "options": [
      "supply",
      "demand only",
      "utility",
      "population"
    ],
    "answer": "supply"
  },
  {
    "id": "ECO100",
    "topic": "Theory of Supply",
    "question": "If Qs rises from 50 to 70 when price rises from â¦5 to â¦7, the absolute change in quantity supplied is ___.",
    "options": [
      "10",
      "20",
      "25",
      "40"
    ],
    "answer": "20"
  },
  {
    "id": "ECO101",
    "topic": "Theory of Supply",
    "question": "A supply curve that is perfectly inelastic is represented by a ___ line.",
    "options": [
      "horizontal",
      "vertical",
      "downward-sloping",
      "45-degree"
    ],
    "answer": "vertical"
  },
  {
    "id": "ECO102",
    "topic": "Theory of Supply",
    "question": "A perfectly elastic supply curve is represented by a ___ line at a given price.",
    "options": [
      "vertical",
      "horizontal",
      "upward-sloping",
      "downward"
    ],
    "answer": "horizontal"
  },
  {
    "id": "ECO103",
    "topic": "Theory of Supply",
    "question": "The supply of labour can be affected by changes in wages, population and the ___ of working conditions.",
    "options": [
      "quality",
      "price of output only",
      "national debt only",
      "exchange rate only"
    ],
    "answer": "quality"
  },
  {
    "id": "ECO104",
    "topic": "Theory of Supply",
    "question": "If firms can easily enter an industry when prices rise, market supply is likely to be more ___ in the long run.",
    "options": [
      "inelastic",
      "elastic",
      "perfectly inelastic",
      "fixed"
    ],
    "answer": "elastic"
  },
  {
    "id": "ECO105",
    "topic": "Theory of Supply",
    "question": "A fall in the price of an input, other things equal, causes the supply curve for the final product to shift ___.",
    "options": [
      "left",
      "right",
      "nowhere",
      "vertically to zero"
    ],
    "answer": "right"
  },
  {
    "id": "ECO106",
    "topic": "Theory of Price Determination",
    "question": "Market equilibrium occurs where quantity demanded is ___ quantity supplied.",
    "options": [
      "greater than",
      "less than",
      "equal to",
      "unrelated to"
    ],
    "answer": "equal to"
  },
  {
    "id": "ECO107",
    "topic": "Theory of Price Determination",
    "question": "If demand exceeds supply at the current price, the market experiences a ___.",
    "options": [
      "surplus",
      "shortage",
      "equilibrium",
      "deflation"
    ],
    "answer": "shortage"
  },
  {
    "id": "ECO108",
    "topic": "Theory of Price Determination",
    "question": "If supply exceeds demand, there is a ___ which tends to put downward pressure on price.",
    "options": [
      "shortage",
      "surplus",
      "deficit",
      "boom"
    ],
    "answer": "surplus"
  },
  {
    "id": "ECO109",
    "topic": "Theory of Price Determination",
    "question": "Given Qd = 100 - 2P and Qs = 20 + 2P, equilibrium price is ___.",
    "options": [
      "10",
      "20",
      "30",
      "40"
    ],
    "answer": "20"
  },
  {
    "id": "ECO110",
    "topic": "Theory of Price Determination",
    "question": "Using Qd = 100 - 2P and Qs = 20 + 2P, equilibrium quantity is ___.",
    "options": [
      "40",
      "50",
      "60",
      "80"
    ],
    "answer": "60"
  },
  {
    "id": "ECO111",
    "topic": "Theory of Price Determination",
    "question": "A maximum legal price set below equilibrium price is called a ___.",
    "options": [
      "price floor",
      "price ceiling",
      "subsidy",
      "tariff"
    ],
    "answer": "price ceiling"
  },
  {
    "id": "ECO112",
    "topic": "Theory of Price Determination",
    "question": "A minimum legal price set above equilibrium price is called a ___.",
    "options": [
      "price ceiling",
      "price floor",
      "quota",
      "tax rebate"
    ],
    "answer": "price floor"
  },
  {
    "id": "ECO113",
    "topic": "Theory of Price Determination",
    "question": "Rent control is an example of ___ price legislation when the legal rent is below the market equilibrium.",
    "options": [
      "minimum",
      "maximum",
      "flexible",
      "floating"
    ],
    "answer": "maximum"
  },
  {
    "id": "ECO114",
    "topic": "Theory of Price Determination",
    "question": "A guaranteed minimum price for agricultural products above equilibrium can create a ___ if government does not purchase the excess.",
    "options": [
      "shortage",
      "surplus",
      "blackout",
      "deflation"
    ],
    "answer": "surplus"
  },
  {
    "id": "ECO115",
    "topic": "Theory of Price Determination",
    "question": "If both demand and supply increase, equilibrium quantity will definitely ___, while the direction of price depends on relative shifts.",
    "options": [
      "fall",
      "rise",
      "be zero",
      "remain fixed"
    ],
    "answer": "rise"
  },
  {
    "id": "ECO116",
    "topic": "Theory of Price Determination",
    "question": "A simultaneous fall in demand and supply will definitely reduce equilibrium ___, while the price effect is ambiguous.",
    "options": [
      "quantity",
      "scarcity",
      "income",
      "utility"
    ],
    "answer": "quantity"
  },
  {
    "id": "ECO117",
    "topic": "Theory of Price Determination",
    "question": "When demand increases and supply remains constant, equilibrium price and quantity generally ___.",
    "options": [
      "fall; fall",
      "rise; rise",
      "rise; fall",
      "fall; rise"
    ],
    "answer": "rise; rise"
  },
  {
    "id": "ECO118",
    "topic": "Theory of Price Determination",
    "question": "When supply increases and demand remains constant, equilibrium price generally ___ and quantity ___.",
    "options": [
      "rises; falls",
      "falls; rises",
      "rises; rises",
      "falls; falls"
    ],
    "answer": "falls; rises"
  },
  {
    "id": "ECO119",
    "topic": "Theory of Price Determination",
    "question": "A government tax on a product creates a wedge between the price paid by consumers and the price ___ by producers.",
    "options": [
      "ignored",
      "received",
      "advertised",
      "forecast"
    ],
    "answer": "received"
  },
  {
    "id": "ECO120",
    "topic": "Theory of Price Determination",
    "question": "The incidence of a tax depends partly on the relative ___ of demand and supply.",
    "options": [
      "elasticities",
      "incomes",
      "populations",
      "tax rates only"
    ],
    "answer": "elasticities"
  },
  {
    "id": "ECO121",
    "topic": "Theory of Price Determination",
    "question": "A black market may arise when a binding price ceiling creates a persistent ___.",
    "options": [
      "surplus",
      "shortage",
      "equilibrium",
      "subsidy"
    ],
    "answer": "shortage"
  },
  {
    "id": "ECO122",
    "topic": "Theory of Price Determination",
    "question": "A price floor below equilibrium is generally ___ because it does not constrain the market outcome.",
    "options": [
      "binding",
      "non-binding",
      "inflationary by definition",
      "a quota"
    ],
    "answer": "non-binding"
  },
  {
    "id": "ECO123",
    "topic": "Theory of Price Determination",
    "question": "If equilibrium price is â¦50 and government sets a binding maximum price of â¦35, the legal price is ___ the equilibrium price.",
    "options": [
      "above",
      "below",
      "equal to",
      "unrelated to"
    ],
    "answer": "below"
  },
  {
    "id": "ECO124",
    "topic": "Theory of Production",
    "question": "Total product is the total quantity of output produced by a given quantity of a ___ input combination.",
    "options": [
      "factor",
      "price",
      "tax",
      "consumer"
    ],
    "answer": "factor"
  },
  {
    "id": "ECO125",
    "topic": "Theory of Production",
    "question": "Average product of labour is calculated as total product divided by quantity of ___.",
    "options": [
      "capital",
      "labour",
      "output price",
      "revenue"
    ],
    "answer": "labour"
  },
  {
    "id": "ECO126",
    "topic": "Theory of Production",
    "question": "Marginal product is the change in total product resulting from one additional unit of a ___ input.",
    "options": [
      "fixed",
      "variable",
      "selling",
      "foreign"
    ],
    "answer": "variable"
  },
  {
    "id": "ECO127",
    "topic": "Theory of Production",
    "question": "If TP rises from 120 to 135 when one more worker is employed, the marginal product of that worker is ___.",
    "options": [
      "10",
      "15",
      "20",
      "255"
    ],
    "answer": "15"
  },
  {
    "id": "ECO128",
    "topic": "Theory of Production",
    "question": "If 5 workers produce 100 units, average product of labour is ___.",
    "options": [
      "5",
      "10",
      "20",
      "25"
    ],
    "answer": "20"
  },
  {
    "id": "ECO129",
    "topic": "Theory of Production",
    "question": "The law of variable proportions applies when at least one factor is ___ in the short run.",
    "options": [
      "variable",
      "fixed",
      "foreign",
      "free"
    ],
    "answer": "fixed"
  },
  {
    "id": "ECO130",
    "topic": "Theory of Production",
    "question": "When marginal product is greater than average product, average product tends to ___.",
    "options": [
      "rise",
      "fall",
      "remain fixed",
      "become zero"
    ],
    "answer": "rise"
  },
  {
    "id": "ECO131",
    "topic": "Theory of Production",
    "question": "Average product is maximized when marginal product is ___ average product.",
    "options": [
      "greater than",
      "equal to",
      "less than",
      "unrelated to"
    ],
    "answer": "equal to"
  },
  {
    "id": "ECO132",
    "topic": "Theory of Production",
    "question": "When marginal product becomes zero, total product is at its ___.",
    "options": [
      "minimum",
      "maximum",
      "initial point",
      "constant negative"
    ],
    "answer": "maximum"
  },
  {
    "id": "ECO133",
    "topic": "Theory of Production",
    "question": "Negative marginal product implies that adding more of the variable factor causes total product to ___.",
    "options": [
      "rise",
      "fall",
      "remain fixed",
      "double"
    ],
    "answer": "fall"
  },
  {
    "id": "ECO134",
    "topic": "Theory of Production",
    "question": "Division of labour can raise productivity mainly through increased ___ and specialization.",
    "options": [
      "skill",
      "scarcity",
      "taxation",
      "inflation"
    ],
    "answer": "skill"
  },
  {
    "id": "ECO135",
    "topic": "Theory of Production",
    "question": "An economy of scale occurs when long-run average cost ___ as output expands.",
    "options": [
      "rises",
      "falls",
      "becomes infinite",
      "is fixed by law"
    ],
    "answer": "falls"
  },
  {
    "id": "ECO136",
    "topic": "Theory of Production",
    "question": "Internal economies of scale arise from expansion of the ___ firm.",
    "options": [
      "individual",
      "entire industry",
      "government only",
      "foreign sector"
    ],
    "answer": "individual"
  },
  {
    "id": "ECO137",
    "topic": "Theory of Production",
    "question": "External economies of scale arise from growth of the ___ in which firms operate.",
    "options": [
      "industry",
      "household",
      "currency",
      "tax office"
    ],
    "answer": "industry"
  },
  {
    "id": "ECO138",
    "topic": "Theory of Production",
    "question": "An isoquant represents combinations of inputs that produce the same level of ___.",
    "options": [
      "utility",
      "output",
      "profit price",
      "income"
    ],
    "answer": "output"
  },
  {
    "id": "ECO139",
    "topic": "Theory of Production",
    "question": "An isocost line shows combinations of inputs that cost the firm the same total ___.",
    "options": [
      "revenue",
      "amount",
      "output",
      "utility"
    ],
    "answer": "amount"
  },
  {
    "id": "ECO140",
    "topic": "Theory of Production",
    "question": "Producer equilibrium using isoquant-isocost analysis occurs where an isoquant is tangent to the ___ line.",
    "options": [
      "demand",
      "isocost",
      "revenue",
      "budget"
    ],
    "answer": "isocost"
  },
  {
    "id": "ECO141",
    "topic": "Theory of Production",
    "question": "A production function describes the relationship between inputs and ___.",
    "options": [
      "output",
      "tax",
      "interest",
      "population"
    ],
    "answer": "output"
  },
  {
    "id": "ECO142",
    "topic": "Theory of Costs and Revenue",
    "question": "Fixed cost is a cost that does not vary with output in the ___ run.",
    "options": [
      "short",
      "long",
      "very long only",
      "market"
    ],
    "answer": "short"
  },
  {
    "id": "ECO143",
    "topic": "Theory of Costs and Revenue",
    "question": "Variable cost changes as the level of ___ changes.",
    "options": [
      "output",
      "ownership",
      "population only",
      "tax law"
    ],
    "answer": "output"
  },
  {
    "id": "ECO144",
    "topic": "Theory of Costs and Revenue",
    "question": "If fixed cost is â¦20,000 and variable cost is â¦30,000, total cost is ___.",
    "options": [
      "â¦10,000",
      "â¦30,000",
      "â¦50,000",
      "â¦60,000"
    ],
    "answer": "â¦50,000"
  },
  {
    "id": "ECO145",
    "topic": "Theory of Costs and Revenue",
    "question": "Average total cost is total cost divided by ___.",
    "options": [
      "price",
      "output",
      "fixed cost",
      "revenue"
    ],
    "answer": "output"
  },
  {
    "id": "ECO146",
    "topic": "Theory of Costs and Revenue",
    "question": "If total cost is â¦90,000 at 3,000 units, average total cost is ___.",
    "options": [
      "â¦20",
      "â¦30",
      "â¦60",
      "â¦90"
    ],
    "answer": "â¦30"
  },
  {
    "id": "ECO147",
    "topic": "Theory of Costs and Revenue",
    "question": "Marginal cost is the change in total cost resulting from a change in ___.",
    "options": [
      "output",
      "income tax",
      "population",
      "price only"
    ],
    "answer": "output"
  },
  {
    "id": "ECO148",
    "topic": "Theory of Costs and Revenue",
    "question": "If total cost rises from â¦50,000 to â¦56,000 when output rises by 200 units, marginal cost is ___.",
    "options": [
      "â¦20",
      "â¦30",
      "â¦40",
      "â¦60"
    ],
    "answer": "â¦30"
  },
  {
    "id": "ECO149",
    "topic": "Theory of Costs and Revenue",
    "question": "Total revenue is calculated as price multiplied by ___.",
    "options": [
      "quantity sold",
      "fixed cost",
      "average cost",
      "profit"
    ],
    "answer": "quantity sold"
  },
  {
    "id": "ECO150",
    "topic": "Theory of Costs and Revenue",
    "question": "If a firm sells 500 units at â¦80 each, total revenue is ___.",
    "options": [
      "â¦4,000",
      "â¦40,000",
      "â¦80,000",
      "â¦400,000"
    ],
    "answer": "â¦40,000"
  },
  {
    "id": "ECO151",
    "topic": "Theory of Costs and Revenue",
    "question": "Average revenue equals total revenue divided by ___.",
    "options": [
      "quantity sold",
      "fixed cost",
      "profit",
      "price"
    ],
    "answer": "quantity sold"
  },
  {
    "id": "ECO152",
    "topic": "Theory of Costs and Revenue",
    "question": "Marginal revenue is the change in total revenue resulting from selling one additional ___ unit.",
    "options": [
      "input",
      "output",
      "tax",
      "capital"
    ],
    "answer": "output"
  },
  {
    "id": "ECO153",
    "topic": "Theory of Costs and Revenue",
    "question": "Economic cost includes explicit costs plus ___ costs of owned resources.",
    "options": [
      "implicit",
      "fixed only",
      "tax only",
      "sunk only"
    ],
    "answer": "implicit"
  },
  {
    "id": "ECO154",
    "topic": "Theory of Costs and Revenue",
    "question": "An accountant's profit generally subtracts ___ costs from total revenue.",
    "options": [
      "explicit",
      "implicit",
      "opportunity only",
      "social"
    ],
    "answer": "explicit"
  },
  {
    "id": "ECO155",
    "topic": "Theory of Costs and Revenue",
    "question": "Economic profit is total revenue minus ___ cost.",
    "options": [
      "accounting",
      "economic",
      "fixed only",
      "variable only"
    ],
    "answer": "economic"
  },
  {
    "id": "ECO156",
    "topic": "Theory of Costs and Revenue",
    "question": "If total revenue is â¦200,000 and economic cost is â¦170,000, economic profit is ___.",
    "options": [
      "â¦20,000",
      "â¦30,000",
      "â¦170,000",
      "â¦370,000"
    ],
    "answer": "â¦30,000"
  },
  {
    "id": "ECO157",
    "topic": "Theory of Costs and Revenue",
    "question": "The short-run marginal cost curve intersects the average variable cost curve at its ___ point.",
    "options": [
      "maximum",
      "minimum",
      "highest price",
      "zero"
    ],
    "answer": "minimum"
  },
  {
    "id": "ECO158",
    "topic": "Theory of Costs and Revenue",
    "question": "For a perfectly competitive firm, the short-run supply curve is the portion of its marginal cost curve above the minimum point of ___ cost.",
    "options": [
      "average variable",
      "average fixed",
      "total",
      "implicit"
    ],
    "answer": "average variable"
  },
  {
    "id": "ECO159",
    "topic": "Theory of Costs and Revenue",
    "question": "Break-even occurs when total revenue equals total ___.",
    "options": [
      "cost",
      "profit",
      "output",
      "tax"
    ],
    "answer": "cost"
  },
  {
    "id": "ECO160",
    "topic": "Market Structures",
    "question": "A perfectly competitive market is characterized by a large number of buyers and sellers and ___ products.",
    "options": [
      "identical",
      "highly differentiated",
      "unique",
      "patented"
    ],
    "answer": "identical"
  },
  {
    "id": "ECO161",
    "topic": "Market Structures",
    "question": "A perfectly competitive firm is a price ___ because its individual output is too small to influence market price.",
    "options": [
      "maker",
      "taker",
      "controller",
      "discriminator"
    ],
    "answer": "taker"
  },
  {
    "id": "ECO162",
    "topic": "Market Structures",
    "question": "In perfect competition, the firm's demand curve is horizontal at the market price because demand is perfectly ___.",
    "options": [
      "inelastic",
      "elastic",
      "unitary",
      "negative"
    ],
    "answer": "elastic"
  },
  {
    "id": "ECO163",
    "topic": "Market Structures",
    "question": "For a profit-maximizing competitive firm, equilibrium output occurs where marginal cost equals marginal ___.",
    "options": [
      "utility",
      "revenue",
      "cost",
      "product"
    ],
    "answer": "revenue"
  },
  {
    "id": "ECO164",
    "topic": "Market Structures",
    "question": "A monopoly is a market with ___ seller.",
    "options": [
      "one",
      "two",
      "many",
      "no"
    ],
    "answer": "one"
  },
  {
    "id": "ECO165",
    "topic": "Market Structures",
    "question": "A major source of monopoly power is a legal ___ that prevents entry.",
    "options": [
      "barrier",
      "subsidy to consumers",
      "demand curve",
      "budget line"
    ],
    "answer": "barrier"
  },
  {
    "id": "ECO166",
    "topic": "Market Structures",
    "question": "Price discrimination involves charging different prices to consumers for reasons not fully explained by differences in ___ costs.",
    "options": [
      "production",
      "population",
      "weather",
      "money supply"
    ],
    "answer": "production"
  },
  {
    "id": "ECO167",
    "topic": "Market Structures",
    "question": "For price discrimination to work, a monopolist generally needs some ability to prevent ___ between consumer groups.",
    "options": [
      "arbitrage",
      "production",
      "saving",
      "taxation"
    ],
    "answer": "arbitrage"
  },
  {
    "id": "ECO168",
    "topic": "Market Structures",
    "question": "Monopolistic competition combines many firms with product ___ and relatively free entry.",
    "options": [
      "differentiation",
      "standardization",
      "rationing",
      "ownership by government"
    ],
    "answer": "differentiation"
  },
  {
    "id": "ECO169",
    "topic": "Market Structures",
    "question": "An oligopoly is characterized by a small number of firms whose decisions are ___ .",
    "options": [
      "independent and unrelated",
      "interdependent",
      "controlled by households",
      "always identical"
    ],
    "answer": "interdependent"
  },
  {
    "id": "ECO170",
    "topic": "Market Structures",
    "question": "A cartel is an agreement among firms to coordinate output or ___ .",
    "options": [
      "prices",
      "population",
      "tax rates",
      "weather"
    ],
    "answer": "prices"
  },
  {
    "id": "ECO171",
    "topic": "Market Structures",
    "question": "In the long run, a perfectly competitive firm tends to earn only ___ profit under free entry and exit.",
    "options": [
      "normal",
      "unlimited",
      "negative",
      "monopoly"
    ],
    "answer": "normal"
  },
  {
    "id": "ECO172",
    "topic": "Market Structures",
    "question": "A monopolist faces a downward-sloping demand curve, so marginal revenue is generally ___ average revenue.",
    "options": [
      "above",
      "below",
      "equal to",
      "unrelated to"
    ],
    "answer": "below"
  },
  {
    "id": "ECO173",
    "topic": "Market Structures",
    "question": "A monopolist maximizes profit where marginal revenue equals marginal ___ .",
    "options": [
      "utility",
      "cost",
      "product",
      "income"
    ],
    "answer": "cost"
  },
  {
    "id": "ECO174",
    "topic": "Market Structures",
    "question": "A firm should shut down in the short run when price is below minimum ___ cost.",
    "options": [
      "average variable",
      "average fixed",
      "total fixed",
      "implicit"
    ],
    "answer": "average variable"
  },
  {
    "id": "ECO175",
    "topic": "Market Structures",
    "question": "A firm breaks even when price equals average ___ cost at the profit-maximizing output.",
    "options": [
      "total",
      "variable",
      "fixed",
      "marginal only"
    ],
    "answer": "total"
  },
  {
    "id": "ECO176",
    "topic": "Market Structures",
    "question": "Excess capacity is commonly associated with long-run equilibrium in ___ competition.",
    "options": [
      "perfect",
      "monopolistic",
      "pure",
      "government"
    ],
    "answer": "monopolistic"
  },
  {
    "id": "ECO177",
    "topic": "Market Structures",
    "question": "The kinked-demand model is commonly used to explain price rigidity in some ___ markets.",
    "options": [
      "oligopolistic",
      "perfectly competitive",
      "traditional",
      "subsistence"
    ],
    "answer": "oligopolistic"
  },
  {
    "id": "ECO178",
    "topic": "National Income",
    "question": "GDP measures the market value of final goods and services produced ___ a country's borders during a period.",
    "options": [
      "outside",
      "within",
      "only by citizens outside",
      "only by government"
    ],
    "answer": "within"
  },
  {
    "id": "ECO179",
    "topic": "National Income",
    "question": "GNP equals GDP plus net ___ income from abroad.",
    "options": [
      "factor",
      "tax",
      "transfer",
      "consumer"
    ],
    "answer": "factor"
  },
  {
    "id": "ECO180",
    "topic": "National Income",
    "question": "NNP is obtained by subtracting ___ from GNP.",
    "options": [
      "depreciation",
      "exports",
      "imports",
      "indirect taxes"
    ],
    "answer": "depreciation"
  },
  {
    "id": "ECO181",
    "topic": "National Income",
    "question": "If GDP is â¦20 trillion and depreciation is â¦2 trillion, NDP is ___.",
    "options": [
      "â¦18 trillion",
      "â¦20 trillion",
      "â¦22 trillion",
      "â¦40 trillion"
    ],
    "answer": "â¦18 trillion"
  },
  {
    "id": "ECO182",
    "topic": "National Income",
    "question": "If GNP is â¦30 trillion and depreciation is â¦3 trillion, NNP is ___.",
    "options": [
      "â¦27 trillion",
      "â¦30 trillion",
      "â¦33 trillion",
      "â¦10 trillion"
    ],
    "answer": "â¦27 trillion"
  },
  {
    "id": "ECO183",
    "topic": "National Income",
    "question": "The expenditure approach to national income sums consumption, investment, government expenditure and net ___.",
    "options": [
      "exports",
      "taxes",
      "savings",
      "imports"
    ],
    "answer": "exports"
  },
  {
    "id": "ECO184",
    "topic": "National Income",
    "question": "If C=â¦500bn, I=â¦200bn, G=â¦150bn and X-M=â¦50bn, GDP by expenditure is ___.",
    "options": [
      "â¦750bn",
      "â¦850bn",
      "â¦900bn",
      "â¦950bn"
    ],
    "answer": "â¦900bn"
  },
  {
    "id": "ECO185",
    "topic": "National Income",
    "question": "Double counting occurs when the value of ___ goods is included along with the value of final goods.",
    "options": [
      "intermediate",
      "capital",
      "exported",
      "consumer"
    ],
    "answer": "intermediate"
  },
  {
    "id": "ECO186",
    "topic": "National Income",
    "question": "The income method measures national income by summing factor incomes such as wages, rent, interest and ___.",
    "options": [
      "profit",
      "consumption",
      "imports",
      "depreciation"
    ],
    "answer": "profit"
  },
  {
    "id": "ECO187",
    "topic": "National Income",
    "question": "Per capita income is national income divided by the ___.",
    "options": [
      "price level",
      "population",
      "labour force only",
      "GDP"
    ],
    "answer": "population"
  },
  {
    "id": "ECO188",
    "topic": "National Income",
    "question": "If national income is â¦12 trillion and population is 60 million, per capita income is ___ approximately.",
    "options": [
      "â¦20,000",
      "â¦200,000",
      "â¦2,000,000",
      "â¦72,000"
    ],
    "answer": "â¦200,000"
  },
  {
    "id": "ECO189",
    "topic": "National Income",
    "question": "The circular flow model shows the continuous movement of income, output and ___ between economic units.",
    "options": [
      "expenditure",
      "scarcity",
      "utility",
      "technology"
    ],
    "answer": "expenditure"
  },
  {
    "id": "ECO190",
    "topic": "National Income",
    "question": "In a simple two-sector economy, households provide factors to firms and receive ___ in return.",
    "options": [
      "factor incomes",
      "tax refunds only",
      "imports",
      "subsidies only"
    ],
    "answer": "factor incomes"
  },
  {
    "id": "ECO191",
    "topic": "National Income",
    "question": "The marginal propensity to consume plus marginal propensity to save equals ___.",
    "options": [
      "0",
      "0.5",
      "1",
      "2"
    ],
    "answer": "1"
  },
  {
    "id": "ECO192",
    "topic": "National Income",
    "question": "If MPC is 0.75, the simple expenditure multiplier is ___.",
    "options": [
      "2",
      "3",
      "4",
      "5"
    ],
    "answer": "4"
  },
  {
    "id": "ECO193",
    "topic": "National Income",
    "question": "If the multiplier is 5 and autonomous investment increases by â¦10bn, equilibrium income increases by ___.",
    "options": [
      "â¦15bn",
      "â¦30bn",
      "â¦50bn",
      "â¦100bn"
    ],
    "answer": "â¦50bn"
  },
  {
    "id": "ECO194",
    "topic": "National Income",
    "question": "A rise in savings with no corresponding rise in investment can reduce aggregate ___ in the short run.",
    "options": [
      "demand",
      "supply capacity",
      "population",
      "labour productivity"
    ],
    "answer": "demand"
  },
  {
    "id": "ECO195",
    "topic": "National Income",
    "question": "Nominal GDP differs from real GDP because nominal GDP is measured at ___ prices.",
    "options": [
      "base-year",
      "current",
      "constant",
      "zero"
    ],
    "answer": "current"
  },
  {
    "id": "ECO196",
    "topic": "Money and Inflation",
    "question": "The primary function of money that allows goods to be exchanged without barter is medium of ___.",
    "options": [
      "exchange",
      "production",
      "taxation",
      "saving only"
    ],
    "answer": "exchange"
  },
  {
    "id": "ECO197",
    "topic": "Money and Inflation",
    "question": "Money serves as a unit of account because it provides a common measure of ___ .",
    "options": [
      "value",
      "population",
      "weather",
      "output only"
    ],
    "answer": "value"
  },
  {
    "id": "ECO198",
    "topic": "Money and Inflation",
    "question": "A good serving as a store of value should retain purchasing power reasonably well over ___.",
    "options": [
      "time",
      "one transaction only",
      "one minute",
      "one price change"
    ],
    "answer": "time"
  },
  {
    "id": "ECO199",
    "topic": "Money and Inflation",
    "question": "Fiat money has value mainly because it is declared acceptable as ___ by the issuing authority and is trusted by users.",
    "options": [
      "legal tender",
      "capital equipment",
      "foreign exchange",
      "commodity input"
    ],
    "answer": "legal tender"
  },
  {
    "id": "ECO200",
    "topic": "Money and Inflation",
    "question": "The quantity theory equation is commonly expressed as MV = ___ .",
    "options": [
      "PT",
      "MP",
      "CV",
      "TR"
    ],
    "answer": "PT"
  },
  {
    "id": "ECO201",
    "topic": "Money and Inflation",
    "question": "If M=â¦100bn, V=4 and T=200bn units, the implied price level P is ___.",
    "options": [
      "0.5",
      "1",
      "2",
      "4"
    ],
    "answer": "2"
  },
  {
    "id": "ECO202",
    "topic": "Money and Inflation",
    "question": "Inflation is a sustained increase in the general ___ level.",
    "options": [
      "price",
      "output",
      "employment",
      "population"
    ],
    "answer": "price"
  },
  {
    "id": "ECO203",
    "topic": "Money and Inflation",
    "question": "Demand-pull inflation occurs when aggregate demand grows faster than the economy's productive ___ .",
    "options": [
      "capacity",
      "population",
      "imports",
      "tax revenue"
    ],
    "answer": "capacity"
  },
  {
    "id": "ECO204",
    "topic": "Money and Inflation",
    "question": "Cost-push inflation may result from a sharp rise in ___ costs.",
    "options": [
      "production",
      "consumer utility",
      "population density",
      "saving"
    ],
    "answer": "production"
  },
  {
    "id": "ECO205",
    "topic": "Money and Inflation",
    "question": "A consumer price index rising from 120 to 132 represents an inflation rate of ___ over the period.",
    "options": [
      "5%",
      "10%",
      "12%",
      "20%"
    ],
    "answer": "10%"
  },
  {
    "id": "ECO206",
    "topic": "Money and Inflation",
    "question": "One major effect of unexpected inflation is redistribution of income between ___ and creditors.",
    "options": [
      "debtors",
      "exporters",
      "producers only",
      "tax collectors"
    ],
    "answer": "debtors"
  },
  {
    "id": "ECO207",
    "topic": "Money and Inflation",
    "question": "A policy of reducing the growth of money supply can be used to ___ inflationary pressure.",
    "options": [
      "increase",
      "reduce",
      "ignore",
      "create"
    ],
    "answer": "reduce"
  },
  {
    "id": "ECO208",
    "topic": "Money and Inflation",
    "question": "Deflation is a sustained fall in the general ___ level.",
    "options": [
      "price",
      "output",
      "money supply only",
      "population"
    ],
    "answer": "price"
  },
  {
    "id": "ECO209",
    "topic": "Money and Inflation",
    "question": "Inflation caused by excessive increases in aggregate demand is classified as ___ inflation.",
    "options": [
      "demand-pull",
      "cost-push",
      "structural",
      "imported only"
    ],
    "answer": "demand-pull"
  },
  {
    "id": "ECO210",
    "topic": "Money and Inflation",
    "question": "If the nominal interest rate is 15% and inflation is approximately 10%, the real interest rate is approximately ___.",
    "options": [
      "5%",
      "10%",
      "15%",
      "25%"
    ],
    "answer": "5%"
  },
  {
    "id": "ECO211",
    "topic": "Money and Inflation",
    "question": "A fall in the purchasing power of money means that the same amount of money buys ___ goods and services.",
    "options": [
      "more",
      "fewer",
      "exactly double",
      "the same always"
    ],
    "answer": "fewer"
  },
  {
    "id": "ECO212",
    "topic": "Money and Inflation",
    "question": "One reason moderate inflation may complicate planning is that it creates uncertainty about future ___ .",
    "options": [
      "prices and costs",
      "population only",
      "weather",
      "geography"
    ],
    "answer": "prices and costs"
  },
  {
    "id": "ECO213",
    "topic": "Money and Inflation",
    "question": "Velocity of money refers to the average number of times a unit of money is used in ___ during a period.",
    "options": [
      "transactions",
      "production only",
      "tax collection only",
      "exports only"
    ],
    "answer": "transactions"
  },
  {
    "id": "ECO214",
    "topic": "Financial Institutions",
    "question": "The central bank's traditional role includes issuing ___ currency.",
    "options": [
      "legal",
      "foreign",
      "private",
      "commodity"
    ],
    "answer": "legal"
  },
{
    "id": "ECO215",
    "topic": "Financial Institutions",
    "question": "The central bank acts as lender of last resort mainly to provide emergency liquidity to ___ banks.",
    "options": [
      "commercial",
      "household",
      "retail consumers",
      "farmers only"
    ],
    "answer": "commercial"
  },
  {
    "id": "ECO216",
    "topic": "Financial Institutions",
    "question": "Open market operations involve the central bank buying or selling government ___ .",
    "options": [
      "securities",
      "farmland",
      "houses",
      "consumer goods"
    ],
    "answer": "securities"
  },
  {
    "id": "ECO217",
    "topic": "Financial Institutions",
    "question": "An increase in reserve requirements generally reduces the ability of commercial banks to ___ credit.",
    "options": [
      "create",
      "destroy",
      "tax",
      "export"
    ],
    "answer": "create"
  },
  {
    "id": "ECO218",
    "topic": "Financial Institutions",
    "question": "A reduction in the policy/discount rate generally makes borrowing from the banking system ___, other things equal.",
    "options": [
      "more expensive",
      "less expensive",
      "impossible",
      "unchanged by definition"
    ],
    "answer": "less expensive"
  },
  {
    "id": "ECO219",
    "topic": "Financial Institutions",
    "question": "Commercial banks accept deposits and provide loans, thereby facilitating ___ creation.",
    "options": [
      "credit",
      "tax",
      "population",
      "land"
    ],
    "answer": "credit"
  },
  {
    "id": "ECO220",
    "topic": "Financial Institutions",
    "question": "A bank's liquid assets are those that can be converted into cash relatively ___ .",
    "options": [
      "quickly",
      "never",
      "only after ten years",
      "at zero cost always"
    ],
    "answer": "quickly"
  },
  {
    "id": "ECO221",
    "topic": "Financial Institutions",
    "question": "The money market mainly deals in relatively ___ term financial instruments.",
    "options": [
      "short",
      "long",
      "perpetual",
      "intergenerational"
    ],
    "answer": "short"
  },
  {
    "id": "ECO222",
    "topic": "Financial Institutions",
    "question": "The capital market mainly provides funds for ___ term investment.",
    "options": [
      "long",
      "very short",
      "daily",
      "overnight only"
    ],
    "answer": "long"
  },
  {
    "id": "ECO223",
    "topic": "Financial Institutions",
    "question": "Insurance companies primarily provide protection against specified ___ risks in return for premiums.",
    "options": [
      "financial",
      "population",
      "weather only",
      "political only"
    ],
    "answer": "financial"
  },
  {
    "id": "ECO224",
    "topic": "Financial Institutions",
    "question": "A mortgage bank specializes in financing the purchase or development of ___ property.",
    "options": [
      "real estate",
      "consumer food",
      "foreign currency",
      "shares only"
    ],
    "answer": "real estate"
  },
  {
    "id": "ECO225",
    "topic": "Financial Institutions",
    "question": "A merchant bank traditionally provides services such as corporate finance and ___ services.",
    "options": [
      "investment",
      "weather",
      "household farming",
      "retail grocery"
    ],
    "answer": "investment"
  },
  {
    "id": "ECO226",
    "topic": "Financial Institutions",
    "question": "A building society is particularly associated with savings and ___ finance.",
    "options": [
      "housing",
      "export",
      "tax",
      "agricultural price"
    ],
    "answer": "housing"
  },
  {
    "id": "ECO227",
    "topic": "Financial Institutions",
    "question": "If a bank receives a new deposit of â¦1m and the reserve ratio is 20%, the simple deposit multiplier is ___.",
    "options": [
      "2",
      "4",
      "5",
      "10"
    ],
    "answer": "5"
  },
  {
    "id": "ECO228",
    "topic": "Financial Institutions",
    "question": "With a 20% reserve ratio and an initial new deposit of â¦1m, the theoretical maximum total deposit creation is ___ under the simple model.",
    "options": [
      "â¦1m",
      "â¦2m",
      "â¦5m",
      "â¦20m"
    ],
    "answer": "â¦5m"
  },
  {
    "id": "ECO229",
    "topic": "Financial Institutions",
    "question": "A major challenge to credit creation is the public's preference for holding currency rather than ___ deposits.",
    "options": [
      "bank",
      "foreign",
      "capital",
      "tax"
    ],
    "answer": "bank"
  },
  {
    "id": "ECO230",
    "topic": "Financial Institutions",
    "question": "The stock exchange provides a market where securities can be bought and ___ .",
    "options": [
      "sold",
      "taxed",
      "destroyed",
      "rationed"
    ],
    "answer": "sold"
  },
  {
    "id": "ECO231",
    "topic": "Financial Institutions",
    "question": "Financial institutions contribute to economic development by mobilizing savings and channeling them into ___ investment.",
    "options": [
      "productive",
      "unproductive only",
      "illegal",
      "random"
    ],
    "answer": "productive"
  },
  {
    "id": "ECO232",
    "topic": "Public Finance",
    "question": "Public finance deals primarily with government revenue, expenditure and ___ .",
    "options": [
      "borrowing",
      "household utility",
      "private production only",
      "population genetics"
    ],
    "answer": "borrowing"
  },
  {
    "id": "ECO233",
    "topic": "Public Finance",
    "question": "A tax imposed directly on an individual's income is a ___ tax.",
    "options": [
      "direct",
      "indirect",
      "specific",
      "customs"
    ],
    "answer": "direct"
  },
  {
    "id": "ECO234",
    "topic": "Public Finance",
    "question": "Value-added tax is generally classified as an ___ tax.",
    "options": [
      "direct",
      "indirect",
      "property",
      "capital"
    ],
    "answer": "indirect"
  },
  {
    "id": "ECO235",
    "topic": "Public Finance",
    "question": "The ability-to-pay principle suggests that taxpayers should contribute according to their ___ .",
    "options": [
      "capacity",
      "age only",
      "location only",
      "consumption of exports"
    ],
    "answer": "capacity"
  },
  {
    "id": "ECO236",
    "topic": "Public Finance",
    "question": "A progressive tax takes a ___ proportion of income as income rises.",
    "options": [
      "smaller",
      "constant",
      "larger",
      "zero"
    ],
    "answer": "larger"
  },
  {
    "id": "ECO237",
    "topic": "Public Finance",
    "question": "A proportional tax takes a ___ proportion of income at different income levels.",
    "options": [
      "constant",
      "rising",
      "falling",
      "random"
    ],
    "answer": "constant"
  },
  {
    "id": "ECO238",
    "topic": "Public Finance",
    "question": "A regressive tax takes a ___ proportion of income from lower-income earners than from higher-income earners.",
    "options": [
      "larger",
      "smaller",
      "zero",
      "equal"
    ],
    "answer": "larger"
  },
  {
    "id": "ECO239",
    "topic": "Public Finance",
    "question": "Government spending on roads and major infrastructure is generally classified as ___ expenditure.",
    "options": [
      "capital",
      "recurrent",
      "transfer only",
      "private"
    ],
    "answer": "capital"
  },
  {
    "id": "ECO240",
    "topic": "Public Finance",
    "question": "Government salaries and routine administrative expenses are mainly ___ expenditure.",
    "options": [
      "recurrent",
      "capital",
      "foreign",
      "private"
    ],
    "answer": "recurrent"
  },
  {
    "id": "ECO241",
    "topic": "Public Finance",
    "question": "A budget deficit occurs when planned government expenditure exceeds planned government ___ .",
    "options": [
      "revenue",
      "debt",
      "imports",
      "exports"
    ],
    "answer": "revenue"
  },
  {
    "id": "ECO242",
    "topic": "Public Finance",
    "question": "A budget surplus occurs when government revenue exceeds government ___ .",
    "options": [
      "expenditure",
      "exports",
      "savings",
      "money supply"
    ],
    "answer": "expenditure"
  },
  {
    "id": "ECO243",
    "topic": "Public Finance",
    "question": "Fiscal policy uses government spending and ___ to influence economic activity.",
    "options": [
      "taxation",
      "weather",
      "population",
      "imports only"
    ],
    "answer": "taxation"
  },
  {
    "id": "ECO244",
    "topic": "Public Finance",
    "question": "During a recession, expansionary fiscal policy may involve increasing government spending or ___ taxes.",
    "options": [
      "raising",
      "reducing",
      "doubling",
      "indexing"
    ],
    "answer": "reducing"
  },
  {
    "id": "ECO245",
    "topic": "Public Finance",
    "question": "A public debt is a financial obligation owed by the ___ sector.",
    "options": [
      "government",
      "household only",
      "foreign consumers only",
      "private firms only"
    ],
    "answer": "government"
  },
  {
    "id": "ECO246",
    "topic": "Public Finance",
    "question": "The incidence of a tax refers to who ultimately ___ the economic burden of the tax.",
    "options": [
      "bears",
      "announces",
      "collects",
      "avoids"
    ],
    "answer": "bears"
  },
  {
    "id": "ECO247",
    "topic": "Public Finance",
    "question": "A grant from the central government to a local government is a form of government ___ .",
    "options": [
      "revenue transfer",
      "private profit",
      "consumer saving",
      "foreign exchange"
    ],
    "answer": "revenue transfer"
  },
  {
    "id": "ECO248",
    "topic": "Public Finance",
    "question": "A tax on a product with relatively inelastic demand is likely to place a larger burden on ___ if supply conditions are standard.",
    "options": [
      "consumers",
      "producers only",
      "foreign governments",
      "banks"
    ],
    "answer": "consumers"
  },
  {
    "id": "ECO249",
    "topic": "Economic Growth and Development",
    "question": "Economic growth refers to a sustained increase in a country's ___ output.",
    "options": [
      "real",
      "nominal only",
      "imported",
      "potential population"
    ],
    "answer": "real"
  },
  {
    "id": "ECO250",
    "topic": "Economic Growth and Development",
    "question": "Economic development is broader than growth because it includes improvements in welfare and structural ___ .",
    "options": [
      "change",
      "inflation only",
      "taxation only",
      "imports"
    ],
    "answer": "change"
  },
  {
    "id": "ECO251",
    "topic": "Economic Growth and Development",
    "question": "Real GDP per capita is commonly used as an indicator of changes in average ___ .",
    "options": [
      "material living standards",
      "population only",
      "tax rates",
      "exports only"
    ],
    "answer": "material living standards"
  },
  {
    "id": "ECO252",
    "topic": "Economic Growth and Development",
    "question": "A rise in literacy and life expectancy are examples of indicators of ___ development.",
    "options": [
      "human",
      "monetary",
      "exchange-rate",
      "fiscal"
    ],
    "answer": "human"
  },
  {
    "id": "ECO253",
    "topic": "Economic Growth and Development",
    "question": "Human capital refers to the stock of knowledge, skills and ___ embodied in people.",
    "options": [
      "health",
      "money",
      "land",
      "machines"
    ],
    "answer": "health"
  },
  {
    "id": "ECO254",
    "topic": "Economic Growth and Development",
    "question": "Investment in education can promote growth by increasing labour ___ .",
    "options": [
      "productivity",
      "scarcity",
      "taxation",
      "inflation"
    ],
    "answer": "productivity"
  },
  {
    "id": "ECO255",
    "topic": "Economic Growth and Development",
    "question": "Poor infrastructure can limit development by raising the cost of ___ .",
    "options": [
      "production",
      "population",
      "utility",
      "weather"
    ],
    "answer": "production"
  },
  {
    "id": "ECO256",
    "topic": "Economic Growth and Development",
    "question": "A country experiencing high GDP growth but worsening income inequality may have growth without sufficient ___ improvement.",
    "options": [
      "distributional",
      "monetary",
      "foreign-exchange",
      "price"
    ],
    "answer": "distributional"
  },
  {
    "id": "ECO257",
    "topic": "Economic Growth and Development",
    "question": "The Human Development Index includes indicators relating to health, education and ___ income.",
    "options": [
      "standard of living",
      "money supply",
      "exports",
      "tax revenue"
    ],
    "answer": "standard of living"
  },
  {
    "id": "ECO258",
    "topic": "Economic Growth and Development",
    "question": "Sustainable development requires meeting present needs without seriously reducing the ability of ___ generations to meet theirs.",
    "options": [
      "future",
      "past",
      "foreign",
      "urban"
    ],
    "answer": "future"
  },
  {
    "id": "ECO259",
    "topic": "Economic Growth and Development",
    "question": "A major constraint on development planning is inadequate and unreliable ___ .",
    "options": [
      "data",
      "scarcity",
      "consumer utility",
      "exports"
    ],
    "answer": "data"
  },
  {
    "id": "ECO260",
    "topic": "Economic Growth and Development",
    "question": "Diversification can reduce an economy's vulnerability to shocks affecting a single ___ .",
    "options": [
      "sector or commodity",
      "household",
      "tax rate",
      "currency note"
    ],
    "answer": "sector or commodity"
  },
  {
    "id": "ECO261",
    "topic": "Economic Growth and Development",
    "question": "Economic planning involves setting development goals and coordinating policies and ___ .",
    "options": [
      "resources",
      "weather",
      "population genetics",
      "preferences only"
    ],
    "answer": "resources"
  },
  {
    "id": "ECO262",
    "topic": "Economic Growth and Development",
    "question": "A high dependency ratio may reduce savings because a large share of the population depends on the ___ population.",
    "options": [
      "working",
      "foreign",
      "retired only",
      "urban only"
    ],
    "answer": "working"
  },
  {
    "id": "ECO263",
    "topic": "Economic Growth and Development",
    "question": "Inclusive development emphasizes that benefits of economic progress should reach ___ groups.",
    "options": [
      "broad",
      "only wealthy",
      "only exporters",
      "only firms"
    ],
    "answer": "broad"
  },
  {
    "id": "ECO264",
    "topic": "Economic Growth and Development",
    "question": "Structural transformation usually involves movement of resources from low-productivity activities toward ___ productivity activities.",
    "options": [
      "higher",
      "zero",
      "lower",
      "unchanged"
    ],
    "answer": "higher"
  },
  {
    "id": "ECO265",
    "topic": "Economic Growth and Development",
    "question": "A persistent shortage of skilled workers can constrain development through inadequate ___ capital.",
    "options": [
      "human",
      "physical",
      "financial",
      "natural"
    ],
    "answer": "human"
  },
  {
    "id": "ECO266",
    "topic": "Agriculture in Nigeria",
    "question": "Subsistence farming is mainly undertaken to provide food for the ___ household.",
    "options": [
      "farmer's",
      "foreign",
      "industrial",
      "government"
    ],
    "answer": "farmer's"
  },
  {
    "id": "ECO267",
    "topic": "Agriculture in Nigeria",
    "question": "Commercial agriculture is primarily oriented toward production for the ___ .",
    "options": [
      "market",
      "farmer's family only",
      "government warehouse only",
      "household consumption only"
    ],
    "answer": "market"
  },
  {
    "id": "ECO268",
    "topic": "Agriculture in Nigeria",
    "question": "One major problem of Nigerian agriculture is limited access to ___ credit.",
    "options": [
      "affordable",
      "foreign only",
      "luxury",
      "consumer"
    ],
    "answer": "affordable"
  },
  {
    "id": "ECO269",
    "topic": "Agriculture in Nigeria",
    "question": "Poor rural roads can increase post-harvest losses by making transportation of farm produce ___ .",
    "options": [
      "difficult",
      "instant",
      "free",
      "unnecessary"
    ],
    "answer": "difficult"
  },
  {
    "id": "ECO270",
    "topic": "Agriculture in Nigeria",
    "question": "Agricultural income is often unstable because farm output can be affected by weather and ___ .",
    "options": [
      "price fluctuations",
      "bank holidays only",
      "population census only",
      "tax refunds"
    ],
    "answer": "price fluctuations"
  },
  {
    "id": "ECO271",
    "topic": "Agriculture in Nigeria",
    "question": "Mechanization can raise agricultural productivity by increasing output per unit of ___ .",
    "options": [
      "labour",
      "currency",
      "tax",
      "population"
    ],
    "answer": "labour"
  },
  {
    "id": "ECO272",
    "topic": "Agriculture in Nigeria",
    "question": "Irrigation reduces farmers' dependence on ___ rainfall.",
    "options": [
      "seasonal",
      "industrial",
      "urban",
      "foreign"
    ],
    "answer": "seasonal"
  },
  {
    "id": "ECO273",
    "topic": "Agriculture in Nigeria",
    "question": "A major advantage of agricultural cooperatives is improved access to inputs, credit and ___ .",
    "options": [
      "markets",
      "weather",
      "tax exemptions only",
      "imports"
    ],
    "answer": "markets"
  },
  {
    "id": "ECO274",
    "topic": "Agriculture in Nigeria",
    "question": "Food crop production is mainly directed toward crops consumed as ___ .",
    "options": [
      "food",
      "industrial chemicals only",
      "fuel only",
      "exports only"
    ],
    "answer": "food"
  },
  {
    "id": "ECO275",
    "topic": "Agriculture in Nigeria",
    "question": "Cash crops are mainly produced for sale and may provide raw materials for ___ .",
    "options": [
      "industry",
      "household leisure",
      "weather services",
      "tax offices"
    ],
    "answer": "industry"
  },
  {
    "id": "ECO276",
    "topic": "Agriculture in Nigeria",
    "question": "Government agricultural extension services mainly provide farmers with technical ___ .",
    "options": [
      "advice",
      "loans only",
      "taxes",
      "imports"
    ],
    "answer": "advice"
  },
  {
    "id": "ECO277",
    "topic": "Agriculture in Nigeria",
    "question": "Land tenure problems can restrict agricultural development by making access to land and investment in it more ___ .",
    "options": [
      "difficult",
      "automatic",
      "free",
      "unnecessary"
    ],
    "answer": "difficult"
  },
  {
    "id": "ECO278",
    "topic": "Agriculture in Nigeria",
    "question": "The Green Revolution was associated with efforts to increase agricultural productivity through improved inputs and ___ .",
    "options": [
      "technology",
      "population control only",
      "foreign exchange restrictions",
      "urbanization"
    ],
    "answer": "technology"
  },
  {
    "id": "ECO279",
    "topic": "Agriculture in Nigeria",
    "question": "Instability of agricultural income can be reduced through crop diversification and improved ___ .",
    "options": [
      "storage",
      "scarcity",
      "inflation",
      "population"
    ],
    "answer": "storage"
  },
  {
    "id": "ECO280",
    "topic": "Agriculture in Nigeria",
    "question": "Large-scale irrigation projects are most directly intended to control the effects of inadequate ___ .",
    "options": [
      "water supply",
      "labour supply",
      "foreign trade",
      "taxation"
    ],
    "answer": "water supply"
  },
  {
    "id": "ECO281",
    "topic": "Agriculture in Nigeria",
    "question": "Agriculture contributes to industrial development by supplying industries with ___ materials.",
    "options": [
      "raw",
      "finished consumer",
      "foreign",
      "financial"
    ],
    "answer": "raw"
  },
  {
    "id": "ECO282",
    "topic": "Agriculture in Nigeria",
    "question": "A rise in agricultural productivity can reduce food prices if supply expands faster than ___ .",
    "options": [
      "demand",
      "population only",
      "imports",
      "taxes"
    ],
    "answer": "demand"
  },
  {
    "id": "ECO283",
    "topic": "Industry and Industrialization",
    "question": "Industrialization involves a growing importance of manufacturing and other ___ activities in an economy.",
    "options": [
      "industrial",
      "subsistence",
      "household",
      "traditional"
    ],
    "answer": "industrial"
  },
  {
    "id": "ECO284",
    "topic": "Industry and Industrialization",
    "question": "An industry may locate near raw materials when the raw material is bulky and expensive to ___ .",
    "options": [
      "transport",
      "produce",
      "tax",
      "consume"
    ],
    "answer": "transport"
  },
  {
    "id": "ECO285",
    "topic": "Industry and Industrialization",
    "question": "Localization of industry refers to the concentration of firms of related activities in a particular ___ .",
    "options": [
      "area",
      "household",
      "currency",
      "market basket"
    ],
    "answer": "area"
  },
  {
    "id": "ECO286",
    "topic": "Industry and Industrialization",
    "question": "One benefit of industrial clusters is access to specialized labour and ___ .",
    "options": [
      "supporting services",
      "higher scarcity",
      "fewer suppliers",
      "less infrastructure"
    ],
    "answer": "supporting services"
  },
  {
    "id": "ECO287",
    "topic": "Industry and Industrialization",
    "question": "Poor electricity supply can raise industrial firms' costs because they may rely on ___ power sources.",
    "options": [
      "alternative",
      "free",
      "foreign consumer",
      "government tax"
    ],
    "answer": "alternative"
  },
  {
    "id": "ECO288",
    "topic": "Industry and Industrialization",
    "question": "Import substitution industrialization aims to encourage domestic production of goods previously ___ .",
    "options": [
      "imported",
      "exported",
      "taxed",
      "stored"
    ],
    "answer": "imported"
  },
  {
    "id": "ECO289",
    "topic": "Industry and Industrialization",
    "question": "An export-oriented industrial strategy emphasizes producing goods for ___ markets.",
    "options": [
      "foreign",
      "local only",
      "household only",
      "government only"
    ],
    "answer": "foreign"
  },
  {
    "id": "ECO290",
    "topic": "Industry and Industrialization",
    "question": "Industrial backward linkage occurs when industry creates demand for domestic ___ suppliers.",
    "options": [
      "input",
      "consumer",
      "tax",
      "population"
    ],
    "answer": "input"
  },
  {
    "id": "ECO291",
    "topic": "Industry and Industrialization",
    "question": "Forward linkage occurs when an industry supplies inputs to ___ activities.",
    "options": [
      "downstream",
      "unrelated household",
      "foreign tax",
      "population"
    ],
    "answer": "downstream"
  },
  {
    "id": "ECO292",
    "topic": "Industry and Industrialization",
    "question": "A major source of industrial finance is long-term borrowing through the ___ market.",
    "options": [
      "capital",
      "money",
      "labour",
      "commodity"
    ],
    "answer": "capital"
  },
  {
    "id": "ECO293",
    "topic": "Industry and Industrialization",
    "question": "Small-scale industries may face difficulty obtaining finance because they often have limited ___ .",
    "options": [
      "collateral",
      "labour demand",
      "consumer demand",
      "tax obligations"
    ],
    "answer": "collateral"
  },
  {
    "id": "ECO294",
    "topic": "Industry and Industrialization",
    "question": "Industrialization can promote urbanization because factories create employment opportunities in ___ areas.",
    "options": [
      "urban",
      "desert",
      "foreign",
      "agricultural only"
    ],
    "answer": "urban"
  },
  {
    "id": "ECO295",
    "topic": "Industry and Industrialization",
    "question": "A key environmental cost of industrialization can be ___ pollution.",
    "options": [
      "industrial",
      "consumer",
      "population",
      "financial"
    ],
    "answer": "industrial"
  },
  {
    "id": "ECO296",
    "topic": "Industry and Industrialization",
    "question": "Appropriate location of an industry depends on raw materials, labour, markets, power and ___ .",
    "options": [
      "transport",
      "utility only",
      "population census only",
      "tax rates only"
    ],
    "answer": "transport"
  },
  {
    "id": "ECO297",
    "topic": "Industry and Industrialization",
    "question": "Economies of scale can make large-scale industrial production more ___ per unit.",
    "options": [
      "cost-efficient",
      "expensive",
      "scarce",
      "labour-intensive always"
    ],
    "answer": "cost-efficient"
  },
  {
    "id": "ECO298",
    "topic": "Industry and Industrialization",
    "question": "Industrial policy can encourage domestic production through infrastructure, skills and access to ___ .",
    "options": [
      "finance",
      "weather",
      "population only",
      "imports only"
    ],
    "answer": "finance"
  },
  {
    "id": "ECO299",
    "topic": "Industry and Industrialization",
    "question": "An industry heavily dependent on imported machinery may face production problems when the domestic currency ___ sharply.",
    "options": [
      "depreciates",
      "appreciates",
      "stabilizes",
      "disappears"
    ],
    "answer": "depreciates"
  },
  {
    "id": "ECO300",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Petroleum is classified as a ___ resource because its stock is exhaustible on human time scales.",
    "options": [
      "non-renewable",
      "renewable",
      "unlimited",
      "recyclable"
    ],
    "answer": "non-renewable"
  },
  {
    "id": "ECO301",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "The upstream petroleum sector mainly involves exploration and ___ of crude oil.",
    "options": [
      "production",
      "retailing",
      "tax collection",
      "refining only"
    ],
    "answer": "production"
  },
  {
    "id": "ECO302",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "The downstream petroleum sector includes refining, distribution and ___ of petroleum products.",
    "options": [
      "marketing",
      "exploration",
      "geological surveying only",
      "mining"
    ],
    "answer": "marketing"
  },
  {
    "id": "ECO303",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "A major economic risk of excessive dependence on crude oil exports is vulnerability to international oil ___ .",
    "options": [
      "price shocks",
      "rainfall",
      "population growth",
      "school enrolment"
    ],
    "answer": "price shocks"
  },
  {
    "id": "ECO304",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Resource linkage effects occur when a natural-resource industry creates demand for inputs and services from ___ sectors.",
    "options": [
      "other",
      "no",
      "foreign only",
      "household only"
    ],
    "answer": "other"
  },
  {
    "id": "ECO305",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "OPEC primarily coordinates petroleum policies among participating ___ countries.",
    "options": [
      "exporting",
      "importing only",
      "landlocked only",
      "industrialized only"
    ],
    "answer": "exporting"
  },
  {
    "id": "ECO306",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "A resource curse may occur when abundant natural resources are associated with weak diversification and ___ institutions.",
    "options": [
      "weak",
      "perfect",
      "private",
      "agricultural"
    ],
    "answer": "weak"
  },
  {
    "id": "ECO307",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Illegal extraction of natural resources can reduce government revenue and increase ___ damage.",
    "options": [
      "environmental",
      "educational",
      "monetary",
      "demographic"
    ],
    "answer": "environmental"
  },
  {
    "id": "ECO308",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Gas flaring can create environmental costs and represents a loss of potentially useful ___ resources.",
    "options": [
      "energy",
      "labour",
      "land",
      "tax"
    ],
    "answer": "energy"
  },
  {
    "id": "ECO309",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Diversification of Nigeria's economy means reducing excessive dependence on ___ sector.",
    "options": [
      "one dominant",
      "all",
      "agricultural",
      "service"
    ],
    "answer": "one dominant"
  },
  {
    "id": "ECO310",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Gold, limestone and iron ore are examples of Nigeria's ___ resources.",
    "options": [
      "mineral",
      "human",
      "financial",
      "foreign"
    ],
    "answer": "mineral"
  },
  {
    "id": "ECO311",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "A major benefit of processing natural resources domestically is greater ___ addition.",
    "options": [
      "value",
      "scarcity",
      "inflation",
      "population"
    ],
    "answer": "value"
  },
  {
    "id": "ECO312",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Local content policies in extractive industries are intended partly to increase participation of ___ firms and workers.",
    "options": [
      "domestic",
      "foreign only",
      "government only",
      "household"
    ],
    "answer": "domestic"
  },
  {
    "id": "ECO313",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Resource depletion occurs when extraction exceeds the natural or economic ability of a resource to be ___ .",
    "options": [
      "replaced",
      "taxed",
      "exported",
      "priced"
    ],
    "answer": "replaced"
  },
  {
    "id": "ECO314",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "The petroleum sector can generate government revenue through royalties, taxes and ___ .",
    "options": [
      "licensing income",
      "school fees",
      "household savings",
      "consumer subsidies only"
    ],
    "answer": "licensing income"
  },
  {
    "id": "ECO315",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "A fall in global crude oil prices can reduce foreign exchange earnings when crude oil constitutes a large share of ___ .",
    "options": [
      "exports",
      "imports",
      "household income only",
      "government wages"
    ],
    "answer": "exports"
  },
  {
    "id": "ECO316",
    "topic": "Natural Resources and the Nigerian Economy",
    "question": "Using natural-resource revenue to fund education and infrastructure can convert temporary resource income into longer-term ___ capital.",
    "options": [
      "human and physical",
      "foreign only",
      "consumer",
      "population"
    ],
    "answer": "human and physical"
  },
  {
    "id": "ECO317",
    "topic": "Business Organisations",
    "question": "A sole proprietorship is owned and controlled by ___ person.",
    "options": [
      "one",
      "two",
      "many shareholders only",
      "government"
    ],
    "answer": "one"
  },
  {
    "id": "ECO318",
    "topic": "Business Organisations",
    "question": "A major disadvantage of sole proprietorship is ___ liability.",
    "options": [
      "limited",
      "unlimited",
      "zero",
      "shared"
    ],
    "answer": "unlimited"
  },
  {
    "id": "ECO319",
    "topic": "Business Organisations",
    "question": "A partnership is generally formed by an agreement between ___ or more persons.",
    "options": [
      "two",
      "one",
      "zero",
      "one hundred only"
    ],
    "answer": "two"
  },
  {
    "id": "ECO320",
    "topic": "Business Organisations",
    "question": "In an ordinary partnership, partners may have ___ liability for business debts.",
    "options": [
      "unlimited",
      "zero",
      "limited by default",
      "government"
    ],
    "answer": "unlimited"
  },
  {
    "id": "ECO321",
    "topic": "Business Organisations",
    "question": "A company with a legal identity separate from its owners is a ___ company.",
    "options": [
      "limited liability",
      "sole trader",
      "traditional",
      "cooperative only"
    ],
    "answer": "limited liability"
  },
  {
    "id": "ECO322",
    "topic": "Business Organisations",
    "question": "The owners of a limited liability company are generally called ___ .",
    "options": [
      "shareholders",
      "creditors",
      "employees only",
      "tax officers"
    ],
    "answer": "shareholders"
  },
  {
    "id": "ECO323",
    "topic": "Business Organisations",
    "question": "A cooperative society is formed mainly to serve the ___ interests of its members.",
    "options": [
      "common",
      "foreign",
      "government",
      "individual only"
    ],
    "answer": "common"
  },
  {
    "id": "ECO324",
    "topic": "Business Organisations",
    "question": "One advantage of incorporation is continuity because the company has ___ succession.",
    "options": [
      "perpetual",
      "seasonal",
      "temporary",
      "annual"
    ],
    "answer": "perpetual"
  },
  {
    "id": "ECO325",
    "topic": "Business Organisations",
    "question": "Privatization involves transferring ownership or control of a public enterprise to the ___ sector.",
    "options": [
      "private",
      "foreign government only",
      "household",
      "non-market"
    ],
    "answer": "private"
  },
  {
    "id": "ECO326",
    "topic": "Business Organisations",
    "question": "Commercialization means operating a public enterprise on a more ___ basis, even if ownership remains public.",
    "options": [
      "commercial",
      "charitable",
      "traditional",
      "subsistence"
    ],
    "answer": "commercial"
  },
  {
    "id": "ECO327",
    "topic": "Business Organisations",
    "question": "A public corporation is owned primarily by the ___ .",
    "options": [
      "government",
      "employees only",
      "foreign investors only",
      "customers"
    ],
    "answer": "government"
  },
  {
    "id": "ECO328",
    "topic": "Business Organisations",
    "question": "One reason for privatization is to improve efficiency through stronger ___ incentives.",
    "options": [
      "profit",
      "population",
      "tax",
      "traditional"
    ],
    "answer": "profit"
  },
  {
    "id": "ECO329",
    "topic": "Business Organisations",
    "question": "A major problem of public enterprises can be political interference in ___ decisions.",
    "options": [
      "management",
      "weather",
      "population",
      "consumer utility"
    ],
    "answer": "management"
  },
  {
    "id": "ECO330",
    "topic": "Business Organisations",
    "question": "The size of a firm may be influenced by market size, technology and ___ economies.",
    "options": [
      "scale",
      "population only",
      "taxation only",
      "inflation"
    ],
    "answer": "scale"
  },
  {
    "id": "ECO331",
    "topic": "Business Organisations",
    "question": "A company can raise equity finance by issuing ___ to investors.",
    "options": [
      "shares",
      "wages",
      "taxes",
      "rent"
    ],
    "answer": "shares"
  },
  {
    "id": "ECO332",
    "topic": "Business Organisations",
    "question": "Debt finance differs from equity finance because debt creates a contractual obligation to repay ___ .",
    "options": [
      "borrowed funds",
      "shares",
      "profits only",
      "taxes only"
    ],
    "answer": "borrowed funds"
  },
  {
    "id": "ECO333",
    "topic": "Business Organisations",
    "question": "A cooperative differs from a conventional profit-maximizing firm because member participation and ___ are central objectives.",
    "options": [
      "mutual benefit",
      "monopoly",
      "tax avoidance",
      "price discrimination"
    ],
    "answer": "mutual benefit"
  },
  {
    "id": "ECO334",
    "topic": "Population",
    "question": "Population refers to the number of people living in a specified ___ at a given time.",
    "options": [
      "area",
      "market price",
      "firm",
      "industry"
    ],
    "answer": "area"
  },
  {
    "id": "ECO335",
    "topic": "Population",
    "question": "A population census is an official count of people in a country at a specified ___ .",
    "options": [
      "time",
      "price",
      "tax rate",
      "market"
    ],
    "answer": "time"
  },
  {
    "id": "ECO336",
    "topic": "Population",
    "question": "One important use of census data is planning for schools, hospitals and other ___ services.",
    "options": [
      "public",
      "private luxury",
      "foreign",
      "export"
    ],
    "answer": "public"
  },
  {
    "id": "ECO337",
    "topic": "Population",
    "question": "A major problem of census in some developing countries is inaccurate enumeration due to poor ___ .",
    "options": [
      "records and logistics",
      "weather only",
      "foreign exchange",
      "consumer demand"
    ],
    "answer": "records and logistics"
  },
  {
    "id": "ECO338",
    "topic": "Population",
    "question": "Malthus argued that population tends to grow faster than the means of ___ under certain conditions.",
    "options": [
      "subsistence",
      "transport",
      "finance",
      "trade"
    ],
    "answer": "subsistence"
  },
  {
    "id": "ECO339",
    "topic": "Population",
    "question": "Over-population exists when population is large relative to available resources and ___ capacity.",
    "options": [
      "productive",
      "monetary",
      "foreign",
      "tax"
    ],
    "answer": "productive"
  },
  {
    "id": "ECO340",
    "topic": "Population",
    "question": "Under-population occurs when available resources exceed the capacity of the existing ___ to use them fully.",
    "options": [
      "population",
      "government",
      "banks",
      "firms"
    ],
    "answer": "population"
  },
  {
    "id": "ECO341",
    "topic": "Population",
    "question": "Optimum population refers to the population size that maximizes output per head given available ___ .",
    "options": [
      "resources",
      "taxes",
      "imports",
      "prices only"
    ],
    "answer": "resources"
  },
  {
    "id": "ECO342",
    "topic": "Population",
    "question": "A high birth rate combined with a falling death rate can produce rapid population ___ .",
    "options": [
      "growth",
      "decline",
      "stability",
      "zero"
    ],
    "answer": "growth"
  },
  {
    "id": "ECO343",
    "topic": "Population",
    "question": "A population pyramid with a very broad base usually indicates a high proportion of ___ people.",
    "options": [
      "young",
      "elderly",
      "retired",
      "foreign"
    ],
    "answer": "young"
  },
  {
    "id": "ECO344",
    "topic": "Population",
    "question": "The dependency ratio compares dependent people with the ___ population.",
    "options": [
      "working-age",
      "foreign",
      "urban",
      "exporting"
    ],
    "answer": "working-age"
  },
  {
    "id": "ECO345",
    "topic": "Population",
    "question": "Migration affects population distribution by changing the number of people living in different ___ .",
    "options": [
      "regions",
      "currencies",
      "markets only",
      "firms"
    ],
    "answer": "regions"
  },
  {
    "id": "ECO346",
    "topic": "Population",
    "question": "Urbanization refers to the increasing share of population living in ___ areas.",
    "options": [
      "urban",
      "rural",
      "agricultural",
      "foreign"
    ],
    "answer": "urban"
  },
  {
    "id": "ECO347",
    "topic": "Population",
    "question": "A population policy may aim to influence fertility, mortality and ___ patterns.",
    "options": [
      "migration",
      "taxation",
      "inflation",
      "exports"
    ],
    "answer": "migration"
  },
  {
    "id": "ECO348",
    "topic": "Population",
    "question": "A falling mortality rate without a corresponding fall in fertility can increase the population's ___ rate.",
    "options": [
      "growth",
      "tax",
      "interest",
      "exchange"
    ],
    "answer": "growth"
  },
  {
    "id": "ECO349",
    "topic": "Population",
    "question": "Population growth can expand the labour force, but employment must grow sufficiently to prevent rising ___ .",
    "options": [
      "unemployment",
      "exports",
      "capital",
      "productivity"
    ],
    "answer": "unemployment"
  },
  {
    "id": "ECO350",
    "topic": "Population",
    "question": "An aging population can increase demand for healthcare and ___ services.",
    "options": [
      "pensions",
      "school uniforms",
      "childcare only",
      "exports"
    ],
    "answer": "pensions"
  },
  {
    "id": "ECO351",
    "topic": "International Trade",
    "question": "International trade involves exchange of goods and services between ___ countries.",
    "options": [
      "different",
      "identical",
      "neighbouring households only",
      "firms within one city"
    ],
    "answer": "different"
  },
  {
    "id": "ECO352",
    "topic": "International Trade",
    "question": "Absolute advantage means a country can produce a good using ___ resources than another country.",
    "options": [
      "fewer",
      "more",
      "equal",
      "no"
    ],
    "answer": "fewer"
  },
  {
    "id": "ECO353",
    "topic": "International Trade",
    "question": "Comparative advantage is based on differences in ___ cost.",
    "options": [
      "opportunity",
      "fixed",
      "accounting",
      "tax"
    ],
    "answer": "opportunity"
  },
  {
    "id": "ECO354",
    "topic": "International Trade",
    "question": "If Country A gives up 2 units of rice to produce 1 unit of wheat while Country B gives up 4 rice, A has comparative advantage in ___ .",
    "options": [
      "wheat",
      "rice",
      "both",
      "neither"
    ],
    "answer": "wheat"
  },
  {
    "id": "ECO355",
    "topic": "International Trade",
    "question": "A country can benefit from trade even if it has an absolute disadvantage in all goods when it specializes according to ___ advantage.",
    "options": [
      "comparative",
      "absolute",
      "financial",
      "technological"
    ],
    "answer": "comparative"
  },
  {
    "id": "ECO356",
    "topic": "International Trade",
    "question": "Balance of trade is the difference between the value of visible ___ and visible imports.",
    "options": [
      "exports",
      "services",
      "transfers",
      "capital"
    ],
    "answer": "exports"
  },
  {
    "id": "ECO357",
    "topic": "International Trade",
    "question": "A balance-of-trade surplus occurs when visible exports are ___ visible imports.",
    "options": [
      "greater than",
      "less than",
      "equal to",
      "unrelated to"
    ],
    "answer": "greater than"
  },
  {
    "id": "ECO358",
    "topic": "International Trade",
    "question": "The balance of payments records a country's economic transactions with the ___ of the world.",
    "options": [
      "rest",
      "government only",
      "banks only",
      "population"
    ],
    "answer": "rest"
  },
  {
    "id": "ECO359",
    "topic": "International Trade",
    "question": "A tariff is a tax imposed on ___ goods.",
    "options": [
      "imports",
      "exports only",
      "domestic wages",
      "savings"
    ],
    "answer": "imports"
  },
  {
    "id": "ECO360",
    "topic": "International Trade",
    "question": "An import quota restricts the ___ quantity of a good that may be imported.",
    "options": [
      "maximum",
      "minimum",
      "average",
      "unknown"
    ],
    "answer": "maximum"
  },
  {
    "id": "ECO361",
    "topic": "International Trade",
    "question": "Protectionism may be used to protect infant industries from established ___ competition.",
    "options": [
      "foreign",
      "domestic household",
      "government",
      "non-market"
    ],
    "answer": "foreign"
  },
  {
    "id": "ECO362",
    "topic": "International Trade",
    "question": "A depreciation of the domestic currency makes exports relatively ___ to foreigners, other things equal.",
    "options": [
      "cheaper",
      "more expensive",
      "unavailable",
      "unchanged always"
    ],
    "answer": "cheaper"
  },
  {
    "id": "ECO363",
    "topic": "International Trade",
    "question": "An appreciation of the domestic currency tends to make imports relatively ___ for domestic buyers.",
    "options": [
      "cheaper",
      "more expensive",
      "illegal",
      "scarcer automatically"
    ],
    "answer": "cheaper"
  },
  {
    "id": "ECO364",
    "topic": "International Trade",
    "question": "If a country's exports are â¦500bn and imports are â¦650bn, its visible trade balance is a ___ of â¦150bn.",
    "options": [
      "surplus",
      "deficit",
      "balance",
      "profit"
    ],
    "answer": "deficit"
  },
  {
    "id": "ECO365",
    "topic": "International Trade",
    "question": "Terms of trade improve when export prices rise relative to ___ prices.",
    "options": [
      "import",
      "domestic wage",
      "tax",
      "labour"
    ],
    "answer": "import"
  },
  {
    "id": "ECO366",
    "topic": "International Trade",
    "question": "A persistent balance-of-payments deficit can place pressure on a country's foreign ___ reserves.",
    "options": [
      "exchange",
      "labour",
      "land",
      "tax"
    ],
    "answer": "exchange"
  },
  {
    "id": "ECO367",
    "topic": "International Trade",
    "question": "One corrective measure for a persistent external deficit is to promote exports and reduce unnecessary ___ .",
    "options": [
      "imports",
      "savings",
      "investment",
      "productivity"
    ],
    "answer": "imports"
  },
  {
    "id": "ECO368",
    "topic": "International Trade",
    "question": "Exchange rate determination under a floating system is mainly influenced by demand and ___ for foreign currency.",
    "options": [
      "supply",
      "taxation",
      "population",
      "government expenditure"
    ],
    "answer": "supply"
  },
  {
    "id": "ECO369",
    "topic": "International Economic Organisations",
    "question": "ECOWAS was established to promote economic integration among countries in ___ Africa.",
    "options": [
      "West",
      "East",
      "North",
      "Southern"
    ],
    "answer": "West"
  },
  {
    "id": "ECO370",
    "topic": "International Economic Organisations",
    "question": "The IMF is primarily concerned with international monetary cooperation and ___ balance support.",
    "options": [
      "balance-of-payments",
      "agricultural",
      "population",
      "industrial location"
    ],
    "answer": "balance-of-payments"
  },
  {
    "id": "ECO371",
    "topic": "International Economic Organisations",
    "question": "The World Bank group provides development finance aimed at reducing ___ and supporting investment.",
    "options": [
      "poverty",
      "exports",
      "inflation only",
      "population"
    ],
    "answer": "poverty"
  },
  {
    "id": "ECO372",
    "topic": "International Economic Organisations",
    "question": "The WTO provides a framework for negotiating and administering rules governing international ___ .",
    "options": [
      "trade",
      "migration",
      "population",
      "taxation"
    ],
    "answer": "trade"
  },
  {
    "id": "ECO373",
    "topic": "International Economic Organisations",
    "question": "The African Union promotes cooperation and integration among ___ states.",
    "options": [
      "African",
      "European",
      "Asian",
      "American"
    ],
    "answer": "African"
  },
  {
    "id": "ECO374",
    "topic": "International Economic Organisations",
    "question": "UNCTAD focuses particularly on trade and development issues affecting ___ countries.",
    "options": [
      "developing",
      "only industrialized",
      "only landlocked",
      "only oil-exporting"
    ],
    "answer": "developing"
  },
  {
    "id": "ECO375",
    "topic": "International Economic Organisations",
    "question": "The OECD is an organization whose members cooperate on economic and public-policy ___ .",
    "options": [
      "issues",
      "weather",
      "religion",
      "population genetics"
    ],
    "answer": "issues"
  },
  {
    "id": "ECO376",
    "topic": "International Economic Organisations",
    "question": "The African Development Bank primarily finances projects supporting economic and social development in ___ .",
    "options": [
      "Africa",
      "Europe",
      "North America",
      "Oceania"
    ],
    "answer": "Africa"
  },
  {
    "id": "ECO377",
    "topic": "Factors of Production and Their Theories",
    "question": "The traditional factors of production are land, labour, capital and ___ .",
    "options": [
      "entrepreneurship",
      "money",
      "population",
      "technology only"
    ],
    "answer": "entrepreneurship"
  },
  {
    "id": "ECO378",
    "topic": "Factors of Production and Their Theories",
    "question": "The reward for the use of land is generally called ___ .",
    "options": [
      "rent",
      "wage",
      "interest",
      "profit"
    ],
    "answer": "rent"
  },
  {
    "id": "ECO379",
    "topic": "Factors of Production and Their Theories",
    "question": "The reward for labour is ___ .",
    "options": [
      "wage",
      "rent",
      "interest",
      "profit"
    ],
    "answer": "wage"
  },
  {
    "id": "ECO380",
    "topic": "Factors of Production and Their Theories",
    "question": "The reward for capital is ___ .",
    "options": [
      "interest",
      "rent",
      "wage",
      "salary"
    ],
    "answer": "interest"
  },
  {
    "id": "ECO381",
    "topic": "Factors of Production and Their Theories",
    "question": "The reward for entrepreneurship is ___ .",
    "options": [
      "profit",
      "rent",
      "wage",
      "interest"
    ],
    "answer": "profit"
  },
  {
    "id": "ECO382",
    "topic": "Factors of Production and Their Theories",
    "question": "Land as a factor of production includes natural resources and is generally ___ in supply in total.",
    "options": [
      "fixed",
      "unlimited",
      "perfectly elastic",
      "manufactured"
    ],
    "answer": "fixed"
  },
  {
    "id": "ECO383",
    "topic": "Factors of Production and Their Theories",
    "question": "Labour mobility refers to the ability of workers to move between jobs, occupations or ___ .",
    "options": [
      "locations",
      "currencies",
      "tax systems only",
      "firms' shareholders"
    ],
    "answer": "locations"
  },
  {
    "id": "ECO384",
    "topic": "Factors of Production and Their Theories",
    "question": "Occupational mobility is movement of labour from one type of ___ to another.",
    "options": [
      "job",
      "region",
      "currency",
      "tax"
    ],
    "answer": "job"
  },
  {
    "id": "ECO385",
    "topic": "Factors of Production and Their Theories",
    "question": "Geographical mobility is movement of labour from one ___ to another.",
    "options": [
      "place",
      "occupation",
      "industry input",
      "currency"
    ],
    "answer": "place"
  },
  {
    "id": "ECO386",
    "topic": "Factors of Production and Their Theories",
    "question": "The marginal productivity theory of distribution explains factor rewards in relation to the factor's marginal ___ .",
    "options": [
      "revenue product",
      "average cost",
      "utility",
      "population"
    ],
    "answer": "revenue product"
  },
  {
    "id": "ECO387",
    "topic": "Factors of Production and Their Theories",
    "question": "If the marginal product of labour is 5 units and the price of output is â¦20, the marginal revenue product of labour is â¦___ .",
    "options": [
      "25",
      "50",
      "100",
      "400"
    ],
    "answer": "100"
  },
  {
    "id": "ECO388",
    "topic": "Factors of Production and Their Theories",
    "question": "A worker's demand is called derived demand because it depends on demand for the ___ the worker helps produce.",
    "options": [
      "output",
      "wage",
      "tax",
      "currency"
    ],
    "answer": "output"
  },
  {
    "id": "ECO389",
    "topic": "Factors of Production and Their Theories",
    "question": "The liquidity preference theory explains the determination of the rate of ___ .",
    "options": [
      "interest",
      "rent",
      "wages",
      "profit"
    ],
    "answer": "interest"
  },
  {
    "id": "ECO390",
    "topic": "Factors of Production and Their Theories",
    "question": "A worker may remain unemployed because his or her skills do not match available jobs; this is ___ unemployment.",
    "options": [
      "structural",
      "frictional",
      "seasonal",
      "voluntary"
    ],
    "answer": "structural"
  },
  {
    "id": "ECO391",
    "topic": "Factors of Production and Their Theories",
    "question": "Unemployment caused by movement between jobs is called ___ unemployment.",
    "options": [
      "frictional",
      "structural",
      "cyclical",
      "technological"
    ],
    "answer": "frictional"
  },
  {
    "id": "ECO392",
    "topic": "Factors of Production and Their Theories",
    "question": "Unemployment associated with downturns in aggregate economic activity is ___ unemployment.",
    "options": [
      "cyclical",
      "frictional",
      "seasonal",
      "voluntary"
    ],
    "answer": "cyclical"
  },
  {
    "id": "ECO393",
    "topic": "Factors of Production and Their Theories",
    "question": "Seasonal unemployment is common in occupations where demand for labour varies with the ___ .",
    "options": [
      "season",
      "currency",
      "tax system",
      "capital stock"
    ],
    "answer": "season"
  },
  {
    "id": "ECO394",
    "topic": "Factors of Production and Their Theories",
    "question": "A policy that improves vocational training can reduce structural unemployment by improving workers' ___ .",
    "options": [
      "skills",
      "taxes",
      "imports",
      "population"
    ],
    "answer": "skills"
  },
  {
    "id": "ECO395",
    "topic": "International Economic Organisations",
    "question": "Which international institution is most directly associated with rules governing multilateral trade between member countries?",
    "options": [
      "IMF",
      "WTO",
      "WHO",
      "ILO"
    ],
    "answer": "WTO"
  },
  {
    "id": "ECO396",
    "topic": "International Economic Organisations",
    "question": "A major objective of the IMF is to help countries address temporary external payment problems while promoting monetary cooperation and financial stability. The problem involved is mainly the ___ position.",
    "options": [
      "balance-of-payments",
      "population",
      "agricultural",
      "industrial"
    ],
    "answer": "balance-of-payments"
  },
  {
    "id": "ECO397",
    "topic": "International Economic Organisations",
    "question": "A development project financed by the World Bank to improve transport infrastructure would most directly aim at increasing the economy's ___ capacity.",
    "options": [
      "productive",
      "consumer",
      "tax",
      "population"
    ],
    "answer": "productive"
  },
  {
    "id": "ECO398",
    "topic": "International Economic Organisations",
    "question": "Regional economic integration can benefit member countries by expanding the effective ___ for goods and services.",
    "options": [
      "market",
      "tax rate",
      "population census",
      "interest rate"
    ],
    "answer": "market"
  },
  {
    "id": "ECO399",
    "topic": "International Economic Organisations",
    "question": "A major concern of UNCTAD is improving the participation of developing countries in ___ and development.",
    "options": [
      "international trade",
      "local taxation",
      "population census",
      "domestic elections"
    ],
    "answer": "international trade"
  },
  {
    "id": "ECO400",
    "topic": "International Economic Organisations",
    "question": "The African Development Bank is best classified as a regional ___ institution.",
    "options": [
      "development-finance",
      "military",
      "population-control",
      "weather"
    ],
    "answer": "development-finance"
  }
],


"Government":[
{
    "id": "GOV001",
    "topic": "Basic Concepts in Government",
    "question": "Which term best describes the legitimate right to command?",
    "options": [
      "Influence",
      "Authority",
      "Power",
      "Legitimacy"
    ],
    "answer": "Authority"
  },
  {
    "id": "GOV002",
    "topic": "Basic Concepts in Government",
    "question": "In Government, Authority refers to",
    "options": [
      "Influence",
      "Power",
      "Authority",
      "Legitimacy"
    ],
    "answer": "Authority"
  },
  {
    "id": "GOV003",
    "topic": "Basic Concepts in Government",
    "question": "Which of the following is correctly associated with Authority?",
    "options": [
      "Power",
      "Authority",
      "Legitimacy",
      "Influence"
    ],
    "answer": "Authority"
  },
  {
    "id": "GOV004",
    "topic": "Basic Concepts in Government",
    "question": "The description 'the legitimate right to command' refers to",
    "options": [
      "Authority",
      "Influence",
      "Power",
      "Legitimacy"
    ],
    "answer": "Authority"
  },
  {
    "id": "GOV005",
    "topic": "Basic Concepts in Government",
    "question": "Which term best describes the supreme power of a state over its territory?",
    "options": [
      "Federalism",
      "Legitimacy",
      "Authority",
      "Sovereignty"
    ],
    "answer": "Sovereignty"
  },
  {
    "id": "GOV006",
    "topic": "Basic Concepts in Government",
    "question": "In Government, Sovereignty refers to",
    "options": [
      "Legitimacy",
      "Authority",
      "Sovereignty",
      "Federalism"
    ],
    "answer": "Sovereignty"
  },
  {
    "id": "GOV007",
    "topic": "Basic Concepts in Government",
    "question": "Which of the following is correctly associated with Sovereignty?",
    "options": [
      "Authority",
      "Sovereignty",
      "Legitimacy",
      "Federalism"
    ],
    "answer": "Sovereignty"
  },
  {
    "id": "GOV008",
    "topic": "Basic Concepts in Government",
    "question": "The description 'the supreme power of a state over its territory' refers to",
    "options": [
      "Federalism",
      "Legitimacy",
      "Authority",
      "Sovereignty"
    ],
    "answer": "Sovereignty"
  },
  {
    "id": "GOV009",
    "topic": "Basic Concepts in Government",
    "question": "Which term best describes the accepted right of a government to rule?",
    "options": [
      "Sovereignty",
      "Power",
      "Legitimacy",
      "Authority"
    ],
    "answer": "Legitimacy"
  },
  {
    "id": "GOV010",
    "topic": "Basic Concepts in Government",
    "question": "In Government, Legitimacy refers to",
    "options": [
      "Power",
      "Authority",
      "Legitimacy",
      "Sovereignty"
    ],
    "answer": "Legitimacy"
  },
  {
    "id": "GOV011",
    "topic": "Basic Concepts in Government",
    "question": "Which of the following is correctly associated with Legitimacy?",
    "options": [
      "Legitimacy",
      "Sovereignty",
      "Authority",
      "Power"
    ],
    "answer": "Legitimacy"
  },
  {
    "id": "GOV012",
    "topic": "Basic Concepts in Government",
    "question": "The description 'the accepted right of a government to rule' refers to",
    "options": [
      "Sovereignty",
      "Power",
      "Legitimacy",
      "Authority"
    ],
    "answer": "Legitimacy"
  },
  {
    "id": "GOV013",
    "topic": "Basic Concepts in Government",
    "question": "Which term best describes a nation possessing its own sovereign state?",
    "options": [
      "Society",
      "Colony",
      "Federation",
      "Nation-state"
    ],
    "answer": "Nation-state"
  },
  {
    "id": "GOV014",
    "topic": "Basic Concepts in Government",
    "question": "In Government, Nation-state refers to",
    "options": [
      "Nation-state",
      "Society",
      "Federation",
      "Colony"
    ],
    "answer": "Nation-state"
  },
  {
    "id": "GOV015",
    "topic": "Basic Concepts in Government",
    "question": "Which of the following is correctly associated with Nation-state?",
    "options": [
      "Society",
      "Federation",
      "Nation-state",
      "Colony"
    ],
    "answer": "Nation-state"
  },
  {
    "id": "GOV016",
    "topic": "Basic Concepts in Government",
    "question": "The description 'a nation possessing its own sovereign state' refers to",
    "options": [
      "Nation-state",
      "Colony",
      "Federation",
      "Society"
    ],
    "answer": "Nation-state"
  },
  {
    "id": "GOV017",
    "topic": "Basic Concepts in Government",
    "question": "Which term best describes the process through which people acquire political values and attitudes?",
    "options": [
      "Political culture",
      "Political communication",
      "Political participation",
      "Political socialization"
    ],
    "answer": "Political socialization"
  },
  {
    "id": "GOV018",
    "topic": "Basic Concepts in Government",
    "question": "In Government, Political socialization refers to",
    "options": [
      "Political communication",
      "Political culture",
      "Political socialization",
      "Political participation"
    ],
    "answer": "Political socialization"
  },
  {
    "id": "GOV019",
    "topic": "Basic Concepts in Government",
    "question": "Which of the following is correctly associated with Political socialization?",
    "options": [
      "Political culture",
      "Political communication",
      "Political socialization",
      "Political participation"
    ],
    "answer": "Political socialization"
  },
  {
    "id": "GOV020",
    "topic": "Basic Concepts in Government",
    "question": "The description 'the process through which people acquire political values and attitudes' refers to",
    "options": [
      "Political participation",
      "Political socialization",
      "Political communication",
      "Political culture"
    ],
    "answer": "Political socialization"
  },
  {
    "id": "GOV021",
    "topic": "Basic Concepts in Government",
    "question": "Which term best describes involvement of citizens in political activities?",
    "options": [
      "Judicial review",
      "Political participation",
      "Political socialization",
      "Political culture"
    ],
    "answer": "Political participation"
  },
  {
    "id": "GOV022",
    "topic": "Basic Concepts in Government",
    "question": "In Government, Political participation refers to",
    "options": [
      "Judicial review",
      "Political participation",
      "Political socialization",
      "Political culture"
    ],
    "answer": "Political participation"
  },
  {
    "id": "GOV023",
    "topic": "Basic Concepts in Government",
    "question": "Which of the following is correctly associated with Political participation?",
    "options": [
      "Political culture",
      "Judicial review",
      "Political socialization",
      "Political participation"
    ],
    "answer": "Political participation"
  },
  {
    "id": "GOV024",
    "topic": "Basic Concepts in Government",
    "question": "The description 'involvement of citizens in political activities' refers to",
    "options": [
      "Political participation",
      "Judicial review",
      "Political culture",
      "Political socialization"
    ],
    "answer": "Political participation"
  },
  {
    "id": "GOV025",
    "topic": "Forms of Government",
    "question": "Which term best describes government headed by a monarch?",
    "options": [
      "Oligarchy",
      "Monarchy",
      "Democracy",
      "Republic"
    ],
    "answer": "Monarchy"
  },
  {
    "id": "GOV026",
    "topic": "Forms of Government",
    "question": "In Government, Monarchy refers to",
    "options": [
      "Oligarchy",
      "Monarchy",
      "Republic",
      "Democracy"
    ],
    "answer": "Monarchy"
  },
  {
    "id": "GOV027",
    "topic": "Forms of Government",
    "question": "Which of the following is correctly associated with Monarchy?",
    "options": [
      "Monarchy",
      "Democracy",
      "Oligarchy",
      "Republic"
    ],
    "answer": "Monarchy"
  },
  {
    "id": "GOV028",
    "topic": "Forms of Government",
    "question": "The description 'government headed by a monarch' refers to",
    "options": [
      "Republic",
      "Monarchy",
      "Oligarchy",
      "Democracy"
    ],
    "answer": "Monarchy"
  },
  {
    "id": "GOV029",
    "topic": "Forms of Government",
    "question": "Which term best describes government by a small group?",
    "options": [
      "Democracy",
      "Monarchy",
      "Oligarchy",
      "Aristocracy"
    ],
    "answer": "Oligarchy"
  },
  {
    "id": "GOV030",
    "topic": "Forms of Government",
    "question": "In Government, Oligarchy refers to",
    "options": [
      "Democracy",
      "Oligarchy",
      "Monarchy",
      "Aristocracy"
    ],
    "answer": "Oligarchy"
  },
  {
    "id": "GOV031",
    "topic": "Forms of Government",
    "question": "Which of the following is correctly associated with Oligarchy?",
    "options": [
      "Democracy",
      "Aristocracy",
      "Monarchy",
      "Oligarchy"
    ],
    "answer": "Oligarchy"
  },
  {
    "id": "GOV032",
    "topic": "Forms of Government",
    "question": "The description 'government by a small group' refers to",
    "options": [
      "Aristocracy",
      "Monarchy",
      "Oligarchy",
      "Democracy"
    ],
    "answer": "Oligarchy"
  },
  {
    "id": "GOV033",
    "topic": "Forms of Government",
    "question": "Which term best describes government in which one ruler exercises extensive political power?",
    "options": [
      "Democracy",
      "Federalism",
      "Republicanism",
      "Autocracy"
    ],
    "answer": "Autocracy"
  },
  {
    "id": "GOV034",
    "topic": "Forms of Government",
    "question": "In Government, Autocracy refers to",
    "options": [
      "Republicanism",
      "Autocracy",
      "Democracy",
      "Federalism"
    ],
    "answer": "Autocracy"
  },
  {
    "id": "GOV035",
    "topic": "Forms of Government",
    "question": "Which of the following is correctly associated with Autocracy?",
    "options": [
      "Federalism",
      "Democracy",
      "Autocracy",
      "Republicanism"
    ],
    "answer": "Autocracy"
  },
  {
    "id": "GOV036",
    "topic": "Forms of Government",
    "question": "The description 'government in which one ruler exercises extensive political power' refers to",
    "options": [
      "Autocracy",
      "Republicanism",
      "Democracy",
      "Federalism"
    ],
    "answer": "Autocracy"
  },
  {
    "id": "GOV037",
    "topic": "Forms of Government",
    "question": "Which term best describes government based on popular participation and consent?",
    "options": [
      "Democracy",
      "Autocracy",
      "Oligarchy",
      "Aristocracy"
    ],
    "answer": "Democracy"
  },
  {
    "id": "GOV038",
    "topic": "Forms of Government",
    "question": "In Government, Democracy refers to",
    "options": [
      "Autocracy",
      "Democracy",
      "Aristocracy",
      "Oligarchy"
    ],
    "answer": "Democracy"
  },
  {
    "id": "GOV039",
    "topic": "Forms of Government",
    "question": "Which of the following is correctly associated with Democracy?",
    "options": [
      "Autocracy",
      "Aristocracy",
      "Democracy",
      "Oligarchy"
    ],
    "answer": "Democracy"
  },
  {
    "id": "GOV040",
    "topic": "Forms of Government",
    "question": "The description 'government based on popular participation and consent' refers to",
    "options": [
      "Aristocracy",
      "Democracy",
      "Autocracy",
      "Oligarchy"
    ],
    "answer": "Democracy"
  },
  {
    "id": "GOV041",
    "topic": "Arms of Government",
    "question": "Which term best describes the arm primarily responsible for making laws?",
    "options": [
      "Judiciary",
      "Executive",
      "Legislature",
      "Civil service"
    ],
    "answer": "Legislature"
  },
  {
    "id": "GOV042",
    "topic": "Arms of Government",
    "question": "In Government, Legislature refers to",
    "options": [
      "Legislature",
      "Judiciary",
      "Executive",
      "Civil service"
    ],
    "answer": "Legislature"
  },
  {
    "id": "GOV043",
    "topic": "Arms of Government",
    "question": "Which of the following is correctly associated with Legislature?",
    "options": [
      "Executive",
      "Civil service",
      "Judiciary",
      "Legislature"
    ],
    "answer": "Legislature"
  },
  {
    "id": "GOV044",
    "topic": "Arms of Government",
    "question": "The description 'the arm primarily responsible for making laws' refers to",
    "options": [
      "Civil service",
      "Executive",
      "Legislature",
      "Judiciary"
    ],
    "answer": "Legislature"
  },
  {
    "id": "GOV045",
    "topic": "Arms of Government",
    "question": "Which term best describes the arm primarily responsible for implementing laws and policies?",
    "options": [
      "Legislature",
      "Electorate",
      "Judiciary",
      "Executive"
    ],
    "answer": "Executive"
  },
  {
    "id": "GOV046",
    "topic": "Arms of Government",
    "question": "In Government, Executive refers to",
    "options": [
      "Judiciary",
      "Legislature",
      "Electorate",
      "Executive"
    ],
    "answer": "Executive"
  },
  {
    "id": "GOV047",
    "topic": "Arms of Government",
    "question": "Which of the following is correctly associated with Executive?",
    "options": [
      "Electorate",
      "Executive",
      "Legislature",
      "Judiciary"
    ],
    "answer": "Executive"
  },
  {
    "id": "GOV048",
    "topic": "Arms of Government",
    "question": "The description 'the arm primarily responsible for implementing laws and policies' refers to",
    "options": [
      "Judiciary",
      "Executive",
      "Electorate",
      "Legislature"
    ],
    "answer": "Executive"
  },
  {
    "id": "GOV049",
    "topic": "Arms of Government",
    "question": "Which term best describes the arm responsible for interpreting laws?",
    "options": [
      "Executive",
      "Legislature",
      "Cabinet",
      "Judiciary"
    ],
    "answer": "Judiciary"
  },
  {
    "id": "GOV050",
    "topic": "Arms of Government",
    "question": "In Government, Judiciary refers to",
    "options": [
      "Legislature",
      "Executive",
      "Judiciary",
      "Cabinet"
    ],
    "answer": "Judiciary"
  },
  {
    "id": "GOV051",
    "topic": "Arms of Government",
    "question": "Which of the following is correctly associated with Judiciary?",
    "options": [
      "Legislature",
      "Judiciary",
      "Executive",
      "Cabinet"
    ],
    "answer": "Judiciary"
  },
  {
    "id": "GOV052",
    "topic": "Arms of Government",
    "question": "The description 'the arm responsible for interpreting laws' refers to",
    "options": [
      "Cabinet",
      "Judiciary",
      "Legislature",
      "Executive"
    ],
    "answer": "Judiciary"
  },
  {
    "id": "GOV053",
    "topic": "Arms of Government",
    "question": "Which term best describes a legislature with two chambers?",
    "options": [
      "Judicial council",
      "Bicameral legislature",
      "Unicameral legislature",
      "Federal executive"
    ],
    "answer": "Bicameral legislature"
  },
  {
    "id": "GOV054",
    "topic": "Arms of Government",
    "question": "In Government, Bicameral legislature refers to",
    "options": [
      "Unicameral legislature",
      "Bicameral legislature",
      "Judicial council",
      "Federal executive"
    ],
    "answer": "Bicameral legislature"
  },
  {
    "id": "GOV055",
    "topic": "Arms of Government",
    "question": "Which of the following is correctly associated with Bicameral legislature?",
    "options": [
      "Bicameral legislature",
      "Federal executive",
      "Unicameral legislature",
      "Judicial council"
    ],
    "answer": "Bicameral legislature"
  },
  {
    "id": "GOV056",
    "topic": "Arms of Government",
    "question": "The description 'a legislature with two chambers' refers to",
    "options": [
      "Unicameral legislature",
      "Bicameral legislature",
      "Federal executive",
      "Judicial council"
    ],
    "answer": "Bicameral legislature"
  },
  {
    "id": "GOV057",
    "topic": "Structures of Governance",
    "question": "Which term best describes a system where substantial governmental authority is concentrated at the centre?",
    "options": [
      "Federal government",
      "Unitary government",
      "Parliamentary government",
      "Confederation"
    ],
    "answer": "Unitary government"
  },
  {
    "id": "GOV058",
    "topic": "Structures of Governance",
    "question": "In Government, Unitary government refers to",
    "options": [
      "Unitary government",
      "Confederation",
      "Parliamentary government",
      "Federal government"
    ],
    "answer": "Unitary government"
  },
  {
    "id": "GOV059",
    "topic": "Structures of Governance",
    "question": "Which of the following is correctly associated with Unitary government?",
    "options": [
      "Confederation",
      "Federal government",
      "Parliamentary government",
      "Unitary government"
    ],
    "answer": "Unitary government"
  },
  {
    "id": "GOV060",
    "topic": "Structures of Governance",
    "question": "The description 'a system where substantial governmental authority is concentrated at the centre' refers to",
    "options": [
      "Parliamentary government",
      "Unitary government",
      "Federal government",
      "Confederation"
    ],
    "answer": "Unitary government"
  },
  {
    "id": "GOV061",
    "topic": "Structures of Governance",
    "question": "Which term best describes a system that constitutionally divides powers between central and component governments?",
    "options": [
      "Federal government",
      "Monarchy",
      "Confederation",
      "Unitary government"
    ],
    "answer": "Federal government"
  },
  {
    "id": "GOV062",
    "topic": "Structures of Governance",
    "question": "In Government, Federal government refers to",
    "options": [
      "Federal government",
      "Unitary government",
      "Monarchy",
      "Confederation"
    ],
    "answer": "Federal government"
  },
  {
    "id": "GOV063",
    "topic": "Structures of Governance",
    "question": "Which of the following is correctly associated with Federal government?",
    "options": [
      "Monarchy",
      "Unitary government",
      "Confederation",
      "Federal government"
    ],
    "answer": "Federal government"
  },
  {
    "id": "GOV064",
    "topic": "Structures of Governance",
    "question": "The description 'a system that constitutionally divides powers between central and component governments' refers to",
    "options": [
      "Unitary government",
      "Monarchy",
      "Confederation",
      "Federal government"
    ],
    "answer": "Federal government"
  },
  {
    "id": "GOV065",
    "topic": "Structures of Governance",
    "question": "Which term best describes a loose association in which member states retain substantial sovereignty?",
    "options": [
      "Confederation",
      "Presidential system",
      "Unitary state",
      "Federation"
    ],
    "answer": "Confederation"
  },
  {
    "id": "GOV066",
    "topic": "Structures of Governance",
    "question": "In Government, Confederation refers to",
    "options": [
      "Presidential system",
      "Federation",
      "Confederation",
      "Unitary state"
    ],
    "answer": "Confederation"
  },
  {
    "id": "GOV067",
    "topic": "Structures of Governance",
    "question": "Which of the following is correctly associated with Confederation?",
    "options": [
      "Confederation",
      "Federation",
      "Unitary state",
      "Presidential system"
    ],
    "answer": "Confederation"
  },
  {
    "id": "GOV068",
    "topic": "Structures of Governance",
    "question": "The description 'a loose association in which member states retain substantial sovereignty' refers to",
    "options": [
      "Confederation",
      "Presidential system",
      "Unitary state",
      "Federation"
    ],
    "answer": "Confederation"
  },
  {
    "id": "GOV069",
    "topic": "Systems of Governance",
    "question": "Which term best describes a system in which the executive is institutionally separate from the legislature?",
    "options": [
      "Monarchy",
      "Presidential system",
      "Confederation",
      "Parliamentary system"
    ],
    "answer": "Presidential system"
  },
  {
    "id": "GOV070",
    "topic": "Systems of Governance",
    "question": "In Government, Presidential system refers to",
    "options": [
      "Parliamentary system",
      "Monarchy",
      "Confederation",
      "Presidential system"
    ],
    "answer": "Presidential system"
  },
  {
    "id": "GOV071",
    "topic": "Systems of Governance",
    "question": "Which of the following is correctly associated with Presidential system?",
    "options": [
      "Presidential system",
      "Confederation",
      "Monarchy",
      "Parliamentary system"
    ],
    "answer": "Presidential system"
  },
  {
    "id": "GOV072",
    "topic": "Systems of Governance",
    "question": "The description 'a system in which the executive is institutionally separate from the legislature' refers to",
    "options": [
      "Monarchy",
      "Presidential system",
      "Parliamentary system",
      "Confederation"
    ],
    "answer": "Presidential system"
  },
  {
    "id": "GOV073",
    "topic": "Systems of Governance",
    "question": "Which term best describes a system in which the executive is normally drawn from the legislature?",
    "options": [
      "Federal system",
      "Presidential system",
      "Military system",
      "Parliamentary system"
    ],
    "answer": "Parliamentary system"
  },
  {
    "id": "GOV074",
    "topic": "Systems of Governance",
    "question": "In Government, Parliamentary system refers to",
    "options": [
      "Military system",
      "Parliamentary system",
      "Presidential system",
      "Federal system"
    ],
    "answer": "Parliamentary system"
  },
  {
    "id": "GOV075",
    "topic": "Systems of Governance",
    "question": "Which of the following is correctly associated with Parliamentary system?",
    "options": [
      "Federal system",
      "Parliamentary system",
      "Military system",
      "Presidential system"
    ],
    "answer": "Parliamentary system"
  },
  {
    "id": "GOV076",
    "topic": "Systems of Governance",
    "question": "The description 'a system in which the executive is normally drawn from the legislature' refers to",
    "options": [
      "Military system",
      "Federal system",
      "Presidential system",
      "Parliamentary system"
    ],
    "answer": "Parliamentary system"
  },
  {
    "id": "GOV077",
    "topic": "Systems of Governance",
    "question": "Which term best describes a parliamentary mechanism for testing whether the government retains legislative support?",
    "options": [
      "Vote of no confidence",
      "Veto",
      "Referendum",
      "Impeachment"
    ],
    "answer": "Vote of no confidence"
  },
  {
    "id": "GOV078",
    "topic": "Systems of Governance",
    "question": "In Government, Vote of no confidence refers to",
    "options": [
      "Referendum",
      "Impeachment",
      "Veto",
      "Vote of no confidence"
    ],
    "answer": "Vote of no confidence"
  },
  {
    "id": "GOV079",
    "topic": "Systems of Governance",
    "question": "Which of the following is correctly associated with Vote of no confidence?",
    "options": [
      "Veto",
      "Referendum",
      "Impeachment",
      "Vote of no confidence"
    ],
    "answer": "Vote of no confidence"
  },
  {
    "id": "GOV080",
    "topic": "Systems of Governance",
    "question": "The description 'a parliamentary mechanism for testing whether the government retains legislative support' refers to",
    "options": [
      "Impeachment",
      "Referendum",
      "Veto",
      "Vote of no confidence"
    ],
    "answer": "Vote of no confidence"
  },
  {
    "id": "GOV081",
    "topic": "Political Ideologies",
    "question": "Which term best describes an economic ideology emphasizing private ownership and market activity?",
    "options": [
      "Feudalism",
      "Socialism",
      "Capitalism",
      "Communism"
    ],
    "answer": "Capitalism"
  },
  {
    "id": "GOV082",
    "topic": "Political Ideologies",
    "question": "In Government, Capitalism refers to",
    "options": [
      "Communism",
      "Socialism",
      "Feudalism",
      "Capitalism"
    ],
    "answer": "Capitalism"
  },
  {
    "id": "GOV083",
    "topic": "Political Ideologies",
    "question": "Which of the following is correctly associated with Capitalism?",
    "options": [
      "Capitalism",
      "Communism",
      "Socialism",
      "Feudalism"
    ],
    "answer": "Capitalism"
  },
  {
    "id": "GOV084",
    "topic": "Political Ideologies",
    "question": "The description 'an economic ideology emphasizing private ownership and market activity' refers to",
    "options": [
      "Socialism",
      "Communism",
      "Capitalism",
      "Feudalism"
    ],
    "answer": "Capitalism"
  },
  {
    "id": "GOV085",
    "topic": "Political Ideologies",
    "question": "Which term best describes an ideology emphasizing collective or public control of major productive resources?",
    "options": [
      "Feudalism",
      "Socialism",
      "Fascism",
      "Capitalism"
    ],
    "answer": "Socialism"
  },
  {
    "id": "GOV086",
    "topic": "Political Ideologies",
    "question": "In Government, Socialism refers to",
    "options": [
      "Fascism",
      "Capitalism",
      "Socialism",
      "Feudalism"
    ],
    "answer": "Socialism"
  },
  {
    "id": "GOV087",
    "topic": "Political Ideologies",
    "question": "Which of the following is correctly associated with Socialism?",
    "options": [
      "Fascism",
      "Socialism",
      "Capitalism",
      "Feudalism"
    ],
    "answer": "Socialism"
  },
  {
    "id": "GOV088",
    "topic": "Political Ideologies",
    "question": "The description 'an ideology emphasizing collective or public control of major productive resources' refers to",
    "options": [
      "Feudalism",
      "Fascism",
      "Capitalism",
      "Socialism"
    ],
    "answer": "Socialism"
  },
  {
    "id": "GOV089",
    "topic": "Political Ideologies",
    "question": "Which term best describes an ideology associated with a classless society and common ownership of major productive resources?",
    "options": [
      "Fascism",
      "Liberalism",
      "Communism",
      "Capitalism"
    ],
    "answer": "Communism"
  },
  {
    "id": "GOV090",
    "topic": "Political Ideologies",
    "question": "In Government, Communism refers to",
    "options": [
      "Fascism",
      "Capitalism",
      "Liberalism",
      "Communism"
    ],
    "answer": "Communism"
  },
  {
    "id": "GOV091",
    "topic": "Political Ideologies",
    "question": "Which of the following is correctly associated with Communism?",
    "options": [
      "Communism",
      "Fascism",
      "Liberalism",
      "Capitalism"
    ],
    "answer": "Communism"
  },
  {
    "id": "GOV092",
    "topic": "Political Ideologies",
    "question": "The description 'an ideology associated with a classless society and common ownership of major productive resources' refers to",
    "options": [
      "Fascism",
      "Communism",
      "Liberalism",
      "Capitalism"
    ],
    "answer": "Communism"
  },
  {
    "id": "GOV093",
    "topic": "Political Ideologies",
    "question": "Which term best describes an authoritarian ideology associated with extreme nationalism and centralized leadership?",
    "options": [
      "Liberalism",
      "Communism",
      "Fascism",
      "Socialism"
    ],
    "answer": "Fascism"
  },
  {
    "id": "GOV094",
    "topic": "Political Ideologies",
    "question": "In Government, Fascism refers to",
    "options": [
      "Communism",
      "Fascism",
      "Liberalism",
      "Socialism"
    ],
    "answer": "Fascism"
  },
  {
    "id": "GOV095",
    "topic": "Political Ideologies",
    "question": "Which of the following is correctly associated with Fascism?",
    "options": [
      "Liberalism",
      "Socialism",
      "Communism",
      "Fascism"
    ],
    "answer": "Fascism"
  },
  {
    "id": "GOV096",
    "topic": "Political Ideologies",
    "question": "The description 'an authoritarian ideology associated with extreme nationalism and centralized leadership' refers to",
    "options": [
      "Socialism",
      "Liberalism",
      "Communism",
      "Fascism"
    ],
    "answer": "Fascism"
  },
  {
    "id": "GOV097",
    "topic": "Political Ideologies",
    "question": "Which term best describes the German fascist movement associated with Adolf Hitler?",
    "options": [
      "Nazism",
      "Fascism",
      "Communism",
      "Feudalism"
    ],
    "answer": "Nazism"
  },
  {
    "id": "GOV098",
    "topic": "Political Ideologies",
    "question": "In Government, Nazism refers to",
    "options": [
      "Fascism",
      "Communism",
      "Nazism",
      "Feudalism"
    ],
    "answer": "Nazism"
  },
  {
    "id": "GOV099",
    "topic": "Political Ideologies",
    "question": "Which of the following is correctly associated with Nazism?",
    "options": [
      "Communism",
      "Feudalism",
      "Nazism",
      "Fascism"
    ],
    "answer": "Nazism"
  },
  {
    "id": "GOV100",
    "topic": "Political Ideologies",
    "question": "The description 'the German fascist movement associated with Adolf Hitler' refers to",
    "options": [
      "Communism",
      "Nazism",
      "Fascism",
      "Feudalism"
    ],
    "answer": "Nazism"
  },
  {
    "id": "GOV101",
    "topic": "Constitution",
    "question": "Which term best describes the fundamental rules governing the organization and powers of a state?",
    "options": [
      "Decree",
      "Constitution",
      "Manifesto",
      "Treaty"
    ],
    "answer": "Constitution"
  },
  {
    "id": "GOV102",
    "topic": "Constitution",
    "question": "In Government, Constitution refers to",
    "options": [
      "Constitution",
      "Manifesto",
      "Decree",
      "Treaty"
    ],
    "answer": "Constitution"
  },
  {
    "id": "GOV103",
    "topic": "Constitution",
    "question": "Which of the following is correctly associated with Constitution?",
    "options": [
      "Decree",
      "Manifesto",
      "Treaty",
      "Constitution"
    ],
    "answer": "Constitution"
  },
  {
    "id": "GOV104",
    "topic": "Constitution",
    "question": "The description 'the fundamental rules governing the organization and powers of a state' refers to",
    "options": [
      "Manifesto",
      "Treaty",
      "Constitution",
      "Decree"
    ],
    "answer": "Constitution"
  },
  {
    "id": "GOV105",
    "topic": "Constitution",
    "question": "Which term best describes a constitution that requires a special procedure for amendment?",
    "options": [
      "Flexible constitution",
      "Unwritten constitution",
      "Rigid constitution",
      "Customary law"
    ],
    "answer": "Rigid constitution"
  },
  {
    "id": "GOV106",
    "topic": "Constitution",
    "question": "In Government, Rigid constitution refers to",
    "options": [
      "Unwritten constitution",
      "Customary law",
      "Rigid constitution",
      "Flexible constitution"
    ],
    "answer": "Rigid constitution"
  },
  {
    "id": "GOV107",
    "topic": "Constitution",
    "question": "Which of the following is correctly associated with Rigid constitution?",
    "options": [
      "Customary law",
      "Rigid constitution",
      "Flexible constitution",
      "Unwritten constitution"
    ],
    "answer": "Rigid constitution"
  },
  {
    "id": "GOV108",
    "topic": "Constitution",
    "question": "The description 'a constitution that requires a special procedure for amendment' refers to",
    "options": [
      "Unwritten constitution",
      "Rigid constitution",
      "Customary law",
      "Flexible constitution"
    ],
    "answer": "Rigid constitution"
  },
  {
    "id": "GOV109",
    "topic": "Constitution",
    "question": "Which term best describes a constitution contained substantially in a formal document or set of documents?",
    "options": [
      "Unwritten constitution",
      "Convention",
      "Written constitution",
      "Flexible constitution"
    ],
    "answer": "Written constitution"
  },
  {
    "id": "GOV110",
    "topic": "Constitution",
    "question": "In Government, Written constitution refers to",
    "options": [
      "Flexible constitution",
      "Convention",
      "Written constitution",
      "Unwritten constitution"
    ],
    "answer": "Written constitution"
  },
  {
    "id": "GOV111",
    "topic": "Constitution",
    "question": "Which of the following is correctly associated with Written constitution?",
    "options": [
      "Unwritten constitution",
      "Flexible constitution",
      "Convention",
      "Written constitution"
    ],
    "answer": "Written constitution"
  },
  {
    "id": "GOV112",
    "topic": "Constitution",
    "question": "The description 'a constitution contained substantially in a formal document or set of documents' refers to",
    "options": [
      "Convention",
      "Unwritten constitution",
      "Flexible constitution",
      "Written constitution"
    ],
    "answer": "Written constitution"
  },
  {
    "id": "GOV113",
    "topic": "Constitution",
    "question": "Which term best describes the principle that government is limited by constitutional rules?",
    "options": [
      "Anarchy",
      "Autocracy",
      "Absolutism",
      "Constitutionalism"
    ],
    "answer": "Constitutionalism"
  },
  {
    "id": "GOV114",
    "topic": "Constitution",
    "question": "In Government, Constitutionalism refers to",
    "options": [
      "Anarchy",
      "Absolutism",
      "Autocracy",
      "Constitutionalism"
    ],
    "answer": "Constitutionalism"
  },
  {
    "id": "GOV115",
    "topic": "Constitution",
    "question": "Which of the following is correctly associated with Constitutionalism?",
    "options": [
      "Absolutism",
      "Constitutionalism",
      "Anarchy",
      "Autocracy"
    ],
    "answer": "Constitutionalism"
  },
  {
    "id": "GOV116",
    "topic": "Constitution",
    "question": "The description 'the principle that government is limited by constitutional rules' refers to",
    "options": [
      "Anarchy",
      "Absolutism",
      "Constitutionalism",
      "Autocracy"
    ],
    "answer": "Constitutionalism"
  },
  {
    "id": "GOV117",
    "topic": "Principles of Democratic Government",
    "question": "Which term best describes the principle that all persons and institutions are subject to the law?",
    "options": [
      "Political patronage",
      "Rule by decree",
      "Rule of law",
      "Military rule"
    ],
    "answer": "Rule of law"
  },
  {
    "id": "GOV118",
    "topic": "Principles of Democratic Government",
    "question": "In Government, Rule of law refers to",
    "options": [
      "Military rule",
      "Rule by decree",
      "Political patronage",
      "Rule of law"
    ],
    "answer": "Rule of law"
  },
  {
    "id": "GOV119",
    "topic": "Principles of Democratic Government",
    "question": "Which of the following is correctly associated with Rule of law?",
    "options": [
      "Political patronage",
      "Rule by decree",
      "Military rule",
      "Rule of law"
    ],
    "answer": "Rule of law"
  },
  {
    "id": "GOV120",
    "topic": "Principles of Democratic Government",
    "question": "The description 'the principle that all persons and institutions are subject to the law' refers to",
    "options": [
      "Rule of law",
      "Rule by decree",
      "Political patronage",
      "Military rule"
    ],
    "answer": "Rule of law"
  },
  {
    "id": "GOV121",
    "topic": "Principles of Democratic Government",
    "question": "Which term best describes division of governmental powers among distinct organs?",
    "options": [
      "Party discipline",
      "Separation of powers",
      "Fusion of powers",
      "Unitary government"
    ],
    "answer": "Separation of powers"
  },
  {
    "id": "GOV122",
    "topic": "Principles of Democratic Government",
    "question": "In Government, Separation of powers refers to",
    "options": [
      "Unitary government",
      "Separation of powers",
      "Party discipline",
      "Fusion of powers"
    ],
    "answer": "Separation of powers"
  },
  {
    "id": "GOV123",
    "topic": "Principles of Democratic Government",
    "question": "Which of the following is correctly associated with Separation of powers?",
    "options": [
      "Fusion of powers",
      "Separation of powers",
      "Unitary government",
      "Party discipline"
    ],
    "answer": "Separation of powers"
  },
  {
    "id": "GOV124",
    "topic": "Principles of Democratic Government",
    "question": "The description 'division of governmental powers among distinct organs' refers to",
    "options": [
      "Fusion of powers",
      "Unitary government",
      "Party discipline",
      "Separation of powers"
    ],
    "answer": "Separation of powers"
  },
  {
    "id": "GOV125",
    "topic": "Principles of Democratic Government",
    "question": "Which term best describes mechanisms through which governmental organs limit or scrutinize one another?",
    "options": [
      "Checks and balances",
      "Federal character",
      "Collective bargaining",
      "Referendum"
    ],
    "answer": "Checks and balances"
  },
  {
    "id": "GOV126",
    "topic": "Principles of Democratic Government",
    "question": "In Government, Checks and balances refers to",
    "options": [
      "Referendum",
      "Federal character",
      "Checks and balances",
      "Collective bargaining"
    ],
    "answer": "Checks and balances"
  },
  {
    "id": "GOV127",
    "topic": "Principles of Democratic Government",
    "question": "Which of the following is correctly associated with Checks and balances?",
    "options": [
      "Collective bargaining",
      "Federal character",
      "Checks and balances",
      "Referendum"
    ],
    "answer": "Checks and balances"
  },
  {
    "id": "GOV128",
    "topic": "Principles of Democratic Government",
    "question": "The description 'mechanisms through which governmental organs limit or scrutinize one another' refers to",
    "options": [
      "Checks and balances",
      "Federal character",
      "Collective bargaining",
      "Referendum"
    ],
    "answer": "Checks and balances"
  },
  {
    "id": "GOV129",
    "topic": "Principles of Democratic Government",
    "question": "Which term best describes a system in which citizens choose representatives to govern on their behalf?",
    "options": [
      "Absolute monarchy",
      "Direct democracy",
      "Representative government",
      "Military rule"
    ],
    "answer": "Representative government"
  },
  {
    "id": "GOV130",
    "topic": "Principles of Democratic Government",
    "question": "In Government, Representative government refers to",
    "options": [
      "Absolute monarchy",
      "Direct democracy",
      "Representative government",
      "Military rule"
    ],
    "answer": "Representative government"
  },
  {
    "id": "GOV131",
    "topic": "Principles of Democratic Government",
    "question": "Which of the following is correctly associated with Representative government?",
    "options": [
      "Absolute monarchy",
      "Military rule",
      "Direct democracy",
      "Representative government"
    ],
    "answer": "Representative government"
  },
  {
    "id": "GOV132",
    "topic": "Principles of Democratic Government",
    "question": "The description 'a system in which citizens choose representatives to govern on their behalf' refers to",
    "options": [
      "Military rule",
      "Direct democracy",
      "Absolute monarchy",
      "Representative government"
    ],
    "answer": "Representative government"
  },
  {
    "id": "GOV133",
    "topic": "Citizenship",
    "question": "Which term best describes citizenship acquired through conditions relating to birth and parentage under law?",
    "options": [
      "Renunciation",
      "Registration",
      "Citizenship by birth",
      "Naturalization"
    ],
    "answer": "Citizenship by birth"
  },
  {
    "id": "GOV134",
    "topic": "Citizenship",
    "question": "In Government, Citizenship by birth refers to",
    "options": [
      "Registration",
      "Renunciation",
      "Naturalization",
      "Citizenship by birth"
    ],
    "answer": "Citizenship by birth"
  },
  {
    "id": "GOV135",
    "topic": "Citizenship",
    "question": "Which of the following is correctly associated with Citizenship by birth?",
    "options": [
      "Naturalization",
      "Registration",
      "Renunciation",
      "Citizenship by birth"
    ],
    "answer": "Citizenship by birth"
  },
  {
    "id": "GOV136",
    "topic": "Citizenship",
    "question": "The description 'citizenship acquired through conditions relating to birth and parentage under law' refers to",
    "options": [
      "Renunciation",
      "Registration",
      "Naturalization",
      "Citizenship by birth"
    ],
    "answer": "Citizenship by birth"
  },
  {
    "id": "GOV137",
    "topic": "Citizenship",
    "question": "Which term best describes acquisition of citizenship after meeting legal conditions and applying?",
    "options": [
      "Birth",
      "Renunciation",
      "Naturalization",
      "Deprivation"
    ],
    "answer": "Naturalization"
  },
  {
    "id": "GOV138",
    "topic": "Citizenship",
    "question": "In Government, Naturalization refers to",
    "options": [
      "Deprivation",
      "Naturalization",
      "Birth",
      "Renunciation"
    ],
    "answer": "Naturalization"
  },
  {
    "id": "GOV139",
    "topic": "Citizenship",
    "question": "Which of the following is correctly associated with Naturalization?",
    "options": [
      "Naturalization",
      "Birth",
      "Renunciation",
      "Deprivation"
    ],
    "answer": "Naturalization"
  },
  {
    "id": "GOV140",
    "topic": "Citizenship",
    "question": "The description 'acquisition of citizenship after meeting legal conditions and applying' refers to",
    "options": [
      "Naturalization",
      "Renunciation",
      "Birth",
      "Deprivation"
    ],
    "answer": "Naturalization"
  },
  {
    "id": "GOV141",
    "topic": "Citizenship",
    "question": "Which term best describes holding citizenship of two states where permitted by law?",
    "options": [
      "Exile",
      "Statelessness",
      "Dual citizenship",
      "Naturalization"
    ],
    "answer": "Dual citizenship"
  },
  {
    "id": "GOV142",
    "topic": "Citizenship",
    "question": "In Government, Dual citizenship refers to",
    "options": [
      "Naturalization",
      "Statelessness",
      "Dual citizenship",
      "Exile"
    ],
    "answer": "Dual citizenship"
  },
  {
    "id": "GOV143",
    "topic": "Citizenship",
    "question": "Which of the following is correctly associated with Dual citizenship?",
    "options": [
      "Exile",
      "Dual citizenship",
      "Statelessness",
      "Naturalization"
    ],
    "answer": "Dual citizenship"
  },
  {
    "id": "GOV144",
    "topic": "Citizenship",
    "question": "The description 'holding citizenship of two states where permitted by law' refers to",
    "options": [
      "Exile",
      "Naturalization",
      "Dual citizenship",
      "Statelessness"
    ],
    "answer": "Dual citizenship"
  },
  {
    "id": "GOV145",
    "topic": "Citizenship",
    "question": "Which term best describes voluntary surrender of citizenship according to law?",
    "options": [
      "Naturalization",
      "Renunciation",
      "Registration",
      "Deprivation"
    ],
    "answer": "Renunciation"
  },
  {
    "id": "GOV146",
    "topic": "Citizenship",
    "question": "In Government, Renunciation refers to",
    "options": [
      "Renunciation",
      "Deprivation",
      "Naturalization",
      "Registration"
    ],
    "answer": "Renunciation"
  },
  {
    "id": "GOV147",
    "topic": "Citizenship",
    "question": "Which of the following is correctly associated with Renunciation?",
    "options": [
      "Renunciation",
      "Naturalization",
      "Registration",
      "Deprivation"
    ],
    "answer": "Renunciation"
  },
  {
    "id": "GOV148",
    "topic": "Citizenship",
    "question": "The description 'voluntary surrender of citizenship according to law' refers to",
    "options": [
      "Deprivation",
      "Renunciation",
      "Naturalization",
      "Registration"
    ],
    "answer": "Renunciation"
  },
  {
    "id": "GOV149",
    "topic": "Fundamental Human Rights",
    "question": "Which term best describes the right to have a case determined fairly by a competent and impartial process?",
    "options": [
      "Right to fair hearing",
      "Freedom of movement",
      "Right to property",
      "Freedom of association"
    ],
    "answer": "Right to fair hearing"
  },
  {
    "id": "GOV150",
    "topic": "Fundamental Human Rights",
    "question": "In Government, Right to fair hearing refers to",
    "options": [
      "Freedom of association",
      "Freedom of movement",
      "Right to fair hearing",
      "Right to property"
    ],
    "answer": "Right to fair hearing"
  },
  {
    "id": "GOV151",
    "topic": "Fundamental Human Rights",
    "question": "Which of the following is correctly associated with Right to fair hearing?",
    "options": [
      "Freedom of association",
      "Right to property",
      "Right to fair hearing",
      "Freedom of movement"
    ],
    "answer": "Right to fair hearing"
  },
  {
    "id": "GOV152",
    "topic": "Fundamental Human Rights",
    "question": "The description 'the right to have a case determined fairly by a competent and impartial process' refers to",
    "options": [
      "Freedom of movement",
      "Right to fair hearing",
      "Freedom of association",
      "Right to property"
    ],
    "answer": "Right to fair hearing"
  },
  {
    "id": "GOV153",
    "topic": "Fundamental Human Rights",
    "question": "Which term best describes the liberty to express lawful opinions?",
    "options": [
      "Right to life",
      "Freedom of association",
      "Right to privacy",
      "Freedom of expression"
    ],
    "answer": "Freedom of expression"
  },
  {
    "id": "GOV154",
    "topic": "Fundamental Human Rights",
    "question": "In Government, Freedom of expression refers to",
    "options": [
      "Freedom of association",
      "Right to privacy",
      "Freedom of expression",
      "Right to life"
    ],
    "answer": "Freedom of expression"
  },
  {
    "id": "GOV155",
    "topic": "Fundamental Human Rights",
    "question": "Which of the following is correctly associated with Freedom of expression?",
    "options": [
      "Freedom of expression",
      "Right to life",
      "Freedom of association",
      "Right to privacy"
    ],
    "answer": "Freedom of expression"
  },
  {
    "id": "GOV156",
    "topic": "Fundamental Human Rights",
    "question": "The description 'the liberty to express lawful opinions' refers to",
    "options": [
      "Right to life",
      "Right to privacy",
      "Freedom of expression",
      "Freedom of association"
    ],
    "answer": "Freedom of expression"
  },
  {
    "id": "GOV157",
    "topic": "Fundamental Human Rights",
    "question": "Which term best describes the right to form or join lawful associations?",
    "options": [
      "Right to fair hearing",
      "Freedom of expression",
      "Right to property",
      "Freedom of association"
    ],
    "answer": "Freedom of association"
  },
  {
    "id": "GOV158",
    "topic": "Fundamental Human Rights",
    "question": "In Government, Freedom of association refers to",
    "options": [
      "Freedom of expression",
      "Right to fair hearing",
      "Right to property",
      "Freedom of association"
    ],
    "answer": "Freedom of association"
  },
  {
    "id": "GOV159",
    "topic": "Fundamental Human Rights",
    "question": "Which of the following is correctly associated with Freedom of association?",
    "options": [
      "Right to property",
      "Freedom of expression",
      "Freedom of association",
      "Right to fair hearing"
    ],
    "answer": "Freedom of association"
  },
  {
    "id": "GOV160",
    "topic": "Fundamental Human Rights",
    "question": "The description 'the right to form or join lawful associations' refers to",
    "options": [
      "Freedom of association",
      "Freedom of expression",
      "Right to fair hearing",
      "Right to property"
    ],
    "answer": "Freedom of association"
  },
  {
    "id": "GOV161",
    "topic": "Fundamental Human Rights",
    "question": "Which term best describes protection against arbitrary deprivation of freedom?",
    "options": [
      "Right to education",
      "Right to personal liberty",
      "Right to privacy",
      "Right to vote"
    ],
    "answer": "Right to personal liberty"
  },
  {
    "id": "GOV162",
    "topic": "Fundamental Human Rights",
    "question": "In Government, Right to personal liberty refers to",
    "options": [
      "Right to vote",
      "Right to education",
      "Right to personal liberty",
      "Right to privacy"
    ],
    "answer": "Right to personal liberty"
  },
  {
    "id": "GOV163",
    "topic": "Fundamental Human Rights",
    "question": "Which of the following is correctly associated with Right to personal liberty?",
    "options": [
      "Right to personal liberty",
      "Right to education",
      "Right to privacy",
      "Right to vote"
    ],
    "answer": "Right to personal liberty"
  },
  {
    "id": "GOV164",
    "topic": "Fundamental Human Rights",
    "question": "The description 'protection against arbitrary deprivation of freedom' refers to",
    "options": [
      "Right to vote",
      "Right to education",
      "Right to privacy",
      "Right to personal liberty"
    ],
    "answer": "Right to personal liberty"
  },
  {
    "id": "GOV165",
    "topic": "Electoral Process",
    "question": "Which term best describes a voting method designed to protect the voter's choice from disclosure?",
    "options": [
      "Referendum",
      "Proxy voting",
      "Secret ballot",
      "Open ballot"
    ],
    "answer": "Secret ballot"
  },
  {
    "id": "GOV166",
    "topic": "Electoral Process",
    "question": "In Government, Secret ballot refers to",
    "options": [
      "Secret ballot",
      "Open ballot",
      "Referendum",
      "Proxy voting"
    ],
    "answer": "Secret ballot"
  },
  {
    "id": "GOV167",
    "topic": "Electoral Process",
    "question": "Which of the following is correctly associated with Secret ballot?",
    "options": [
      "Proxy voting",
      "Referendum",
      "Open ballot",
      "Secret ballot"
    ],
    "answer": "Secret ballot"
  },
  {
    "id": "GOV168",
    "topic": "Electoral Process",
    "question": "The description 'a voting method designed to protect the voter's choice from disclosure' refers to",
    "options": [
      "Referendum",
      "Open ballot",
      "Secret ballot",
      "Proxy voting"
    ],
    "answer": "Secret ballot"
  },
  {
    "id": "GOV169",
    "topic": "Electoral Process",
    "question": "Which term best describes an election held to fill a vacant elective seat before the normal election cycle?",
    "options": [
      "Primary election",
      "By-election",
      "Referendum",
      "General election"
    ],
    "answer": "By-election"
  },
  {
    "id": "GOV170",
    "topic": "Electoral Process",
    "question": "In Government, By-election refers to",
    "options": [
      "Primary election",
      "By-election",
      "General election",
      "Referendum"
    ],
    "answer": "By-election"
  },
  {
    "id": "GOV171",
    "topic": "Electoral Process",
    "question": "Which of the following is correctly associated with By-election?",
    "options": [
      "By-election",
      "Primary election",
      "Referendum",
      "General election"
    ],
    "answer": "By-election"
  },
  {
    "id": "GOV172",
    "topic": "Electoral Process",
    "question": "The description 'an election held to fill a vacant elective seat before the normal election cycle' refers to",
    "options": [
      "Referendum",
      "General election",
      "Primary election",
      "By-election"
    ],
    "answer": "By-election"
  },
  {
    "id": "GOV173",
    "topic": "Electoral Process",
    "question": "Which term best describes a legal challenge to the validity or conduct of an election?",
    "options": [
      "Manifesto",
      "Constitution",
      "Bill",
      "Election petition"
    ],
    "answer": "Election petition"
  },
  {
    "id": "GOV174",
    "topic": "Electoral Process",
    "question": "In Government, Election petition refers to",
    "options": [
      "Election petition",
      "Bill",
      "Manifesto",
      "Constitution"
    ],
    "answer": "Election petition"
  },
  {
    "id": "GOV175",
    "topic": "Electoral Process",
    "question": "Which of the following is correctly associated with Election petition?",
    "options": [
      "Constitution",
      "Manifesto",
      "Election petition",
      "Bill"
    ],
    "answer": "Election petition"
  },
  {
    "id": "GOV176",
    "topic": "Electoral Process",
    "question": "The description 'a legal challenge to the validity or conduct of an election' refers to",
    "options": [
      "Manifesto",
      "Bill",
      "Constitution",
      "Election petition"
    ],
    "answer": "Election petition"
  },
  {
    "id": "GOV177",
    "topic": "Electoral Process",
    "question": "Which term best describes the process of enrolling eligible citizens in the electoral register?",
    "options": [
      "Population census",
      "National identification",
      "Voter registration",
      "Party registration"
    ],
    "answer": "Voter registration"
  },
  {
    "id": "GOV178",
    "topic": "Electoral Process",
    "question": "In Government, Voter registration refers to",
    "options": [
      "Party registration",
      "Population census",
      "National identification",
      "Voter registration"
    ],
    "answer": "Voter registration"
  },
  {
    "id": "GOV179",
    "topic": "Electoral Process",
    "question": "Which of the following is correctly associated with Voter registration?",
    "options": [
      "Population census",
      "National identification",
      "Party registration",
      "Voter registration"
    ],
    "answer": "Voter registration"
  },
  {
    "id": "GOV180",
    "topic": "Electoral Process",
    "question": "The description 'the process of enrolling eligible citizens in the electoral register' refers to",
    "options": [
      "Population census",
      "Party registration",
      "National identification",
      "Voter registration"
    ],
    "answer": "Voter registration"
  },
  {
    "id": "GOV181",
    "topic": "Electoral Systems",
    "question": "Which term best describes an electoral method in which the candidate with the highest votes in a constituency wins?",
    "options": [
      "Proportional representation",
      "Single transferable vote",
      "First-past-the-post",
      "Run-off system"
    ],
    "answer": "First-past-the-post"
  },
  {
    "id": "GOV182",
    "topic": "Electoral Systems",
    "question": "In Government, First-past-the-post refers to",
    "options": [
      "First-past-the-post",
      "Run-off system",
      "Proportional representation",
      "Single transferable vote"
    ],
    "answer": "First-past-the-post"
  },
  {
    "id": "GOV183",
    "topic": "Electoral Systems",
    "question": "Which of the following is correctly associated with First-past-the-post?",
    "options": [
      "Single transferable vote",
      "Run-off system",
      "First-past-the-post",
      "Proportional representation"
    ],
    "answer": "First-past-the-post"
  },
  {
    "id": "GOV184",
    "topic": "Electoral Systems",
    "question": "The description 'an electoral method in which the candidate with the highest votes in a constituency wins' refers to",
    "options": [
      "Run-off system",
      "First-past-the-post",
      "Proportional representation",
      "Single transferable vote"
    ],
    "answer": "First-past-the-post"
  },
  {
    "id": "GOV185",
    "topic": "Electoral Systems",
    "question": "Which term best describes an electoral method that seeks to allocate seats broadly according to vote shares?",
    "options": [
      "First-past-the-post",
      "Absolute majority",
      "Plurality rule",
      "Proportional representation"
    ],
    "answer": "Proportional representation"
  },
  {
    "id": "GOV186",
    "topic": "Electoral Systems",
    "question": "In Government, Proportional representation refers to",
    "options": [
      "Absolute majority",
      "Proportional representation",
      "Plurality rule",
      "First-past-the-post"
    ],
    "answer": "Proportional representation"
  },
  {
    "id": "GOV187",
    "topic": "Electoral Systems",
    "question": "Which of the following is correctly associated with Proportional representation?",
    "options": [
      "First-past-the-post",
      "Plurality rule",
      "Proportional representation",
      "Absolute majority"
    ],
    "answer": "Proportional representation"
  },
  {
    "id": "GOV188",
    "topic": "Electoral Systems",
    "question": "The description 'an electoral method that seeks to allocate seats broadly according to vote shares' refers to",
    "options": [
      "Proportional representation",
      "Plurality rule",
      "Absolute majority",
      "First-past-the-post"
    ],
    "answer": "Proportional representation"
  },
  {
    "id": "GOV189",
    "topic": "Electoral Systems",
    "question": "Which term best describes a second round used when no candidate reaches the required threshold in the first round?",
    "options": [
      "Run-off election",
      "By-election",
      "Primary election",
      "Referendum"
    ],
    "answer": "Run-off election"
  },
  {
    "id": "GOV190",
    "topic": "Electoral Systems",
    "question": "In Government, Run-off election refers to",
    "options": [
      "Primary election",
      "Referendum",
      "Run-off election",
      "By-election"
    ],
    "answer": "Run-off election"
  },
  {
    "id": "GOV191",
    "topic": "Electoral Systems",
    "question": "Which of the following is correctly associated with Run-off election?",
    "options": [
      "Primary election",
      "By-election",
      "Referendum",
      "Run-off election"
    ],
    "answer": "Run-off election"
  },
  {
    "id": "GOV192",
    "topic": "Electoral Systems",
    "question": "The description 'a second round used when no candidate reaches the required threshold in the first round' refers to",
    "options": [
      "Run-off election",
      "Primary election",
      "Referendum",
      "By-election"
    ],
    "answer": "Run-off election"
  },
  {
    "id": "GOV193",
    "topic": "Political Parties",
    "question": "Which term best describes an organized group seeking political power through lawful political means?",
    "options": [
      "Political party",
      "Pressure group",
      "Civil service",
      "Trade union"
    ],
    "answer": "Political party"
  },
  {
    "id": "GOV194",
    "topic": "Political Parties",
    "question": "In Government, Political party refers to",
    "options": [
      "Civil service",
      "Pressure group",
      "Political party",
      "Trade union"
    ],
    "answer": "Political party"
  },
  {
    "id": "GOV195",
    "topic": "Political Parties",
    "question": "Which of the following is correctly associated with Political party?",
    "options": [
      "Pressure group",
      "Political party",
      "Trade union",
      "Civil service"
    ],
    "answer": "Political party"
  },
  {
    "id": "GOV196",
    "topic": "Political Parties",
    "question": "The description 'an organized group seeking political power through lawful political means' refers to",
    "options": [
      "Civil service",
      "Trade union",
      "Political party",
      "Pressure group"
    ],
    "answer": "Political party"
  },
  {
    "id": "GOV197",
    "topic": "Political Parties",
    "question": "Which term best describes a document stating a party's proposed policies and programmes?",
    "options": [
      "Court judgment",
      "Constitution",
      "Budget",
      "Party manifesto"
    ],
    "answer": "Party manifesto"
  },
  {
    "id": "GOV198",
    "topic": "Political Parties",
    "question": "In Government, Party manifesto refers to",
    "options": [
      "Budget",
      "Party manifesto",
      "Court judgment",
      "Constitution"
    ],
    "answer": "Party manifesto"
  },
  {
    "id": "GOV199",
    "topic": "Political Parties",
    "question": "Which of the following is correctly associated with Party manifesto?",
    "options": [
      "Constitution",
      "Party manifesto",
      "Budget",
      "Court judgment"
    ],
    "answer": "Party manifesto"
  },
  {
    "id": "GOV200",
    "topic": "Political Parties",
    "question": "The description 'a document stating a party's proposed policies and programmes' refers to",
    "options": [
      "Constitution",
      "Court judgment",
      "Budget",
      "Party manifesto"
    ],
    "answer": "Party manifesto"
  },
  {
    "id": "GOV201",
    "topic": "Political Parties",
    "question": "Which term best describes a government formed by two or more parties sharing power?",
    "options": [
      "Military government",
      "Caretaker government",
      "Coalition government",
      "One-party government"
    ],
    "answer": "Coalition government"
  },
  {
    "id": "GOV202",
    "topic": "Political Parties",
    "question": "In Government, Coalition government refers to",
    "options": [
      "One-party government",
      "Coalition government",
      "Caretaker government",
      "Military government"
    ],
    "answer": "Coalition government"
  },
  {
    "id": "GOV203",
    "topic": "Political Parties",
    "question": "Which of the following is correctly associated with Coalition government?",
    "options": [
      "Caretaker government",
      "Coalition government",
      "Military government",
      "One-party government"
    ],
    "answer": "Coalition government"
  },
  {
    "id": "GOV204",
    "topic": "Political Parties",
    "question": "The description 'a government formed by two or more parties sharing power' refers to",
    "options": [
      "Caretaker government",
      "Military government",
      "Coalition government",
      "One-party government"
    ],
    "answer": "Coalition government"
  },
  {
    "id": "GOV205",
    "topic": "Political Parties",
    "question": "Which term best describes a system in which several political parties compete for power?",
    "options": [
      "Multi-party system",
      "Military system",
      "Two-party system",
      "One-party system"
    ],
    "answer": "Multi-party system"
  },
  {
    "id": "GOV206",
    "topic": "Political Parties",
    "question": "In Government, Multi-party system refers to",
    "options": [
      "Multi-party system",
      "Two-party system",
      "One-party system",
      "Military system"
    ],
    "answer": "Multi-party system"
  },
  {
    "id": "GOV207",
    "topic": "Political Parties",
    "question": "Which of the following is correctly associated with Multi-party system?",
    "options": [
      "One-party system",
      "Multi-party system",
      "Military system",
      "Two-party system"
    ],
    "answer": "Multi-party system"
  },
  {
    "id": "GOV208",
    "topic": "Political Parties",
    "question": "The description 'a system in which several political parties compete for power' refers to",
    "options": [
      "Military system",
      "Multi-party system",
      "Two-party system",
      "One-party system"
    ],
    "answer": "Multi-party system"
  },
  {
    "id": "GOV209",
    "topic": "Pressure Groups",
    "question": "Which term best describes an organized group seeking to influence public policy without primarily seeking to form government?",
    "options": [
      "Pressure group",
      "Political party",
      "Cabinet",
      "Judiciary"
    ],
    "answer": "Pressure group"
  },
  {
    "id": "GOV210",
    "topic": "Pressure Groups",
    "question": "In Government, Pressure group refers to",
    "options": [
      "Cabinet",
      "Pressure group",
      "Political party",
      "Judiciary"
    ],
    "answer": "Pressure group"
  },
  {
    "id": "GOV211",
    "topic": "Pressure Groups",
    "question": "Which of the following is correctly associated with Pressure group?",
    "options": [
      "Pressure group",
      "Political party",
      "Cabinet",
      "Judiciary"
    ],
    "answer": "Pressure group"
  },
  {
    "id": "GOV212",
    "topic": "Pressure Groups",
    "question": "The description 'an organized group seeking to influence public policy without primarily seeking to form government' refers to",
    "options": [
      "Pressure group",
      "Cabinet",
      "Judiciary",
      "Political party"
    ],
    "answer": "Pressure group"
  },
  {
    "id": "GOV213",
    "topic": "Pressure Groups",
    "question": "Which term best describes direct attempts to influence public officials or policy-makers?",
    "options": [
      "Census",
      "Litigation",
      "Referendum",
      "Lobbying"
    ],
    "answer": "Lobbying"
  },
  {
    "id": "GOV214",
    "topic": "Pressure Groups",
    "question": "In Government, Lobbying refers to",
    "options": [
      "Referendum",
      "Census",
      "Litigation",
      "Lobbying"
    ],
    "answer": "Lobbying"
  },
  {
    "id": "GOV215",
    "topic": "Pressure Groups",
    "question": "Which of the following is correctly associated with Lobbying?",
    "options": [
      "Referendum",
      "Lobbying",
      "Litigation",
      "Census"
    ],
    "answer": "Lobbying"
  },
  {
    "id": "GOV216",
    "topic": "Pressure Groups",
    "question": "The description 'direct attempts to influence public officials or policy-makers' refers to",
    "options": [
      "Census",
      "Lobbying",
      "Litigation",
      "Referendum"
    ],
    "answer": "Lobbying"
  },
  {
    "id": "GOV217",
    "topic": "Pressure Groups",
    "question": "Which term best describes a group representing the interests of a particular section of society?",
    "options": [
      "Political party",
      "Sectional pressure group",
      "Electoral commission",
      "Promotional group"
    ],
    "answer": "Sectional pressure group"
  },
  {
    "id": "GOV218",
    "topic": "Pressure Groups",
    "question": "In Government, Sectional pressure group refers to",
    "options": [
      "Electoral commission",
      "Sectional pressure group",
      "Promotional group",
      "Political party"
    ],
    "answer": "Sectional pressure group"
  },
  {
    "id": "GOV219",
    "topic": "Pressure Groups",
    "question": "Which of the following is correctly associated with Sectional pressure group?",
    "options": [
      "Political party",
      "Sectional pressure group",
      "Promotional group",
      "Electoral commission"
    ],
    "answer": "Sectional pressure group"
  },
  {
    "id": "GOV220",
    "topic": "Pressure Groups",
    "question": "The description 'a group representing the interests of a particular section of society' refers to",
    "options": [
      "Electoral commission",
      "Promotional group",
      "Political party",
      "Sectional pressure group"
    ],
    "answer": "Sectional pressure group"
  },
  {
    "id": "GOV221",
    "topic": "Public Opinion and Mass Media",
    "question": "Which term best describes the prevailing views of people on public issues?",
    "options": [
      "Political ideology",
      "Public opinion",
      "Judicial precedent",
      "Party manifesto"
    ],
    "answer": "Public opinion"
  },
  {
    "id": "GOV222",
    "topic": "Public Opinion and Mass Media",
    "question": "In Government, Public opinion refers to",
    "options": [
      "Public opinion",
      "Party manifesto",
      "Judicial precedent",
      "Political ideology"
    ],
    "answer": "Public opinion"
  },
  {
    "id": "GOV223",
    "topic": "Public Opinion and Mass Media",
    "question": "Which of the following is correctly associated with Public opinion?",
    "options": [
      "Party manifesto",
      "Public opinion",
      "Political ideology",
      "Judicial precedent"
    ],
    "answer": "Public opinion"
  },
  {
    "id": "GOV224",
    "topic": "Public Opinion and Mass Media",
    "question": "The description 'the prevailing views of people on public issues' refers to",
    "options": [
      "Public opinion",
      "Political ideology",
      "Judicial precedent",
      "Party manifesto"
    ],
    "answer": "Public opinion"
  },
  {
    "id": "GOV225",
    "topic": "Public Opinion and Mass Media",
    "question": "Which term best describes a survey designed to measure attitudes or preferences?",
    "options": [
      "Referendum",
      "Census",
      "Opinion poll",
      "Election"
    ],
    "answer": "Opinion poll"
  },
  {
    "id": "GOV226",
    "topic": "Public Opinion and Mass Media",
    "question": "In Government, Opinion poll refers to",
    "options": [
      "Election",
      "Census",
      "Referendum",
      "Opinion poll"
    ],
    "answer": "Opinion poll"
  },
  {
    "id": "GOV227",
    "topic": "Public Opinion and Mass Media",
    "question": "Which of the following is correctly associated with Opinion poll?",
    "options": [
      "Election",
      "Referendum",
      "Opinion poll",
      "Census"
    ],
    "answer": "Opinion poll"
  },
  {
    "id": "GOV228",
    "topic": "Public Opinion and Mass Media",
    "question": "The description 'a survey designed to measure attitudes or preferences' refers to",
    "options": [
      "Referendum",
      "Election",
      "Census",
      "Opinion poll"
    ],
    "answer": "Opinion poll"
  },
  {
    "id": "GOV229",
    "topic": "Public Opinion and Mass Media",
    "question": "Which term best describes journalistic work aimed at uncovering information or possible wrongdoing through detailed inquiry?",
    "options": [
      "Investigative journalism",
      "Propaganda",
      "Censorship",
      "Political socialization"
    ],
    "answer": "Investigative journalism"
  },
  {
    "id": "GOV230",
    "topic": "Public Opinion and Mass Media",
    "question": "In Government, Investigative journalism refers to",
    "options": [
      "Censorship",
      "Investigative journalism",
      "Political socialization",
      "Propaganda"
    ],
    "answer": "Investigative journalism"
  },
  {
    "id": "GOV231",
    "topic": "Public Opinion and Mass Media",
    "question": "Which of the following is correctly associated with Investigative journalism?",
    "options": [
      "Investigative journalism",
      "Censorship",
      "Political socialization",
      "Propaganda"
    ],
    "answer": "Investigative journalism"
  },
  {
    "id": "GOV232",
    "topic": "Public Opinion and Mass Media",
    "question": "The description 'journalistic work aimed at uncovering information or possible wrongdoing through detailed inquiry' refers to",
    "options": [
      "Investigative journalism",
      "Censorship",
      "Political socialization",
      "Propaganda"
    ],
    "answer": "Investigative journalism"
  },
  {
    "id": "GOV233",
    "topic": "Public Opinion and Mass Media",
    "question": "Which term best describes the restriction or control of publication or communication?",
    "options": [
      "Referendum",
      "Public opinion",
      "Lobbying",
      "Censorship"
    ],
    "answer": "Censorship"
  },
  {
    "id": "GOV234",
    "topic": "Public Opinion and Mass Media",
    "question": "In Government, Censorship refers to",
    "options": [
      "Censorship",
      "Public opinion",
      "Referendum",
      "Lobbying"
    ],
    "answer": "Censorship"
  },
  {
    "id": "GOV235",
    "topic": "Public Opinion and Mass Media",
    "question": "Which of the following is correctly associated with Censorship?",
    "options": [
      "Lobbying",
      "Referendum",
      "Censorship",
      "Public opinion"
    ],
    "answer": "Censorship"
  },
  {
    "id": "GOV236",
    "topic": "Public Opinion and Mass Media",
    "question": "The description 'the restriction or control of publication or communication' refers to",
    "options": [
      "Public opinion",
      "Censorship",
      "Referendum",
      "Lobbying"
    ],
    "answer": "Censorship"
  },
  {
    "id": "GOV237",
    "topic": "Legislative Process",
    "question": "Which term best describes a proposed law presented to a legislature?",
    "options": [
      "Act",
      "Manifesto",
      "Bill",
      "Treaty"
    ],
    "answer": "Bill"
  },
  {
    "id": "GOV238",
    "topic": "Legislative Process",
    "question": "In Government, Bill refers to",
    "options": [
      "Treaty",
      "Bill",
      "Manifesto",
      "Act"
    ],
    "answer": "Bill"
  },
  {
    "id": "GOV239",
    "topic": "Legislative Process",
    "question": "Which of the following is correctly associated with Bill?",
    "options": [
      "Act",
      "Treaty",
      "Manifesto",
      "Bill"
    ],
    "answer": "Bill"
  },
  {
    "id": "GOV240",
    "topic": "Legislative Process",
    "question": "The description 'a proposed law presented to a legislature' refers to",
    "options": [
      "Bill",
      "Treaty",
      "Act",
      "Manifesto"
    ],
    "answer": "Bill"
  },
  {
    "id": "GOV241",
    "topic": "Legislative Process",
    "question": "Which term best describes the stage at which a bill is examined in detail by a legislative committee?",
    "options": [
      "Committee stage",
      "Assent",
      "Third reading",
      "First reading"
    ],
    "answer": "Committee stage"
  },
  {
    "id": "GOV242",
    "topic": "Legislative Process",
    "question": "In Government, Committee stage refers to",
    "options": [
      "Third reading",
      "Assent",
      "First reading",
      "Committee stage"
    ],
    "answer": "Committee stage"
  },
  {
    "id": "GOV243",
    "topic": "Legislative Process",
    "question": "Which of the following is correctly associated with Committee stage?",
    "options": [
      "First reading",
      "Assent",
      "Committee stage",
      "Third reading"
    ],
    "answer": "Committee stage"
  },
  {
    "id": "GOV244",
    "topic": "Legislative Process",
    "question": "The description 'the stage at which a bill is examined in detail by a legislative committee' refers to",
    "options": [
      "Assent",
      "Third reading",
      "Committee stage",
      "First reading"
    ],
    "answer": "Committee stage"
  },
  {
    "id": "GOV245",
    "topic": "Legislative Process",
    "question": "Which term best describes the minimum number of members required for valid legislative business?",
    "options": [
      "Cabinet",
      "Majority",
      "Quorum",
      "Constituency"
    ],
    "answer": "Quorum"
  },
  {
    "id": "GOV246",
    "topic": "Legislative Process",
    "question": "In Government, Quorum refers to",
    "options": [
      "Cabinet",
      "Quorum",
      "Majority",
      "Constituency"
    ],
    "answer": "Quorum"
  },
  {
    "id": "GOV247",
    "topic": "Legislative Process",
    "question": "Which of the following is correctly associated with Quorum?",
    "options": [
      "Majority",
      "Constituency",
      "Quorum",
      "Cabinet"
    ],
    "answer": "Quorum"
  },
  {
    "id": "GOV248",
    "topic": "Legislative Process",
    "question": "The description 'the minimum number of members required for valid legislative business' refers to",
    "options": [
      "Quorum",
      "Cabinet",
      "Majority",
      "Constituency"
    ],
    "answer": "Quorum"
  },
  {
    "id": "GOV249",
    "topic": "Public Administration and Civil Service",
    "question": "Which term best describes a permanent body of professional public officials?",
    "options": [
      "Judiciary",
      "Legislature",
      "Political party",
      "Civil service"
    ],
    "answer": "Civil service"
  },
  {
    "id": "GOV250",
    "topic": "Public Administration and Civil Service",
    "question": "In Government, Civil service refers to",
    "options": [
      "Legislature",
      "Political party",
      "Judiciary",
      "Civil service"
    ],
    "answer": "Civil service"
  },
  {
    "id": "GOV251",
    "topic": "Public Administration and Civil Service",
    "question": "Which of the following is correctly associated with Civil service?",
    "options": [
      "Political party",
      "Legislature",
      "Judiciary",
      "Civil service"
    ],
    "answer": "Civil service"
  },
  {
    "id": "GOV252",
    "topic": "Public Administration and Civil Service",
    "question": "The description 'a permanent body of professional public officials' refers to",
    "options": [
      "Legislature",
      "Civil service",
      "Judiciary",
      "Political party"
    ],
    "answer": "Civil service"
  },
  {
    "id": "GOV253",
    "topic": "Public Administration and Civil Service",
    "question": "Which term best describes the principle that civil servants serve governments impartially within the law?",
    "options": [
      "Federal character",
      "Political neutrality",
      "Party supremacy",
      "Judicial activism"
    ],
    "answer": "Political neutrality"
  },
  {
    "id": "GOV254",
    "topic": "Public Administration and Civil Service",
    "question": "In Government, Political neutrality refers to",
    "options": [
      "Party supremacy",
      "Federal character",
      "Judicial activism",
      "Political neutrality"
    ],
    "answer": "Political neutrality"
  },
  {
    "id": "GOV255",
    "topic": "Public Administration and Civil Service",
    "question": "Which of the following is correctly associated with Political neutrality?",
    "options": [
      "Party supremacy",
      "Judicial activism",
      "Federal character",
      "Political neutrality"
    ],
    "answer": "Political neutrality"
  },
  {
    "id": "GOV256",
    "topic": "Public Administration and Civil Service",
    "question": "The description 'the principle that civil servants serve governments impartially within the law' refers to",
    "options": [
      "Federal character",
      "Party supremacy",
      "Political neutrality",
      "Judicial activism"
    ],
    "answer": "Political neutrality"
  },
  {
    "id": "GOV257",
    "topic": "Public Administration and Civil Service",
    "question": "Which term best describes the principle that career officials continue in service despite changes of government, subject to law?",
    "options": [
      "Accountability",
      "Anonymity",
      "Collective responsibility",
      "Permanence"
    ],
    "answer": "Permanence"
  },
  {
    "id": "GOV258",
    "topic": "Public Administration and Civil Service",
    "question": "In Government, Permanence refers to",
    "options": [
      "Collective responsibility",
      "Permanence",
      "Anonymity",
      "Accountability"
    ],
    "answer": "Permanence"
  },
  {
    "id": "GOV259",
    "topic": "Public Administration and Civil Service",
    "question": "Which of the following is correctly associated with Permanence?",
    "options": [
      "Anonymity",
      "Collective responsibility",
      "Permanence",
      "Accountability"
    ],
    "answer": "Permanence"
  },
  {
    "id": "GOV260",
    "topic": "Public Administration and Civil Service",
    "question": "The description 'the principle that career officials continue in service despite changes of government, subject to law' refers to",
    "options": [
      "Collective responsibility",
      "Permanence",
      "Accountability",
      "Anonymity"
    ],
    "answer": "Permanence"
  },
  {
    "id": "GOV261",
    "topic": "Public Administration and Civil Service",
    "question": "Which term best describes excessive adherence to procedures that can cause delay?",
    "options": [
      "Decentralization",
      "Delegation",
      "Red tape",
      "Privatization"
    ],
    "answer": "Red tape"
  },
  {
    "id": "GOV262",
    "topic": "Public Administration and Civil Service",
    "question": "In Government, Red tape refers to",
    "options": [
      "Decentralization",
      "Red tape",
      "Delegation",
      "Privatization"
    ],
    "answer": "Red tape"
  },
  {
    "id": "GOV263",
    "topic": "Public Administration and Civil Service",
    "question": "Which of the following is correctly associated with Red tape?",
    "options": [
      "Delegation",
      "Privatization",
      "Red tape",
      "Decentralization"
    ],
    "answer": "Red tape"
  },
  {
    "id": "GOV264",
    "topic": "Public Administration and Civil Service",
    "question": "The description 'excessive adherence to procedures that can cause delay' refers to",
    "options": [
      "Red tape",
      "Decentralization",
      "Privatization",
      "Delegation"
    ],
    "answer": "Red tape"
  },
  {
    "id": "GOV265",
    "topic": "Local Government Administration",
    "question": "Which term best describes the level of government closest to local communities?",
    "options": [
      "Local government",
      "Federal government",
      "International organization",
      "Judiciary"
    ],
    "answer": "Local government"
  },
  {
    "id": "GOV266",
    "topic": "Local Government Administration",
    "question": "In Government, Local government refers to",
    "options": [
      "International organization",
      "Federal government",
      "Local government",
      "Judiciary"
    ],
    "answer": "Local government"
  },
  {
    "id": "GOV267",
    "topic": "Local Government Administration",
    "question": "Which of the following is correctly associated with Local government?",
    "options": [
      "Judiciary",
      "Local government",
      "Federal government",
      "International organization"
    ],
    "answer": "Local government"
  },
  {
    "id": "GOV268",
    "topic": "Local Government Administration",
    "question": "The description 'the level of government closest to local communities' refers to",
    "options": [
      "Judiciary",
      "Local government",
      "Federal government",
      "International organization"
    ],
    "answer": "Local government"
  },
  {
    "id": "GOV269",
    "topic": "Local Government Administration",
    "question": "Which term best describes the ability of local authorities to manage legally assigned functions with some independence?",
    "options": [
      "Party discipline",
      "Judicial review",
      "Federal supremacy",
      "Local government autonomy"
    ],
    "answer": "Local government autonomy"
  },
  {
    "id": "GOV270",
    "topic": "Local Government Administration",
    "question": "In Government, Local government autonomy refers to",
    "options": [
      "Federal supremacy",
      "Judicial review",
      "Party discipline",
      "Local government autonomy"
    ],
    "answer": "Local government autonomy"
  },
  {
    "id": "GOV271",
    "topic": "Local Government Administration",
    "question": "Which of the following is correctly associated with Local government autonomy?",
    "options": [
      "Judicial review",
      "Local government autonomy",
      "Federal supremacy",
      "Party discipline"
    ],
    "answer": "Local government autonomy"
  },
  {
    "id": "GOV272",
    "topic": "Local Government Administration",
    "question": "The description 'the ability of local authorities to manage legally assigned functions with some independence' refers to",
    "options": [
      "Federal supremacy",
      "Party discipline",
      "Local government autonomy",
      "Judicial review"
    ],
    "answer": "Local government autonomy"
  },
  {
    "id": "GOV273",
    "topic": "Local Government Administration",
    "question": "Which term best describes revenue raised by a local authority from sources within its jurisdiction?",
    "options": [
      "Federal grant",
      "Foreign aid",
      "Internally generated revenue",
      "External borrowing"
    ],
    "answer": "Internally generated revenue"
  },
  {
    "id": "GOV274",
    "topic": "Local Government Administration",
    "question": "In Government, Internally generated revenue refers to",
    "options": [
      "Internally generated revenue",
      "Foreign aid",
      "Federal grant",
      "External borrowing"
    ],
    "answer": "Internally generated revenue"
  },
  {
    "id": "GOV275",
    "topic": "Local Government Administration",
    "question": "Which of the following is correctly associated with Internally generated revenue?",
    "options": [
      "External borrowing",
      "Federal grant",
      "Internally generated revenue",
      "Foreign aid"
    ],
    "answer": "Internally generated revenue"
  },
  {
    "id": "GOV276",
    "topic": "Local Government Administration",
    "question": "The description 'revenue raised by a local authority from sources within its jurisdiction' refers to",
    "options": [
      "Federal grant",
      "Internally generated revenue",
      "External borrowing",
      "Foreign aid"
    ],
    "answer": "Internally generated revenue"
  },
  {
    "id": "GOV277",
    "topic": "Public Corporations and Commissions",
    "question": "Which term best describes a legally established public enterprise created to perform specified functions?",
    "options": [
      "Public corporation",
      "Political party",
      "Private club",
      "Pressure group"
    ],
    "answer": "Public corporation"
  },
  {
    "id": "GOV278",
    "topic": "Public Corporations and Commissions",
    "question": "In Government, Public corporation refers to",
    "options": [
      "Public corporation",
      "Private club",
      "Political party",
      "Pressure group"
    ],
    "answer": "Public corporation"
  },
  {
    "id": "GOV279",
    "topic": "Public Corporations and Commissions",
    "question": "Which of the following is correctly associated with Public corporation?",
    "options": [
      "Political party",
      "Public corporation",
      "Private club",
      "Pressure group"
    ],
    "answer": "Public corporation"
  },
  {
    "id": "GOV280",
    "topic": "Public Corporations and Commissions",
    "question": "The description 'a legally established public enterprise created to perform specified functions' refers to",
    "options": [
      "Public corporation",
      "Pressure group",
      "Private club",
      "Political party"
    ],
    "answer": "Public corporation"
  },
  {
    "id": "GOV281",
    "topic": "Public Corporations and Commissions",
    "question": "Which term best describes transfer of ownership or control of a public enterprise to private ownership?",
    "options": [
      "Privatization",
      "Nationalization",
      "Commercialization",
      "Decentralization"
    ],
    "answer": "Privatization"
  },
  {
    "id": "GOV282",
    "topic": "Public Corporations and Commissions",
    "question": "In Government, Privatization refers to",
    "options": [
      "Privatization",
      "Commercialization",
      "Nationalization",
      "Decentralization"
    ],
    "answer": "Privatization"
  },
  {
    "id": "GOV283",
    "topic": "Public Corporations and Commissions",
    "question": "Which of the following is correctly associated with Privatization?",
    "options": [
      "Commercialization",
      "Nationalization",
      "Decentralization",
      "Privatization"
    ],
    "answer": "Privatization"
  },
  {
    "id": "GOV284",
    "topic": "Public Corporations and Commissions",
    "question": "The description 'transfer of ownership or control of a public enterprise to private ownership' refers to",
    "options": [
      "Commercialization",
      "Decentralization",
      "Nationalization",
      "Privatization"
    ],
    "answer": "Privatization"
  },
  {
    "id": "GOV285",
    "topic": "Public Corporations and Commissions",
    "question": "Which term best describes operation of a public enterprise on commercial principles without necessarily transferring ownership?",
    "options": [
      "Nationalization",
      "Privatization",
      "Commercialization",
      "Federalism"
    ],
    "answer": "Commercialization"
  },
  {
    "id": "GOV286",
    "topic": "Public Corporations and Commissions",
    "question": "In Government, Commercialization refers to",
    "options": [
      "Federalism",
      "Commercialization",
      "Nationalization",
      "Privatization"
    ],
    "answer": "Commercialization"
  },
  {
    "id": "GOV287",
    "topic": "Public Corporations and Commissions",
    "question": "Which of the following is correctly associated with Commercialization?",
    "options": [
      "Federalism",
      "Privatization",
      "Nationalization",
      "Commercialization"
    ],
    "answer": "Commercialization"
  },
  {
    "id": "GOV288",
    "topic": "Public Corporations and Commissions",
    "question": "The description 'operation of a public enterprise on commercial principles without necessarily transferring ownership' refers to",
    "options": [
      "Privatization",
      "Federalism",
      "Commercialization",
      "Nationalization"
    ],
    "answer": "Commercialization"
  },
  {
    "id": "GOV289",
    "topic": "Pre-Colonial Political Systems",
    "question": "Which term best describes a relatively centralized traditional political system organized around emirates?",
    "options": [
      "Oyo system",
      "Hausa-Fulani emirate system",
      "Igbo village system",
      "Modern presidential system"
    ],
    "answer": "Hausa-Fulani emirate system"
  },
  {
    "id": "GOV290",
    "topic": "Pre-Colonial Political Systems",
    "question": "In Government, Hausa-Fulani emirate system refers to",
    "options": [
      "Igbo village system",
      "Modern presidential system",
      "Oyo system",
      "Hausa-Fulani emirate system"
    ],
    "answer": "Hausa-Fulani emirate system"
  },
  {
    "id": "GOV291",
    "topic": "Pre-Colonial Political Systems",
    "question": "Which of the following is correctly associated with Hausa-Fulani emirate system?",
    "options": [
      "Igbo village system",
      "Oyo system",
      "Modern presidential system",
      "Hausa-Fulani emirate system"
    ],
    "answer": "Hausa-Fulani emirate system"
  },
  {
    "id": "GOV292",
    "topic": "Pre-Colonial Political Systems",
    "question": "The description 'a relatively centralized traditional political system organized around emirates' refers to",
    "options": [
      "Igbo village system",
      "Oyo system",
      "Hausa-Fulani emirate system",
      "Modern presidential system"
    ],
    "answer": "Hausa-Fulani emirate system"
  },
  {
    "id": "GOV293",
    "topic": "Pre-Colonial Political Systems",
    "question": "Which term best describes a Yoruba political system headed by the Alaafin?",
    "options": [
      "Oyo Empire",
      "Edo kingdom",
      "Hausa-Fulani emirate",
      "Igbo village assembly"
    ],
    "answer": "Oyo Empire"
  },
  {
    "id": "GOV294",
    "topic": "Pre-Colonial Political Systems",
    "question": "In Government, Oyo Empire refers to",
    "options": [
      "Hausa-Fulani emirate",
      "Edo kingdom",
      "Oyo Empire",
      "Igbo village assembly"
    ],
    "answer": "Oyo Empire"
  },
  {
    "id": "GOV295",
    "topic": "Pre-Colonial Political Systems",
    "question": "Which of the following is correctly associated with Oyo Empire?",
    "options": [
      "Hausa-Fulani emirate",
      "Igbo village assembly",
      "Edo kingdom",
      "Oyo Empire"
    ],
    "answer": "Oyo Empire"
  },
  {
    "id": "GOV296",
    "topic": "Pre-Colonial Political Systems",
    "question": "The description 'a Yoruba political system headed by the Alaafin' refers to",
    "options": [
      "Edo kingdom",
      "Igbo village assembly",
      "Hausa-Fulani emirate",
      "Oyo Empire"
    ],
    "answer": "Oyo Empire"
  },
  {
    "id": "GOV297",
    "topic": "Pre-Colonial Political Systems",
    "question": "Which term best describes a largely decentralized village-based system using assemblies, age grades and other institutions?",
    "options": [
      "Presidential system",
      "Igbo traditional political system",
      "Emirate system",
      "Oyo imperial system"
    ],
    "answer": "Igbo traditional political system"
  },
  {
    "id": "GOV298",
    "topic": "Pre-Colonial Political Systems",
    "question": "In Government, Igbo traditional political system refers to",
    "options": [
      "Emirate system",
      "Presidential system",
      "Igbo traditional political system",
      "Oyo imperial system"
    ],
    "answer": "Igbo traditional political system"
  },
  {
    "id": "GOV299",
    "topic": "Pre-Colonial Political Systems",
    "question": "Which of the following is correctly associated with Igbo traditional political system?",
    "options": [
      "Igbo traditional political system",
      "Presidential system",
      "Emirate system",
      "Oyo imperial system"
    ],
    "answer": "Igbo traditional political system"
  },
  {
    "id": "GOV300",
    "topic": "Pre-Colonial Political Systems",
    "question": "The description 'a largely decentralized village-based system using assemblies, age grades and other institutions' refers to",
    "options": [
      "Oyo imperial system",
      "Emirate system",
      "Igbo traditional political system",
      "Presidential system"
    ],
    "answer": "Igbo traditional political system"
  },
  {
    "id": "GOV301",
    "topic": "Colonial Administration in Nigeria",
    "question": "Which term best describes colonial administration through existing traditional institutions where practicable?",
    "options": [
      "Direct democracy",
      "Federalism",
      "Republicanism",
      "Indirect rule"
    ],
    "answer": "Indirect rule"
  },
  {
    "id": "GOV302",
    "topic": "Colonial Administration in Nigeria",
    "question": "In Government, Indirect rule refers to",
    "options": [
      "Federalism",
      "Direct democracy",
      "Indirect rule",
      "Republicanism"
    ],
    "answer": "Indirect rule"
  },
  {
    "id": "GOV303",
    "topic": "Colonial Administration in Nigeria",
    "question": "Which of the following is correctly associated with Indirect rule?",
    "options": [
      "Indirect rule",
      "Federalism",
      "Direct democracy",
      "Republicanism"
    ],
    "answer": "Indirect rule"
  },
  {
    "id": "GOV304",
    "topic": "Colonial Administration in Nigeria",
    "question": "The description 'colonial administration through existing traditional institutions where practicable' refers to",
    "options": [
      "Republicanism",
      "Direct democracy",
      "Indirect rule",
      "Federalism"
    ],
    "answer": "Indirect rule"
  },
  {
    "id": "GOV305",
    "topic": "Colonial Administration in Nigeria",
    "question": "Which term best describes the administrative union of the Northern and Southern Protectorates of Nigeria?",
    "options": [
      "Republicanism",
      "Independence",
      "Amalgamation of 1914",
      "Regionalization"
    ],
    "answer": "Amalgamation of 1914"
  },
  {
    "id": "GOV306",
    "topic": "Colonial Administration in Nigeria",
    "question": "In Government, Amalgamation of 1914 refers to",
    "options": [
      "Independence",
      "Amalgamation of 1914",
      "Republicanism",
      "Regionalization"
    ],
    "answer": "Amalgamation of 1914"
  },
  {
    "id": "GOV307",
    "topic": "Colonial Administration in Nigeria",
    "question": "Which of the following is correctly associated with Amalgamation of 1914?",
    "options": [
      "Amalgamation of 1914",
      "Regionalization",
      "Independence",
      "Republicanism"
    ],
    "answer": "Amalgamation of 1914"
  },
  {
    "id": "GOV308",
    "topic": "Colonial Administration in Nigeria",
    "question": "The description 'the administrative union of the Northern and Southern Protectorates of Nigeria' refers to",
    "options": [
      "Amalgamation of 1914",
      "Republicanism",
      "Regionalization",
      "Independence"
    ],
    "answer": "Amalgamation of 1914"
  },
  {
    "id": "GOV309",
    "topic": "Colonial Administration in Nigeria",
    "question": "Which term best describes a colonial arrangement that recognized or created local authorities called warrant chiefs in areas where traditional structures were less centralized?",
    "options": [
      "Federal character",
      "Parliamentary system",
      "Warrant chief system",
      "Native authority"
    ],
    "answer": "Warrant chief system"
  },
  {
    "id": "GOV310",
    "topic": "Colonial Administration in Nigeria",
    "question": "In Government, Warrant chief system refers to",
    "options": [
      "Warrant chief system",
      "Parliamentary system",
      "Federal character",
      "Native authority"
    ],
    "answer": "Warrant chief system"
  },
  {
    "id": "GOV311",
    "topic": "Colonial Administration in Nigeria",
    "question": "Which of the following is correctly associated with Warrant chief system?",
    "options": [
      "Parliamentary system",
      "Native authority",
      "Federal character",
      "Warrant chief system"
    ],
    "answer": "Warrant chief system"
  },
  {
    "id": "GOV312",
    "topic": "Colonial Administration in Nigeria",
    "question": "The description 'a colonial arrangement that recognized or created local authorities called warrant chiefs in areas where traditional structures were less centralized' refers to",
    "options": [
      "Warrant chief system",
      "Parliamentary system",
      "Native authority",
      "Federal character"
    ],
    "answer": "Warrant chief system"
  },
  {
    "id": "GOV313",
    "topic": "Nationalism and Decolonization",
    "question": "Which term best describes the movement for political self-government and independence from colonial rule?",
    "options": [
      "Autocracy",
      "Nationalism",
      "Imperialism",
      "Federalism"
    ],
    "answer": "Nationalism"
  },
  {
    "id": "GOV314",
    "topic": "Nationalism and Decolonization",
    "question": "In Government, Nationalism refers to",
    "options": [
      "Federalism",
      "Nationalism",
      "Imperialism",
      "Autocracy"
    ],
    "answer": "Nationalism"
  },
  {
    "id": "GOV315",
    "topic": "Nationalism and Decolonization",
    "question": "Which of the following is correctly associated with Nationalism?",
    "options": [
      "Imperialism",
      "Federalism",
      "Nationalism",
      "Autocracy"
    ],
    "answer": "Nationalism"
  },
  {
    "id": "GOV316",
    "topic": "Nationalism and Decolonization",
    "question": "The description 'the movement for political self-government and independence from colonial rule' refers to",
    "options": [
      "Federalism",
      "Autocracy",
      "Nationalism",
      "Imperialism"
    ],
    "answer": "Nationalism"
  },
  {
    "id": "GOV317",
    "topic": "Nationalism and Decolonization",
    "question": "Which term best describes a nationalist organization founded in 1934?",
    "options": [
      "Action Group",
      "NCNC",
      "Nigerian Youth Movement",
      "NPC"
    ],
    "answer": "Nigerian Youth Movement"
  },
  {
    "id": "GOV318",
    "topic": "Nationalism and Decolonization",
    "question": "In Government, Nigerian Youth Movement refers to",
    "options": [
      "NPC",
      "NCNC",
      "Action Group",
      "Nigerian Youth Movement"
    ],
    "answer": "Nigerian Youth Movement"
  },
  {
    "id": "GOV319",
    "topic": "Nationalism and Decolonization",
    "question": "Which of the following is correctly associated with Nigerian Youth Movement?",
    "options": [
      "Nigerian Youth Movement",
      "Action Group",
      "NCNC",
      "NPC"
    ],
    "answer": "Nigerian Youth Movement"
  },
  {
    "id": "GOV320",
    "topic": "Nationalism and Decolonization",
    "question": "The description 'a nationalist organization founded in 1934' refers to",
    "options": [
      "NPC",
      "Nigerian Youth Movement",
      "Action Group",
      "NCNC"
    ],
    "answer": "Nigerian Youth Movement"
  },
  {
    "id": "GOV321",
    "topic": "Nationalism and Decolonization",
    "question": "Which term best describes a nationalist political organization associated with Herbert Macaulay and Nnamdi Azikiwe?",
    "options": [
      "NPC",
      "NCNC",
      "NYM",
      "Action Group"
    ],
    "answer": "NCNC"
  },
  {
    "id": "GOV322",
    "topic": "Nationalism and Decolonization",
    "question": "In Government, NCNC refers to",
    "options": [
      "NPC",
      "Action Group",
      "NYM",
      "NCNC"
    ],
    "answer": "NCNC"
  },
  {
    "id": "GOV323",
    "topic": "Nationalism and Decolonization",
    "question": "Which of the following is correctly associated with NCNC?",
    "options": [
      "NYM",
      "Action Group",
      "NPC",
      "NCNC"
    ],
    "answer": "NCNC"
  },
  {
    "id": "GOV324",
    "topic": "Nationalism and Decolonization",
    "question": "The description 'a nationalist political organization associated with Herbert Macaulay and Nnamdi Azikiwe' refers to",
    "options": [
      "NPC",
      "NYM",
      "NCNC",
      "Action Group"
    ],
    "answer": "NCNC"
  },
  {
    "id": "GOV325",
    "topic": "Constitutional Development 1922â1951",
    "question": "Which term best describes the 1922 constitution that introduced a limited elective principle in Nigeria?",
    "options": [
      "Clifford Constitution",
      "Richards Constitution",
      "Lyttleton Constitution",
      "Macpherson Constitution"
    ],
    "answer": "Clifford Constitution"
  },
  {
    "id": "GOV326",
    "topic": "Constitutional Development 1922â1951",
    "question": "In Government, Clifford Constitution refers to",
    "options": [
      "Clifford Constitution",
      "Macpherson Constitution",
      "Lyttleton Constitution",
      "Richards Constitution"
    ],
    "answer": "Clifford Constitution"
  },
  {
    "id": "GOV327",
    "topic": "Constitutional Development 1922â1951",
    "question": "Which of the following is correctly associated with Clifford Constitution?",
    "options": [
      "Richards Constitution",
      "Macpherson Constitution",
      "Clifford Constitution",
      "Lyttleton Constitution"
    ],
    "answer": "Clifford Constitution"
  },
  {
    "id": "GOV328",
    "topic": "Constitutional Development 1922â1951",
    "question": "The description 'the 1922 constitution that introduced a limited elective principle in Nigeria' refers to",
    "options": [
      "Clifford Constitution",
      "Macpherson Constitution",
      "Lyttleton Constitution",
      "Richards Constitution"
    ],
    "answer": "Clifford Constitution"
  },
  {
    "id": "GOV329",
    "topic": "Constitutional Development 1922â1951",
    "question": "Which term best describes the 1946 constitution that strengthened regional representation?",
    "options": [
      "Clifford Constitution",
      "Macpherson Constitution",
      "Lyttleton Constitution",
      "Richards Constitution"
    ],
    "answer": "Richards Constitution"
  },
  {
    "id": "GOV330",
    "topic": "Constitutional Development 1922â1951",
    "question": "In Government, Richards Constitution refers to",
    "options": [
      "Lyttleton Constitution",
      "Clifford Constitution",
      "Macpherson Constitution",
      "Richards Constitution"
    ],
    "answer": "Richards Constitution"
  },
  {
    "id": "GOV331",
    "topic": "Constitutional Development 1922â1951",
    "question": "Which of the following is correctly associated with Richards Constitution?",
    "options": [
      "Macpherson Constitution",
      "Richards Constitution",
      "Lyttleton Constitution",
      "Clifford Constitution"
    ],
    "answer": "Richards Constitution"
  },
  {
    "id": "GOV332",
    "topic": "Constitutional Development 1922â1951",
    "question": "The description 'the 1946 constitution that strengthened regional representation' refers to",
    "options": [
      "Richards Constitution",
      "Macpherson Constitution",
      "Lyttleton Constitution",
      "Clifford Constitution"
    ],
    "answer": "Richards Constitution"
  },
  {
    "id": "GOV333",
    "topic": "Constitutional Development 1922â1951",
    "question": "Which term best describes the 1951 constitution prepared after extensive consultations?",
    "options": [
      "1960 Constitution",
      "Macpherson Constitution",
      "Clifford Constitution",
      "Richards Constitution"
    ],
    "answer": "Macpherson Constitution"
  },
  {
    "id": "GOV334",
    "topic": "Constitutional Development 1922â1951",
    "question": "In Government, Macpherson Constitution refers to",
    "options": [
      "1960 Constitution",
      "Macpherson Constitution",
      "Richards Constitution",
      "Clifford Constitution"
    ],
    "answer": "Macpherson Constitution"
  },
  {
    "id": "GOV335",
    "topic": "Constitutional Development 1922â1951",
    "question": "Which of the following is correctly associated with Macpherson Constitution?",
    "options": [
      "1960 Constitution",
      "Richards Constitution",
      "Clifford Constitution",
      "Macpherson Constitution"
    ],
    "answer": "Macpherson Constitution"
  },
  {
    "id": "GOV336",
    "topic": "Constitutional Development 1922â1951",
    "question": "The description 'the 1951 constitution prepared after extensive consultations' refers to",
    "options": [
      "Macpherson Constitution",
      "Clifford Constitution",
      "1960 Constitution",
      "Richards Constitution"
    ],
    "answer": "Macpherson Constitution"
  },
  {
    "id": "GOV337",
    "topic": "Constitutional Development 1954â1963",
    "question": "Which term best describes the 1954 constitution associated with a clearer federal arrangement?",
    "options": [
      "1960 Constitution",
      "1979 Constitution",
      "Macpherson Constitution",
      "Lyttleton Constitution"
    ],
    "answer": "Lyttleton Constitution"
  },
  {
    "id": "GOV338",
    "topic": "Constitutional Development 1954â1963",
    "question": "In Government, Lyttleton Constitution refers to",
    "options": [
      "1960 Constitution",
      "Lyttleton Constitution",
      "1979 Constitution",
      "Macpherson Constitution"
    ],
    "answer": "Lyttleton Constitution"
  },
  {
    "id": "GOV339",
    "topic": "Constitutional Development 1954â1963",
    "question": "Which of the following is correctly associated with Lyttleton Constitution?",
    "options": [
      "Macpherson Constitution",
      "Lyttleton Constitution",
      "1960 Constitution",
      "1979 Constitution"
    ],
    "answer": "Lyttleton Constitution"
  },
  {
    "id": "GOV340",
    "topic": "Constitutional Development 1954â1963",
    "question": "The description 'the 1954 constitution associated with a clearer federal arrangement' refers to",
    "options": [
      "Lyttleton Constitution",
      "Macpherson Constitution",
      "1979 Constitution",
      "1960 Constitution"
    ],
    "answer": "Lyttleton Constitution"
  },
  {
    "id": "GOV341",
    "topic": "Constitutional Development 1954â1963",
    "question": "Which term best describes the constitution under which Nigeria became independent?",
    "options": [
      "1979 Constitution",
      "1963 Republican Constitution",
      "1999 Constitution",
      "1960 Independence Constitution"
    ],
    "answer": "1960 Independence Constitution"
  },
  {
    "id": "GOV342",
    "topic": "Constitutional Development 1954â1963",
    "question": "In Government, 1960 Independence Constitution refers to",
    "options": [
      "1979 Constitution",
      "1963 Republican Constitution",
      "1999 Constitution",
      "1960 Independence Constitution"
    ],
    "answer": "1960 Independence Constitution"
  },
  {
    "id": "GOV343",
    "topic": "Constitutional Development 1954â1963",
    "question": "Which of the following is correctly associated with 1960 Independence Constitution?",
    "options": [
      "1960 Independence Constitution",
      "1999 Constitution",
      "1979 Constitution",
      "1963 Republican Constitution"
    ],
    "answer": "1960 Independence Constitution"
  },
  {
    "id": "GOV344",
    "topic": "Constitutional Development 1954â1963",
    "question": "The description 'the constitution under which Nigeria became independent' refers to",
    "options": [
      "1999 Constitution",
      "1960 Independence Constitution",
      "1979 Constitution",
      "1963 Republican Constitution"
    ],
    "answer": "1960 Independence Constitution"
  },
  {
    "id": "GOV345",
    "topic": "Constitutional Development 1954â1963",
    "question": "Which term best describes the constitution that made Nigeria a republic with a Nigerian president as head of state?",
    "options": [
      "1954 Constitution",
      "1963 Republican Constitution",
      "1960 Constitution",
      "1979 Constitution"
    ],
    "answer": "1963 Republican Constitution"
  },
  {
    "id": "GOV346",
    "topic": "Constitutional Development 1954â1963",
    "question": "In Government, 1963 Republican Constitution refers to",
    "options": [
      "1979 Constitution",
      "1963 Republican Constitution",
      "1954 Constitution",
      "1960 Constitution"
    ],
    "answer": "1963 Republican Constitution"
  },
  {
    "id": "GOV347",
    "topic": "Constitutional Development 1954â1963",
    "question": "Which of the following is correctly associated with 1963 Republican Constitution?",
    "options": [
      "1963 Republican Constitution",
      "1954 Constitution",
      "1979 Constitution",
      "1960 Constitution"
    ],
    "answer": "1963 Republican Constitution"
  },
  {
    "id": "GOV348",
    "topic": "Constitutional Development 1954â1963",
    "question": "The description 'the constitution that made Nigeria a republic with a Nigerian president as head of state' refers to",
    "options": [
      "1960 Constitution",
      "1963 Republican Constitution",
      "1979 Constitution",
      "1954 Constitution"
    ],
    "answer": "1963 Republican Constitution"
  },
  {
    "id": "GOV349",
    "topic": "1979 Second Republic Constitution",
    "question": "Which term best describes the constitution that introduced the presidential system in the Second Republic?",
    "options": [
      "1963 Constitution",
      "1989 Constitution",
      "1979 Constitution",
      "1999 Constitution"
    ],
    "answer": "1979 Constitution"
  },
  {
    "id": "GOV350",
    "topic": "1979 Second Republic Constitution",
    "question": "In Government, 1979 Constitution refers to",
    "options": [
      "1999 Constitution",
      "1979 Constitution",
      "1989 Constitution",
      "1963 Constitution"
    ],
    "answer": "1979 Constitution"
  },
  {
    "id": "GOV351",
    "topic": "1979 Second Republic Constitution",
    "question": "Which of the following is correctly associated with 1979 Constitution?",
    "options": [
      "1989 Constitution",
      "1999 Constitution",
      "1963 Constitution",
      "1979 Constitution"
    ],
    "answer": "1979 Constitution"
  },
  {
    "id": "GOV352",
    "topic": "1979 Second Republic Constitution",
    "question": "The description 'the constitution that introduced the presidential system in the Second Republic' refers to",
    "options": [
      "1999 Constitution",
      "1963 Constitution",
      "1989 Constitution",
      "1979 Constitution"
    ],
    "answer": "1979 Constitution"
  },
  {
    "id": "GOV353",
    "topic": "1979 Second Republic Constitution",
    "question": "Which term best describes Nigeria's civilian republic that began in 1979 and ended after the 1983 military coup?",
    "options": [
      "First Republic",
      "Fourth Republic",
      "Third Republic",
      "Second Republic"
    ],
    "answer": "Second Republic"
  },
  {
    "id": "GOV354",
    "topic": "1979 Second Republic Constitution",
    "question": "In Government, Second Republic refers to",
    "options": [
      "Third Republic",
      "Second Republic",
      "First Republic",
      "Fourth Republic"
    ],
    "answer": "Second Republic"
  },
  {
    "id": "GOV355",
    "topic": "1979 Second Republic Constitution",
    "question": "Which of the following is correctly associated with Second Republic?",
    "options": [
      "First Republic",
      "Third Republic",
      "Second Republic",
      "Fourth Republic"
    ],
    "answer": "Second Republic"
  },
  {
    "id": "GOV356",
    "topic": "1979 Second Republic Constitution",
    "question": "The description 'Nigeria's civilian republic that began in 1979 and ended after the 1983 military coup' refers to",
    "options": [
      "First Republic",
      "Second Republic",
      "Fourth Republic",
      "Third Republic"
    ],
    "answer": "Second Republic"
  },
  {
    "id": "GOV357",
    "topic": "1979 Second Republic Constitution",
    "question": "Which term best describes a system with a separately elected executive president and a bicameral National Assembly?",
    "options": [
      "Parliamentary system",
      "Presidential system under 1979",
      "Confederal system",
      "Monarchical system"
    ],
    "answer": "Presidential system under 1979"
  },
  {
    "id": "GOV358",
    "topic": "1979 Second Republic Constitution",
    "question": "In Government, Presidential system under 1979 refers to",
    "options": [
      "Presidential system under 1979",
      "Confederal system",
      "Monarchical system",
      "Parliamentary system"
    ],
    "answer": "Presidential system under 1979"
  },
  {
    "id": "GOV359",
    "topic": "1979 Second Republic Constitution",
    "question": "Which of the following is correctly associated with Presidential system under 1979?",
    "options": [
      "Monarchical system",
      "Confederal system",
      "Presidential system under 1979",
      "Parliamentary system"
    ],
    "answer": "Presidential system under 1979"
  },
  {
    "id": "GOV360",
    "topic": "1979 Second Republic Constitution",
    "question": "The description 'a system with a separately elected executive president and a bicameral National Assembly' refers to",
    "options": [
      "Presidential system under 1979",
      "Parliamentary system",
      "Confederal system",
      "Monarchical system"
    ],
    "answer": "Presidential system under 1979"
  },
  {
    "id": "GOV361",
    "topic": "1989 and 1999 Constitutions",
    "question": "Which term best describes a constitution associated with the transition programme toward a proposed Third Republic?",
    "options": [
      "1979 Constitution",
      "1989 Constitution",
      "1963 Constitution",
      "1999 Constitution"
    ],
    "answer": "1989 Constitution"
  },
  {
    "id": "GOV362",
    "topic": "1989 and 1999 Constitutions",
    "question": "In Government, 1989 Constitution refers to",
    "options": [
      "1999 Constitution",
      "1989 Constitution",
      "1963 Constitution",
      "1979 Constitution"
    ],
    "answer": "1989 Constitution"
  },
  {
    "id": "GOV363",
    "topic": "1989 and 1999 Constitutions",
    "question": "Which of the following is correctly associated with 1989 Constitution?",
    "options": [
      "1963 Constitution",
      "1989 Constitution",
      "1979 Constitution",
      "1999 Constitution"
    ],
    "answer": "1989 Constitution"
  },
  {
    "id": "GOV364",
    "topic": "1989 and 1999 Constitutions",
    "question": "The description 'a constitution associated with the transition programme toward a proposed Third Republic' refers to",
    "options": [
      "1999 Constitution",
      "1979 Constitution",
      "1963 Constitution",
      "1989 Constitution"
    ],
    "answer": "1989 Constitution"
  },
  {
    "id": "GOV365",
    "topic": "1989 and 1999 Constitutions",
    "question": "Which term best describes the constitution under which the Fourth Republic began?",
    "options": [
      "1999 Constitution",
      "1960 Constitution",
      "1979 Constitution",
      "1989 Constitution"
    ],
    "answer": "1999 Constitution"
  },
  {
    "id": "GOV366",
    "topic": "1989 and 1999 Constitutions",
    "question": "In Government, 1999 Constitution refers to",
    "options": [
      "1979 Constitution",
      "1989 Constitution",
      "1960 Constitution",
      "1999 Constitution"
    ],
    "answer": "1999 Constitution"
  },
  {
    "id": "GOV367",
    "topic": "1989 and 1999 Constitutions",
    "question": "Which of the following is correctly associated with 1999 Constitution?",
    "options": [
      "1999 Constitution",
      "1979 Constitution",
      "1989 Constitution",
      "1960 Constitution"
    ],
    "answer": "1999 Constitution"
  },
  {
    "id": "GOV368",
    "topic": "1989 and 1999 Constitutions",
    "question": "The description 'the constitution under which the Fourth Republic began' refers to",
    "options": [
      "1979 Constitution",
      "1960 Constitution",
      "1999 Constitution",
      "1989 Constitution"
    ],
    "answer": "1999 Constitution"
  },
  {
    "id": "GOV369",
    "topic": "1989 and 1999 Constitutions",
    "question": "Which term best describes the chapter containing fundamental rights?",
    "options": [
      "Chapter IV of the 1999 Constitution",
      "Chapter II",
      "Chapter VI",
      "Chapter VIII"
    ],
    "answer": "Chapter IV of the 1999 Constitution"
  },
  {
    "id": "GOV370",
    "topic": "1989 and 1999 Constitutions",
    "question": "In Government, Chapter IV of the 1999 Constitution refers to",
    "options": [
      "Chapter VIII",
      "Chapter VI",
      "Chapter II",
      "Chapter IV of the 1999 Constitution"
    ],
    "answer": "Chapter IV of the 1999 Constitution"
  },
  {
    "id": "GOV371",
    "topic": "1989 and 1999 Constitutions",
    "question": "Which of the following is correctly associated with Chapter IV of the 1999 Constitution?",
    "options": [
      "Chapter VIII",
      "Chapter II",
      "Chapter VI",
      "Chapter IV of the 1999 Constitution"
    ],
    "answer": "Chapter IV of the 1999 Constitution"
  },
  {
    "id": "GOV372",
    "topic": "1989 and 1999 Constitutions",
    "question": "The description 'the chapter containing fundamental rights' refers to",
    "options": [
      "Chapter VI",
      "Chapter VIII",
      "Chapter II",
      "Chapter IV of the 1999 Constitution"
    ],
    "answer": "Chapter IV of the 1999 Constitution"
  },
  {
    "id": "GOV373",
    "topic": "Nigerian Federalism",
    "question": "Which term best describes a constitutional principle aimed at fair representation of Nigeria's diverse groups in public institutions?",
    "options": [
      "Derivation principle",
      "Federal character principle",
      "Separation of powers",
      "Collective responsibility"
    ],
    "answer": "Federal character principle"
  },
  {
    "id": "GOV374",
    "topic": "Nigerian Federalism",
    "question": "In Government, Federal character principle refers to",
    "options": [
      "Derivation principle",
      "Federal character principle",
      "Separation of powers",
      "Collective responsibility"
    ],
    "answer": "Federal character principle"
  },
  {
    "id": "GOV375",
    "topic": "Nigerian Federalism",
    "question": "Which of the following is correctly associated with Federal character principle?",
    "options": [
      "Collective responsibility",
      "Separation of powers",
      "Federal character principle",
      "Derivation principle"
    ],
    "answer": "Federal character principle"
  },
  {
    "id": "GOV376",
    "topic": "Nigerian Federalism",
    "question": "The description 'a constitutional principle aimed at fair representation of Nigeria's diverse groups in public institutions' refers to",
    "options": [
      "Federal character principle",
      "Separation of powers",
      "Collective responsibility",
      "Derivation principle"
    ],
    "answer": "Federal character principle"
  },
  {
    "id": "GOV377",
    "topic": "Nigerian Federalism",
    "question": "Which term best describes financial relations and allocation of responsibilities among levels of government?",
    "options": [
      "Judicial review",
      "Party discipline",
      "Political socialization",
      "Fiscal federalism"
    ],
    "answer": "Fiscal federalism"
  },
  {
    "id": "GOV378",
    "topic": "Nigerian Federalism",
    "question": "In Government, Fiscal federalism refers to",
    "options": [
      "Judicial review",
      "Fiscal federalism",
      "Political socialization",
      "Party discipline"
    ],
    "answer": "Fiscal federalism"
  },
  {
    "id": "GOV379",
    "topic": "Nigerian Federalism",
    "question": "Which of the following is correctly associated with Fiscal federalism?",
    "options": [
      "Political socialization",
      "Fiscal federalism",
      "Party discipline",
      "Judicial review"
    ],
    "answer": "Fiscal federalism"
  },
  {
    "id": "GOV380",
    "topic": "Nigerian Federalism",
    "question": "The description 'financial relations and allocation of responsibilities among levels of government' refers to",
    "options": [
      "Fiscal federalism",
      "Judicial review",
      "Party discipline",
      "Political socialization"
    ],
    "answer": "Fiscal federalism"
  },
  {
    "id": "GOV381",
    "topic": "Nigerian Federalism",
    "question": "Which term best describes a system in which constitutional powers are shared between central and component governments?",
    "options": [
      "Monarchy",
      "Unitary government",
      "Federalism",
      "Confederation"
    ],
    "answer": "Federalism"
  },
  {
    "id": "GOV382",
    "topic": "Nigerian Federalism",
    "question": "In Government, Federalism refers to",
    "options": [
      "Confederation",
      "Unitary government",
      "Federalism",
      "Monarchy"
    ],
    "answer": "Federalism"
  },
  {
    "id": "GOV383",
    "topic": "Nigerian Federalism",
    "question": "Which of the following is correctly associated with Federalism?",
    "options": [
      "Confederation",
      "Unitary government",
      "Federalism",
      "Monarchy"
    ],
    "answer": "Federalism"
  },
  {
    "id": "GOV384",
    "topic": "Nigerian Federalism",
    "question": "The description 'a system in which constitutional powers are shared between central and component governments' refers to",
    "options": [
      "Federalism",
      "Unitary government",
      "Confederation",
      "Monarchy"
    ],
    "answer": "Federalism"
  },
  {
    "id": "GOV385",
    "topic": "Revenue Allocation",
    "question": "Which term best describes the distribution of public revenue among levels of government according to agreed criteria?",
    "options": [
      "Citizenship",
      "Revenue allocation",
      "Privatization",
      "Election"
    ],
    "answer": "Revenue allocation"
  },
  {
    "id": "GOV386",
    "topic": "Revenue Allocation",
    "question": "In Government, Revenue allocation refers to",
    "options": [
      "Election",
      "Privatization",
      "Citizenship",
      "Revenue allocation"
    ],
    "answer": "Revenue allocation"
  },
  {
    "id": "GOV387",
    "topic": "Revenue Allocation",
    "question": "Which of the following is correctly associated with Revenue allocation?",
    "options": [
      "Revenue allocation",
      "Election",
      "Privatization",
      "Citizenship"
    ],
    "answer": "Revenue allocation"
  },
  {
    "id": "GOV388",
    "topic": "Revenue Allocation",
    "question": "The description 'the distribution of public revenue among levels of government according to agreed criteria' refers to",
    "options": [
      "Revenue allocation",
      "Election",
      "Privatization",
      "Citizenship"
    ],
    "answer": "Revenue allocation"
  },
  {
    "id": "GOV389",
    "topic": "Revenue Allocation",
    "question": "Which term best describes an allocation principle linked to revenue generated from resources or activities in a particular area?",
    "options": [
      "Population principle",
      "Equality principle",
      "Need principle",
      "Derivation principle"
    ],
    "answer": "Derivation principle"
  },
  {
    "id": "GOV390",
    "topic": "Revenue Allocation",
    "question": "In Government, Derivation principle refers to",
    "options": [
      "Need principle",
      "Equality principle",
      "Population principle",
      "Derivation principle"
    ],
    "answer": "Derivation principle"
  },
  {
    "id": "GOV391",
    "topic": "Revenue Allocation",
    "question": "Which of the following is correctly associated with Derivation principle?",
    "options": [
      "Derivation principle",
      "Need principle",
      "Population principle",
      "Equality principle"
    ],
    "answer": "Derivation principle"
  },
  {
    "id": "GOV392",
    "topic": "Revenue Allocation",
    "question": "The description 'an allocation principle linked to revenue generated from resources or activities in a particular area' refers to",
    "options": [
      "Equality principle",
      "Need principle",
      "Derivation principle",
      "Population principle"
    ],
    "answer": "Derivation principle"
  },
  {
    "id": "GOV393",
    "topic": "Revenue Allocation",
    "question": "Which term best describes the statutory pool from which distributable federal revenue is shared according to law?",
    "options": [
      "Private trust",
      "Federation Account",
      "Political party fund",
      "Consolidated fund only"
    ],
    "answer": "Federation Account"
  },
  {
    "id": "GOV394",
    "topic": "Revenue Allocation",
    "question": "In Government, Federation Account refers to",
    "options": [
      "Private trust",
      "Political party fund",
      "Consolidated fund only",
      "Federation Account"
    ],
    "answer": "Federation Account"
  },
  {
    "id": "GOV395",
    "topic": "Revenue Allocation",
    "question": "Which of the following is correctly associated with Federation Account?",
    "options": [
      "Federation Account",
      "Political party fund",
      "Consolidated fund only",
      "Private trust"
    ],
    "answer": "Federation Account"
  },
  {
    "id": "GOV396",
    "topic": "Revenue Allocation",
    "question": "The description 'the statutory pool from which distributable federal revenue is shared according to law' refers to",
    "options": [
      "Political party fund",
      "Consolidated fund only",
      "Private trust",
      "Federation Account"
    ],
    "answer": "Federation Account"
  },
  {
    "id": "GOV397",
    "topic": "State Creation and Minority Issues",
    "question": "Which term best describes the 1957 commission that investigated fears of minorities in Nigeria?",
    "options": [
      "Willink Commission",
      "Richards Commission",
      "Electoral Commission",
      "Revenue Commission"
    ],
    "answer": "Willink Commission"
  },
  {
    "id": "GOV398",
    "topic": "State Creation and Minority Issues",
    "question": "In Government, Willink Commission refers to",
    "options": [
      "Revenue Commission",
      "Richards Commission",
      "Willink Commission",
      "Electoral Commission"
    ],
    "answer": "Willink Commission"
  },
  {
    "id": "GOV399",
    "topic": "State Creation and Minority Issues",
    "question": "Which of the following is correctly associated with Willink Commission?",
    "options": [
      "Willink Commission",
      "Richards Commission",
      "Electoral Commission",
      "Revenue Commission"
    ],
    "answer": "Willink Commission"
  },
  {
    "id": "GOV400",
    "topic": "State Creation and Minority Issues",
    "question": "The description 'the 1957 commission that investigated fears of minorities in Nigeria' refers to",
    "options": [
      "Electoral Commission",
      "Revenue Commission",
      "Willink Commission",
      "Richards Commission"
    ],
    "answer": "Willink Commission"
  }
],

"Lit-in-Eng":[
  {
    "id": "LIT001",
    "topic": "Drama",
    "question": "A serious play ending in catastrophe is a",
    "options": [
      "Farce",
      "Tragedy",
      "Ode",
      "Comedy"
    ],
    "answer": "Tragedy"
  },
  {
    "id": "LIT002",
    "topic": "Drama",
    "question": "Which option best describes tragedy?",
    "options": [
      "Comedy",
      "Farce",
      "Ode",
      "Tragedy"
    ],
    "answer": "Tragedy"
  },
  {
    "id": "LIT003",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Tragedy'. What does it refer to?",
    "options": [
      "Tragedy",
      "Comedy",
      "Farce",
      "Ode"
    ],
    "answer": "Tragedy"
  },
  {
    "id": "LIT004",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: a serious play ending in catastrophe is a?",
    "options": [
      "Ode",
      "Comedy",
      "Tragedy",
      "Farce"
    ],
    "answer": "Tragedy"
  },
  {
    "id": "LIT005",
    "topic": "Drama",
    "question": "A play intended mainly to amuse through humorous situations is a",
    "options": [
      "Elegy",
      "Comedy",
      "Tragedy",
      "Epic"
    ],
    "answer": "Comedy"
  },
  {
    "id": "LIT006",
    "topic": "Drama",
    "question": "Which option best describes comedy?",
    "options": [
      "Elegy",
      "Comedy",
      "Tragedy",
      "Epic"
    ],
    "answer": "Comedy"
  },
  {
    "id": "LIT007",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Comedy'. What does it refer to?",
    "options": [
      "Tragedy",
      "Epic",
      "Comedy",
      "Elegy"
    ],
    "answer": "Comedy"
  },
  {
    "id": "LIT008",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: a play intended mainly to amuse through humorous situations is a?",
    "options": [
      "Tragedy",
      "Comedy",
      "Epic",
      "Elegy"
    ],
    "answer": "Comedy"
  },
  {
    "id": "LIT009",
    "topic": "Drama",
    "question": "A play combining serious and comic elements is a",
    "options": [
      "Elegy",
      "Tragicomedy",
      "Sonnet",
      "Farce"
    ],
    "answer": "Tragicomedy"
  },
  {
    "id": "LIT010",
    "topic": "Drama",
    "question": "Which option best describes tragicomedy?",
    "options": [
      "Tragicomedy",
      "Farce",
      "Sonnet",
      "Elegy"
    ],
    "answer": "Tragicomedy"
  },
  {
    "id": "LIT011",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Tragicomedy'. What does it refer to?",
    "options": [
      "Farce",
      "Elegy",
      "Tragicomedy",
      "Sonnet"
    ],
    "answer": "Tragicomedy"
  },
  {
    "id": "LIT012",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: a play combining serious and comic elements is a?",
    "options": [
      "Farce",
      "Tragicomedy",
      "Sonnet",
      "Elegy"
    ],
    "answer": "Tragicomedy"
  },
  {
    "id": "LIT013",
    "topic": "Drama",
    "question": "A highly exaggerated form of comedy is",
    "options": [
      "Tragedy",
      "Ode",
      "Farce",
      "Epic"
    ],
    "answer": "Farce"
  },
  {
    "id": "LIT014",
    "topic": "Drama",
    "question": "Which option best describes farce?",
    "options": [
      "Farce",
      "Epic",
      "Tragedy",
      "Ode"
    ],
    "answer": "Farce"
  },
  {
    "id": "LIT015",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Farce'. What does it refer to?",
    "options": [
      "Farce",
      "Ode",
      "Tragedy",
      "Epic"
    ],
    "answer": "Farce"
  },
  {
    "id": "LIT016",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: a highly exaggerated form of comedy is?",
    "options": [
      "Epic",
      "Tragedy",
      "Ode",
      "Farce"
    ],
    "answer": "Farce"
  },
  {
    "id": "LIT017",
    "topic": "Drama",
    "question": "A character speaking alone to reveal private thoughts is delivering a",
    "options": [
      "Dialogue",
      "Prologue",
      "Aside",
      "Soliloquy"
    ],
    "answer": "Soliloquy"
  },
  {
    "id": "LIT018",
    "topic": "Drama",
    "question": "Which option best describes soliloquy?",
    "options": [
      "Prologue",
      "Dialogue",
      "Soliloquy",
      "Aside"
    ],
    "answer": "Soliloquy"
  },
  {
    "id": "LIT019",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Soliloquy'. What does it refer to?",
    "options": [
      "Dialogue",
      "Aside",
      "Prologue",
      "Soliloquy"
    ],
    "answer": "Soliloquy"
  },
  {
    "id": "LIT020",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: a character speaking alone to reveal private thoughts is delivering a?",
    "options": [
      "Prologue",
      "Dialogue",
      "Aside",
      "Soliloquy"
    ],
    "answer": "Soliloquy"
  },
  {
    "id": "LIT021",
    "topic": "Drama",
    "question": "A short remark heard by the audience but supposedly not by other characters is an",
    "options": [
      "Epilogue",
      "Soliloquy",
      "Dialogue",
      "Aside"
    ],
    "answer": "Aside"
  },
  {
    "id": "LIT022",
    "topic": "Drama",
    "question": "Which option best describes aside?",
    "options": [
      "Dialogue",
      "Epilogue",
      "Aside",
      "Soliloquy"
    ],
    "answer": "Aside"
  },
  {
    "id": "LIT023",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Aside'. What does it refer to?",
    "options": [
      "Epilogue",
      "Soliloquy",
      "Aside",
      "Dialogue"
    ],
    "answer": "Aside"
  },
  {
    "id": "LIT024",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: a short remark heard by the audience but supposedly not by other characters is an?",
    "options": [
      "Epilogue",
      "Aside",
      "Soliloquy",
      "Dialogue"
    ],
    "answer": "Aside"
  },
  {
    "id": "LIT025",
    "topic": "Drama",
    "question": "Conversation between characters in a play is",
    "options": [
      "Dialogue",
      "Stage direction",
      "Soliloquy",
      "Aside"
    ],
    "answer": "Dialogue"
  },
  {
    "id": "LIT026",
    "topic": "Drama",
    "question": "Which option best describes dialogue?",
    "options": [
      "Dialogue",
      "Soliloquy",
      "Stage direction",
      "Aside"
    ],
    "answer": "Dialogue"
  },
  {
    "id": "LIT027",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Dialogue'. What does it refer to?",
    "options": [
      "Aside",
      "Stage direction",
      "Dialogue",
      "Soliloquy"
    ],
    "answer": "Dialogue"
  },
  {
    "id": "LIT028",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: conversation between characters in a play is?",
    "options": [
      "Dialogue",
      "Aside",
      "Soliloquy",
      "Stage direction"
    ],
    "answer": "Dialogue"
  },
  {
    "id": "LIT029",
    "topic": "Drama",
    "question": "Instructions to actors about movement, setting and delivery are",
    "options": [
      "Dialogue",
      "Theme",
      "Stage directions",
      "Plot"
    ],
    "answer": "Stage directions"
  },
  {
    "id": "LIT030",
    "topic": "Drama",
    "question": "Which option best describes stage directions?",
    "options": [
      "Dialogue",
      "Stage directions",
      "Theme",
      "Plot"
    ],
    "answer": "Stage directions"
  },
  {
    "id": "LIT031",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Stage directions'. What does it refer to?",
    "options": [
      "Theme",
      "Dialogue",
      "Plot",
      "Stage directions"
    ],
    "answer": "Stage directions"
  },
  {
    "id": "LIT032",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: instructions to actors about movement, setting and delivery are?",
    "options": [
      "Dialogue",
      "Theme",
      "Stage directions",
      "Plot"
    ],
    "answer": "Stage directions"
  },
  {
    "id": "LIT033",
    "topic": "Drama",
    "question": "A return to an earlier event is a",
    "options": [
      "Flashback",
      "Foreshadowing",
      "Climax",
      "Resolution"
    ],
    "answer": "Flashback"
  },
  {
    "id": "LIT034",
    "topic": "Drama",
    "question": "Which option best describes flashback?",
    "options": [
      "Foreshadowing",
      "Flashback",
      "Resolution",
      "Climax"
    ],
    "answer": "Flashback"
  },
  {
    "id": "LIT035",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'Flashback'. What does it refer to?",
    "options": [
      "Resolution",
      "Flashback",
      "Foreshadowing",
      "Climax"
    ],
    "answer": "Flashback"
  },
  {
    "id": "LIT036",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: a return to an earlier event is a?",
    "options": [
      "Flashback",
      "Foreshadowing",
      "Resolution",
      "Climax"
    ],
    "answer": "Flashback"
  },
  {
    "id": "LIT037",
    "topic": "Drama",
    "question": "The arrangement of scenery on stage is called",
    "options": [
      "DÃ©cor",
      "Rhyme",
      "Diction",
      "Meter"
    ],
    "answer": "DÃ©cor"
  },
  {
    "id": "LIT038",
    "topic": "Drama",
    "question": "Which option best describes dÃ©cor?",
    "options": [
      "Meter",
      "DÃ©cor",
      "Rhyme",
      "Diction"
    ],
    "answer": "DÃ©cor"
  },
  {
    "id": "LIT039",
    "topic": "Drama",
    "question": "A literary student encounters the concept 'DÃ©cor'. What does it refer to?",
    "options": [
      "DÃ©cor",
      "Rhyme",
      "Meter",
      "Diction"
    ],
    "answer": "DÃ©cor"
  },
  {
    "id": "LIT040",
    "topic": "Drama",
    "question": "Which literary term is associated with the following idea: the arrangement of scenery on stage is called?",
    "options": [
      "Diction",
      "Meter",
      "DÃ©cor",
      "Rhyme"
    ],
    "answer": "DÃ©cor"
  },
  {
    "id": "LIT041",
    "topic": "Prose",
    "question": "A narrator who knows the thoughts of many characters is",
    "options": [
      "Objective",
      "Unreliable",
      "Omniscient",
      "First-person"
    ],
    "answer": "Omniscient"
  },
  {
    "id": "LIT042",
    "topic": "Prose",
    "question": "Which option best describes omniscient?",
    "options": [
      "Objective",
      "First-person",
      "Unreliable",
      "Omniscient"
    ],
    "answer": "Omniscient"
  },
  {
    "id": "LIT043",
    "topic": "Prose",
    "question": "A literary student encounters the concept 'Omniscient'. What does it refer to?",
    "options": [
      "Objective",
      "First-person",
      "Omniscient",
      "Unreliable"
    ],
    "answer": "Omniscient"
  },
  {
    "id": "LIT044",
    "topic": "Prose",
    "question": "Which literary term is associated with the following idea: a narrator who knows the thoughts of many characters is?",
    "options": [
      "Omniscient",
      "Unreliable",
      "Objective",
      "First-person"
    ],
    "answer": "Omniscient"
  },
  {
    "id": "LIT045",
    "topic": "Prose",
    "question": "A narrative told using 'I' normally uses the",
    "options": [
      "First-person point of view",
      "Omniscient point of view",
      "Dramatic point of view",
      "Third-person point of view"
    ],
    "answer": "First-person point of view"
  },
  {
    "id": "LIT046",
    "topic": "Prose",
    "question": "Which option best describes first-person point of view?",
    "options": [
      "First-person point of view",
      "Omniscient point of view",
      "Dramatic point of view",
      "Third-person point of view"
    ],
    "answer": "First-person point of view"
  },
  {
    "id": "LIT047",
    "topic": "Prose",
    "question": "A literary student encounters the concept 'First-person point of view'. What does it refer to?",
    "options": [
      "Omniscient point of view",
      "First-person point of view",
      "Third-person point of view",
      "Dramatic point of view"
    ],
    "answer": "First-person point of view"
  },
  {
    "id": "LIT048",
    "topic": "Prose",
    "question": "Which literary term is associated with the following idea: a narrative told using 'I' normally uses the?",
    "options": [
      "Third-person point of view",
      "First-person point of view",
      "Dramatic point of view",
      "Omniscient point of view"
    ],
    "answer": "First-person point of view"
  },
  {
    "id": "LIT049",
    "topic": "Prose",
    "question": "A character who undergoes significant change is",
    "options": [
      "Static",
      "Flat",
      "Stock",
      "Dynamic"
    ],
    "answer": "Dynamic"
  },
  {
    "id": "LIT050",
    "topic": "Prose",
    "question": "Which option best describes dynamic?",
    "options": [
      "Static",
      "Stock",
      "Flat",
      "Dynamic"
    ],
    "answer": "Dynamic"
  },
  {
    "id": "LIT051",
    "topic": "Prose",
    "question": "A literary student encounters the concept 'Dynamic'. What does it refer to?",
    "options": [
      "Dynamic",
      "Flat",
      "Stock",
      "Static"
    ],
    "answer": "Dynamic"
  },
  {
    "id": "LIT052",
    "topic": "Prose",
    "question": "Which literary term is associated with the following idea: a character who undergoes significant change is?",
    "options": [
      "Dynamic",
      "Flat",
      "Static",
      "Stock"
    ],
    "answer": "Dynamic"
  },
  {
    "id": "LIT053",
    "topic": "Prose",
    "question": "A fully developed, complex character is",
    "options": [
      "Flat",
      "Stock",
      "Minor",
      "Round"
    ],
    "answer": "Round"
  },
  {
    "id": "LIT054",
    "topic": "Prose",
    "question": "Which option best describes round?",
    "options": [
      "Flat",
      "Stock",
      "Minor",
      "Round"
    ],
    "answer": "Round"
  },
  {
    "id": "LIT055",
    "topic": "Prose",
    "question": "A literary student encounters the concept 'Round'. What does it refer to?",
    "options": [
      "Stock",
      "Minor",
      "Round",
      "Flat"
    ],
    "answer": "Round"
  },
  {
    "id": "LIT056",
    "topic": "Prose",
    "question": "Which literary term is associated with the following idea: a fully developed, complex character is?",
    "options": [
      "Minor",
      "Round",
      "Stock",
      "Flat"
    ],
    "answer": "Round"
  },
  {
    "id": "LIT057",
    "topic": "Prose",
    "question": "A character who contrasts with another character is a",
    "options": [
      "Protagonist",
      "Foil",
      "Setting",
      "Narrator"
    ],
    "answer": "Foil"
  },
  {
    "id": "LIT058",
    "topic": "Prose",
    "question": "Which option best describes foil?",
    "options": [
      "Setting",
      "Narrator",
      "Protagonist",
      "Foil"
    ],
    "answer": "Foil"
  },
  {
    "id": "LIT059",
    "topic": "Prose",
    "question": "A literary student encounters the concept 'Foil'. What does it refer to?",
    "options": [
      "Protagonist",
      "Setting",
      "Narrator",
      "Foil"
    ],
    "answer": "Foil"
  },
  {
    "id": "LIT060",
    "topic": "Prose",
    "question": "Which literary term is associated with the following idea: a character who contrasts with another character is a?",
    "options": [
      "Foil",
      "Protagonist",
      "Narrator",
      "Setting"
    ],
    "answer": "Foil"
  },
  {
    "id": "LIT061",
    "topic": "Prose",
    "question": "The central character in a narrative is the",
    "options": [
      "Foil",
      "Protagonist",
      "Antagonist",
      "Narrator"
    ],
    "answer": "Protagonist"
  },
  {
    "id": "LIT062",
    "topic": "Prose",
    "question": "Which option best describes protagonist?",
    "options": [
      "Antagonist",
      "Narrator",
      "Protagonist",
      "Foil"
    ],
    "answer": "Protagonist"
  },
  {
    "id": "LIT063",
    "topic": "Prose",
    "question": "A literary student encounters the concept 'Protagonist'. What does it refer to?",
    "options": [
      "Foil",
      "Protagonist",
      "Narrator",
      "Antagonist"
    ],
    "answer": "Protagonist"
  },
  {
    "id": "LIT064",
    "topic": "Prose",
    "question": "Which literary term is associated with the following idea: the central character in a narrative is the?",
    "options": [
      "Narrator",
      "Antagonist",
      "Protagonist",
      "Foil"
    ],
    "answer": "Protagonist"
  },
  {
    "id": "LIT065",
    "topic": "Prose",
    "question": "The character or force opposing the protagonist is the",
    "options": [
      "Antagonist",
      "Protagonist",
      "Foil",
      "Narrator"
    ],
    "answer": "Antagonist"
  },
  {
    "id": "LIT066",
    "topic": "Prose",
    "question": "Which option best describes antagonist?",
    "options": [
      "Foil",
      "Protagonist",
      "Narrator",
      "Antagonist"
    ],
    "answer": "Antagonist"
  },
  {
    "id": "LIT067",
    "topic": "Prose",
    "question": "A literary student encounters the concept 'Antagonist'. What does it refer to?",
    "options": [
      "Foil",
      "Protagonist",
      "Antagonist",
      "Narrator"
    ],
    "answer": "Antagonist"
  },
  {
    "id": "LIT068",
    "topic": "Prose",
    "question": "Which literary term is associated with the following idea: the character or force opposing the protagonist is the?",
    "options": [
      "Narrator",
      "Foil",
      "Protagonist",
      "Antagonist"
    ],
    "answer": "Antagonist"
  },
  {
    "id": "LIT069",
    "topic": "Prose",
    "question": "A character with limited development and few traits is",
    "options": [
      "Dynamic",
      "Flat",
      "Round",
      "Foil"
    ],
    "answer": "Flat"
  },
  {
    "id": "LIT070",
    "topic": "Prose",
    "question": "Which option best describes flat?",
    "options": [
      "Foil",
      "Round",
      "Dynamic",
      "Flat"
    ],
    "answer": "Flat"
  },
  {
    "id": "LIT071",
    "topic": "Prose",
    "question": "A literary student encounters the concept 'Flat'. What does it refer to?",
    "options": [
      "Foil",
      "Round",
      "Flat",
      "Dynamic"
    ],
    "answer": "Flat"
  },
  {
    "id": "LIT072",
    "topic": "Prose",
    "question": "Which literary term is associated with the following idea: a character with limited development and few traits is?",
    "options": [
      "Dynamic",
      "Round",
      "Foil",
      "Flat"
    ],
    "answer": "Flat"
  },
  {
    "id": "LIT073",
    "topic": "Literary Elements",
    "question": "The central idea of a literary work is its",
    "options": [
      "Conflict",
      "Plot",
      "Theme",
      "Setting"
    ],
    "answer": "Theme"
  },
  {
    "id": "LIT074",
    "topic": "Literary Elements",
    "question": "Which option best describes theme?",
    "options": [
      "Setting",
      "Theme",
      "Plot",
      "Conflict"
    ],
    "answer": "Theme"
  },
  {
    "id": "LIT075",
    "topic": "Literary Elements",
    "question": "A literary student encounters the concept 'Theme'. What does it refer to?",
    "options": [
      "Theme",
      "Conflict",
      "Plot",
      "Setting"
    ],
    "answer": "Theme"
  },
  {
    "id": "LIT076",
    "topic": "Literary Elements",
    "question": "Which literary term is associated with the following idea: the central idea of a literary work is its?",
    "options": [
      "Theme",
      "Setting",
      "Plot",
      "Conflict"
    ],
    "answer": "Theme"
  },
  {
    "id": "LIT077",
    "topic": "Literary Elements",
    "question": "The sequence of events in a work is its",
    "options": [
      "Theme",
      "Tone",
      "Diction",
      "Plot"
    ],
    "answer": "Plot"
  },
  {
    "id": "LIT078",
    "topic": "Literary Elements",
    "question": "Which option best describes plot?",
    "options": [
      "Tone",
      "Theme",
      "Diction",
      "Plot"
    ],
    "answer": "Plot"
  },
  {
    "id": "LIT079",
    "topic": "Literary Elements",
    "question": "A literary student encounters the concept 'Plot'. What does it refer to?",
    "options": [
      "Theme",
      "Diction",
      "Plot",
      "Tone"
    ],
    "answer": "Plot"
  },
  {
    "id": "LIT080",
    "topic": "Literary Elements",
    "question": "Which literary term is associated with the following idea: the sequence of events in a work is its?",
    "options": [
      "Theme",
      "Tone",
      "Diction",
      "Plot"
    ],
    "answer": "Plot"
  },
  {
    "id": "LIT081",
    "topic": "Literary Elements",
    "question": "The time and place of a work constitute its",
    "options": [
      "Tone",
      "Plot",
      "Setting",
      "Meter"
    ],
    "answer": "Setting"
  },
  {
    "id": "LIT082",
    "topic": "Literary Elements",
    "question": "Which option best describes setting?",
    "options": [
      "Setting",
      "Meter",
      "Plot",
      "Tone"
    ],
    "answer": "Setting"
  },
  {
    "id": "LIT083",
    "topic": "Literary Elements",
    "question": "A literary student encounters the concept 'Setting'. What does it refer to?",
    "options": [
      "Setting",
      "Meter",
      "Tone",
      "Plot"
    ],
    "answer": "Setting"
  },
  {
    "id": "LIT084",
    "topic": "Literary Elements",
    "question": "Which literary term is associated with the following idea: the time and place of a work constitute its?",
    "options": [
      "Plot",
      "Tone",
      "Setting",
      "Meter"
    ],
    "answer": "Setting"
  },
  {
    "id": "LIT085",
    "topic": "Literary Elements",
    "question": "A struggle between opposing forces is",
    "options": [
      "Setting",
      "Diction",
      "Conflict",
      "Mood"
    ],
    "answer": "Conflict"
  },
  {
    "id": "LIT086",
    "topic": "Literary Elements",
    "question": "Which option best describes conflict?",
    "options": [
      "Setting",
      "Diction",
      "Conflict",
      "Mood"
    ],
    "answer": "Conflict"
  },
  {
    "id": "LIT087",
    "topic": "Literary Elements",
    "question": "A literary student encounters the concept 'Conflict'. What does it refer to?",
    "options": [
      "Setting",
      "Mood",
      "Diction",
      "Conflict"
    ],
    "answer": "Conflict"
  },
  {
    "id": "LIT088",
    "topic": "Literary Elements",
    "question": "Which literary term is associated with the following idea: a struggle between opposing forces is?",
    "options": [
      "Mood",
      "Setting",
      "Diction",
      "Conflict"
    ],
    "answer": "Conflict"
  },
  {
    "id": "LIT089",
    "topic": "Literary Elements",
    "question": "The highest point of tension in a plot is the",
    "options": [
      "Prologue",
      "Resolution",
      "Exposition",
      "Climax"
    ],
    "answer": "Climax"
  },
  {
    "id": "LIT090",
    "topic": "Literary Elements",
    "question": "Which option best describes climax?",
    "options": [
      "Resolution",
      "Exposition",
      "Climax",
      "Prologue"
    ],
    "answer": "Climax"
  },
  {
    "id": "LIT091",
    "topic": "Literary Elements",
    "question": "A literary student encounters the concept 'Climax'. What does it refer to?",
    "options": [
      "Exposition",
      "Climax",
      "Resolution",
      "Prologue"
    ],
    "answer": "Climax"
  },
  {
    "id": "LIT092",
    "topic": "Literary Elements",
    "question": "Which literary term is associated with the following idea: the highest point of tension in a plot is the?",
    "options": [
      "Prologue",
      "Climax",
      "Resolution",
      "Exposition"
    ],
    "answer": "Climax"
  },
  {
    "id": "LIT093",
    "topic": "Literary Elements",
    "question": "The opening section introducing the situation and characters is",
    "options": [
      "Denouement",
      "Climax",
      "Epilogue",
      "Exposition"
    ],
    "answer": "Exposition"
  },
  {
    "id": "LIT094",
    "topic": "Literary Elements",
    "question": "Which option best describes exposition?",
    "options": [
      "Climax",
      "Exposition",
      "Epilogue",
      "Denouement"
    ],
    "answer": "Exposition"
  },
  {
    "id": "LIT095",
    "topic": "Literary Elements",
    "question": "A literary student encounters the concept 'Exposition'. What does it refer to?",
    "options": [
      "Exposition",
      "Epilogue",
      "Climax",
      "Denouement"
    ],
    "answer": "Exposition"
  },
  {
    "id": "LIT096",
    "topic": "Literary Elements",
    "question": "Which literary term is associated with the following idea: the opening section introducing the situation and characters is?",
    "options": [
      "Epilogue",
      "Exposition",
      "Climax",
      "Denouement"
    ],
    "answer": "Exposition"
  },
  {
    "id": "LIT097",
    "topic": "Literary Elements",
    "question": "The stage at which major conflicts are brought toward closure is the",
    "options": [
      "Resolution",
      "Exposition",
      "Inciting incident",
      "Flashback"
    ],
    "answer": "Resolution"
  },
  {
    "id": "LIT098",
    "topic": "Literary Elements",
    "question": "Which option best describes resolution?",
    "options": [
      "Resolution",
      "Flashback",
      "Exposition",
      "Inciting incident"
    ],
    "answer": "Resolution"
  },
  {
    "id": "LIT099",
    "topic": "Literary Elements",
    "question": "A literary student encounters the concept 'Resolution'. What does it refer to?",
    "options": [
      "Inciting incident",
      "Resolution",
      "Flashback",
      "Exposition"
    ],
    "answer": "Resolution"
  },
  {
    "id": "LIT100",
    "topic": "Literary Elements",
    "question": "Which literary term is associated with the following idea: the stage at which major conflicts are brought toward closure is the?",
    "options": [
      "Exposition",
      "Inciting incident",
      "Resolution",
      "Flashback"
    ],
    "answer": "Resolution"
  },
  {
    "id": "LIT101",
    "topic": "The Lion and the Jewel",
    "question": "Who wrote The Lion and the Jewel?",
    "options": [
      "Emily BrontÃ«",
      "Buchi Emecheta",
      "Wole Soyinka",
      "John Osborne"
    ],
    "answer": "Wole Soyinka"
  },
  {
    "id": "LIT102",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: who wrote The Lion and the Jewel?",
    "options": [
      "Wole Soyinka",
      "John Osborne",
      "Emily BrontÃ«",
      "Buchi Emecheta"
    ],
    "answer": "Wole Soyinka"
  },
  {
    "id": "LIT103",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning author?",
    "options": [
      "John Osborne",
      "Emily BrontÃ«",
      "Wole Soyinka",
      "Buchi Emecheta"
    ],
    "answer": "Wole Soyinka"
  },
  {
    "id": "LIT104",
    "topic": "The Lion and the Jewel",
    "question": "The main village setting of The Lion and the Jewel is",
    "options": [
      "Yorkshire",
      "London",
      "Lagos",
      "Ilujinle"
    ],
    "answer": "Ilujinle"
  },
  {
    "id": "LIT105",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: the main village setting of The Lion and the Jewel is",
    "options": [
      "Ilujinle",
      "Lagos",
      "London",
      "Yorkshire"
    ],
    "answer": "Ilujinle"
  },
  {
    "id": "LIT106",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning setting?",
    "options": [
      "Yorkshire",
      "Lagos",
      "Ilujinle",
      "London"
    ],
    "answer": "Ilujinle"
  },
  {
    "id": "LIT107",
    "topic": "The Lion and the Jewel",
    "question": "Which character is the village belle in the play?",
    "options": [
      "Lakunle",
      "Sidi",
      "Sadiku",
      "Baroka"
    ],
    "answer": "Sidi"
  },
  {
    "id": "LIT108",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: which character is the village belle in the play?",
    "options": [
      "Baroka",
      "Lakunle",
      "Sadiku",
      "Sidi"
    ],
    "answer": "Sidi"
  },
  {
    "id": "LIT109",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning protagonist?",
    "options": [
      "Baroka",
      "Sadiku",
      "Sidi",
      "Lakunle"
    ],
    "answer": "Sidi"
  },
  {
    "id": "LIT110",
    "topic": "The Lion and the Jewel",
    "question": "Who is the schoolteacher who courts Sidi?",
    "options": [
      "Lakunle",
      "Ailatu",
      "Sadiku",
      "Baroka"
    ],
    "answer": "Lakunle"
  },
  {
    "id": "LIT111",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: who is the schoolteacher who courts Sidi?",
    "options": [
      "Sadiku",
      "Baroka",
      "Lakunle",
      "Ailatu"
    ],
    "answer": "Lakunle"
  },
  {
    "id": "LIT112",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning teacher?",
    "options": [
      "Lakunle",
      "Ailatu",
      "Sadiku",
      "Baroka"
    ],
    "answer": "Lakunle"
  },
  {
    "id": "LIT113",
    "topic": "The Lion and the Jewel",
    "question": "Who is the Bale of Ilujinle?",
    "options": [
      "The photographer",
      "Baroka",
      "Sadiku",
      "Lakunle"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT114",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: who is the Bale of Ilujinle?",
    "options": [
      "Lakunle",
      "The photographer",
      "Sadiku",
      "Baroka"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT115",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning bale?",
    "options": [
      "Baroka",
      "The photographer",
      "Lakunle",
      "Sadiku"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT116",
    "topic": "The Lion and the Jewel",
    "question": "Which character most strongly represents Western-style modernity?",
    "options": [
      "Sidi",
      "Lakunle",
      "Sadiku",
      "Baroka"
    ],
    "answer": "Lakunle"
  },
  {
    "id": "LIT117",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: which character most strongly represents Western-style modernity?",
    "options": [
      "Baroka",
      "Sadiku",
      "Sidi",
      "Lakunle"
    ],
    "answer": "Lakunle"
  },
  {
    "id": "LIT118",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning modernity?",
    "options": [
      "Sidi",
      "Lakunle",
      "Baroka",
      "Sadiku"
    ],
    "answer": "Lakunle"
  },
  {
    "id": "LIT119",
    "topic": "The Lion and the Jewel",
    "question": "Which character most strongly represents traditional authority?",
    "options": [
      "The photographer",
      "Sidi",
      "Lakunle",
      "Baroka"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT120",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: which character most strongly represents traditional authority?",
    "options": [
      "The photographer",
      "Baroka",
      "Lakunle",
      "Sidi"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT121",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning tradition?",
    "options": [
      "Lakunle",
      "Sidi",
      "Baroka",
      "The photographer"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT122",
    "topic": "The Lion and the Jewel",
    "question": "What custom does Lakunle resist paying?",
    "options": [
      "Tax",
      "School fees",
      "Rent",
      "Bride price"
    ],
    "answer": "Bride price"
  },
  {
    "id": "LIT123",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: what custom does Lakunle resist paying?",
    "options": [
      "Bride price",
      "Rent",
      "Tax",
      "School fees"
    ],
    "answer": "Bride price"
  },
  {
    "id": "LIT124",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning brideprice?",
    "options": [
      "Rent",
      "Bride price",
      "School fees",
      "Tax"
    ],
    "answer": "Bride price"
  },
  {
    "id": "LIT125",
    "topic": "The Lion and the Jewel",
    "question": "What event greatly increases Sidi's public self-confidence?",
    "options": [
      "Her winning a contest",
      "Her appointment as Bale",
      "Her becoming a teacher",
      "Her appearance in a magazine"
    ],
    "answer": "Her appearance in a magazine"
  },
  {
    "id": "LIT126",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: what event greatly increases Sidi's public self-confidence?",
    "options": [
      "Her appearance in a magazine",
      "Her becoming a teacher",
      "Her appointment as Bale",
      "Her winning a contest"
    ],
    "answer": "Her appearance in a magazine"
  },
  {
    "id": "LIT127",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning magazine?",
    "options": [
      "Her winning a contest",
      "Her appearance in a magazine",
      "Her becoming a teacher",
      "Her appointment as Bale"
    ],
    "answer": "Her appearance in a magazine"
  },
  {
    "id": "LIT128",
    "topic": "The Lion and the Jewel",
    "question": "In the title, the 'Lion' most directly symbolizes",
    "options": [
      "Lakunle",
      "Sadiku",
      "Sidi",
      "Baroka"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT129",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: in the title, the 'Lion' most directly symbolizes",
    "options": [
      "Lakunle",
      "Baroka",
      "Sadiku",
      "Sidi"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT130",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning titlelion?",
    "options": [
      "Sidi",
      "Lakunle",
      "Baroka",
      "Sadiku"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT131",
    "topic": "The Lion and the Jewel",
    "question": "In the title, the 'Jewel' most directly symbolizes",
    "options": [
      "Sadiku",
      "Sidi",
      "Baroka",
      "Lakunle"
    ],
    "answer": "Sidi"
  },
  {
    "id": "LIT132",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: in the title, the 'Jewel' most directly symbolizes",
    "options": [
      "Sidi",
      "Lakunle",
      "Baroka",
      "Sadiku"
    ],
    "answer": "Sidi"
  },
  {
    "id": "LIT133",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning titlejewel?",
    "options": [
      "Sadiku",
      "Sidi",
      "Lakunle",
      "Baroka"
    ],
    "answer": "Sidi"
  },
  {
    "id": "LIT134",
    "topic": "The Lion and the Jewel",
    "question": "Sadiku is primarily associated with Baroka as his",
    "options": [
      "Rival",
      "Senior wife and intermediary",
      "Daughter",
      "Teacher"
    ],
    "answer": "Senior wife and intermediary"
  },
  {
    "id": "LIT135",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: sadiku is primarily associated with Baroka as his",
    "options": [
      "Teacher",
      "Senior wife and intermediary",
      "Daughter",
      "Rival"
    ],
    "answer": "Senior wife and intermediary"
  },
  {
    "id": "LIT136",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning sadiku?",
    "options": [
      "Teacher",
      "Rival",
      "Daughter",
      "Senior wife and intermediary"
    ],
    "answer": "Senior wife and intermediary"
  },
  {
    "id": "LIT137",
    "topic": "The Lion and the Jewel",
    "question": "The photographer's pictures mainly contribute to Sidi's",
    "options": [
      "Political authority",
      "Fear of school",
      "Military power",
      "Pride and sense of status"
    ],
    "answer": "Pride and sense of status"
  },
  {
    "id": "LIT138",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: the photographer's pictures mainly contribute to Sidi's",
    "options": [
      "Pride and sense of status",
      "Military power",
      "Fear of school",
      "Political authority"
    ],
    "answer": "Pride and sense of status"
  },
  {
    "id": "LIT139",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning photographer?",
    "options": [
      "Military power",
      "Political authority",
      "Pride and sense of status",
      "Fear of school"
    ],
    "answer": "Pride and sense of status"
  },
  {
    "id": "LIT140",
    "topic": "The Lion and the Jewel",
    "question": "Baroka's claim of impotence is eventually shown to be",
    "options": [
      "A curse",
      "A deception",
      "A medical diagnosis",
      "A legal order"
    ],
    "answer": "A deception"
  },
  {
    "id": "LIT141",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: baroka's claim of impotence is eventually shown to be",
    "options": [
      "A deception",
      "A legal order",
      "A curse",
      "A medical diagnosis"
    ],
    "answer": "A deception"
  },
  {
    "id": "LIT142",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning impotence?",
    "options": [
      "A deception",
      "A curse",
      "A legal order",
      "A medical diagnosis"
    ],
    "answer": "A deception"
  },
  {
    "id": "LIT143",
    "topic": "The Lion and the Jewel",
    "question": "Baroka's main strength in the conflict is his",
    "options": [
      "Cunning",
      "Timidity",
      "Ignorance",
      "Naivety"
    ],
    "answer": "Cunning"
  },
  {
    "id": "LIT144",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: baroka's main strength in the conflict is his",
    "options": [
      "Ignorance",
      "Naivety",
      "Cunning",
      "Timidity"
    ],
    "answer": "Cunning"
  },
  {
    "id": "LIT145",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning cunning?",
    "options": [
      "Naivety",
      "Cunning",
      "Ignorance",
      "Timidity"
    ],
    "answer": "Cunning"
  },
  {
    "id": "LIT146",
    "topic": "The Lion and the Jewel",
    "question": "Dance and mime in the play help emphasize",
    "options": [
      "Yoruba performance traditions",
      "Court procedure",
      "Scientific reasoning",
      "Industrial life"
    ],
    "answer": "Yoruba performance traditions"
  },
  {
    "id": "LIT147",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: dance and mime in the play help emphasize",
    "options": [
      "Scientific reasoning",
      "Yoruba performance traditions",
      "Court procedure",
      "Industrial life"
    ],
    "answer": "Yoruba performance traditions"
  },
  {
    "id": "LIT148",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning dance?",
    "options": [
      "Yoruba performance traditions",
      "Scientific reasoning",
      "Court procedure",
      "Industrial life"
    ],
    "answer": "Yoruba performance traditions"
  },
  {
    "id": "LIT149",
    "topic": "The Lion and the Jewel",
    "question": "A central theme of the play is",
    "options": [
      "Space exploration",
      "Tradition versus modernity",
      "Industrial warfare",
      "Scientific discovery"
    ],
    "answer": "Tradition versus modernity"
  },
  {
    "id": "LIT150",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: a central theme of the play is",
    "options": [
      "Tradition versus modernity",
      "Scientific discovery",
      "Space exploration",
      "Industrial warfare"
    ],
    "answer": "Tradition versus modernity"
  },
  {
    "id": "LIT151",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning theme?",
    "options": [
      "Space exploration",
      "Industrial warfare",
      "Scientific discovery",
      "Tradition versus modernity"
    ],
    "answer": "Tradition versus modernity"
  },
  {
    "id": "LIT152",
    "topic": "The Lion and the Jewel",
    "question": "The Lion and the Jewel is primarily a",
    "options": [
      "Epic",
      "Elegy",
      "Comedy",
      "Tragedy"
    ],
    "answer": "Comedy"
  },
  {
    "id": "LIT153",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: the Lion and the Jewel is primarily a",
    "options": [
      "Tragedy",
      "Epic",
      "Comedy",
      "Elegy"
    ],
    "answer": "Comedy"
  },
  {
    "id": "LIT154",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning genre?",
    "options": [
      "Epic",
      "Elegy",
      "Tragedy",
      "Comedy"
    ],
    "answer": "Comedy"
  },
  {
    "id": "LIT155",
    "topic": "The Lion and the Jewel",
    "question": "Lakunle's attitude to bride price shows his",
    "options": [
      "Modernist beliefs",
      "Religious authority",
      "Military ambition",
      "Support for every tradition"
    ],
    "answer": "Modernist beliefs"
  },
  {
    "id": "LIT156",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: lakunle's attitude to bride price shows his",
    "options": [
      "Support for every tradition",
      "Modernist beliefs",
      "Religious authority",
      "Military ambition"
    ],
    "answer": "Modernist beliefs"
  },
  {
    "id": "LIT157",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning lunkulu?",
    "options": [
      "Support for every tradition",
      "Military ambition",
      "Modernist beliefs",
      "Religious authority"
    ],
    "answer": "Modernist beliefs"
  },
  {
    "id": "LIT158",
    "topic": "The Lion and the Jewel",
    "question": "At the end of the play, Sidi chooses",
    "options": [
      "The photographer",
      "Lakunle",
      "Sadiku",
      "Baroka"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT159",
    "topic": "The Lion and the Jewel",
    "question": "In The Lion and the Jewel, which option is correctly associated with the following description: at the end of the play, Sidi chooses",
    "options": [
      "The photographer",
      "Sadiku",
      "Lakunle",
      "Baroka"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT160",
    "topic": "The Lion and the Jewel",
    "question": "Which statement about The Lion and the Jewel is correct concerning sidiending?",
    "options": [
      "Baroka",
      "Lakunle",
      "Sadiku",
      "The photographer"
    ],
    "answer": "Baroka"
  },
  {
    "id": "LIT161",
    "topic": "Look Back in Anger",
    "question": "Who wrote Look Back in Anger?",
    "options": [
      "Buchi Emecheta",
      "John Osborne",
      "Emily BrontÃ«",
      "Wole Soyinka"
    ],
    "answer": "John Osborne"
  },
  {
    "id": "LIT162",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: who wrote Look Back in Anger?",
    "options": [
      "Wole Soyinka",
      "John Osborne",
      "Buchi Emecheta",
      "Emily BrontÃ«"
    ],
    "answer": "John Osborne"
  },
  {
    "id": "LIT163",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning author?",
    "options": [
      "John Osborne",
      "Wole Soyinka",
      "Buchi Emecheta",
      "Emily BrontÃ«"
    ],
    "answer": "John Osborne"
  },
  {
    "id": "LIT164",
    "topic": "Look Back in Anger",
    "question": "Who is the central male character?",
    "options": [
      "Hugh Tanner",
      "Cliff Lewis",
      "Jimmy Porter",
      "Colonel Redfern"
    ],
    "answer": "Jimmy Porter"
  },
  {
    "id": "LIT165",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: who is the central male character?",
    "options": [
      "Colonel Redfern",
      "Hugh Tanner",
      "Cliff Lewis",
      "Jimmy Porter"
    ],
    "answer": "Jimmy Porter"
  },
  {
    "id": "LIT166",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning jimmy?",
    "options": [
      "Colonel Redfern",
      "Jimmy Porter",
      "Cliff Lewis",
      "Hugh Tanner"
    ],
    "answer": "Jimmy Porter"
  },
  {
    "id": "LIT167",
    "topic": "Look Back in Anger",
    "question": "Who is Jimmy's wife?",
    "options": [
      "Madeline",
      "Helena Charles",
      "Catherine",
      "Alison Porter"
    ],
    "answer": "Alison Porter"
  },
  {
    "id": "LIT168",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: who is Jimmy's wife?",
    "options": [
      "Catherine",
      "Helena Charles",
      "Madeline",
      "Alison Porter"
    ],
    "answer": "Alison Porter"
  },
  {
    "id": "LIT169",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning alison?",
    "options": [
      "Helena Charles",
      "Catherine",
      "Alison Porter",
      "Madeline"
    ],
    "answer": "Alison Porter"
  },
  {
    "id": "LIT170",
    "topic": "Look Back in Anger",
    "question": "Who is Alison's friend who becomes involved with Jimmy?",
    "options": [
      "Sadiku",
      "Helena Charles",
      "Auntie",
      "Catherine"
    ],
    "answer": "Helena Charles"
  },
  {
    "id": "LIT171",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: who is Alison's friend who becomes involved with Jimmy?",
    "options": [
      "Catherine",
      "Helena Charles",
      "Sadiku",
      "Auntie"
    ],
    "answer": "Helena Charles"
  },
  {
    "id": "LIT172",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning helena?",
    "options": [
      "Sadiku",
      "Helena Charles",
      "Auntie",
      "Catherine"
    ],
    "answer": "Helena Charles"
  },
  {
    "id": "LIT173",
    "topic": "Look Back in Anger",
    "question": "Who is Alison's father?",
    "options": [
      "Cliff Lewis",
      "Colonel Redfern",
      "Hugh Tanner",
      "Jimmy Porter"
    ],
    "answer": "Colonel Redfern"
  },
  {
    "id": "LIT174",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: who is Alison's father?",
    "options": [
      "Colonel Redfern",
      "Cliff Lewis",
      "Hugh Tanner",
      "Jimmy Porter"
    ],
    "answer": "Colonel Redfern"
  },
  {
    "id": "LIT175",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning colonel?",
    "options": [
      "Hugh Tanner",
      "Colonel Redfern",
      "Jimmy Porter",
      "Cliff Lewis"
    ],
    "answer": "Colonel Redfern"
  },
  {
    "id": "LIT176",
    "topic": "Look Back in Anger",
    "question": "Cliff Lewis is Jimmy's",
    "options": [
      "Father",
      "Friend and lodger",
      "Brother",
      "Employer"
    ],
    "answer": "Friend and lodger"
  },
  {
    "id": "LIT177",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: cliff Lewis is Jimmy's",
    "options": [
      "Employer",
      "Friend and lodger",
      "Brother",
      "Father"
    ],
    "answer": "Friend and lodger"
  },
  {
    "id": "LIT178",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning cliff?",
    "options": [
      "Father",
      "Brother",
      "Employer",
      "Friend and lodger"
    ],
    "answer": "Friend and lodger"
  },
  {
    "id": "LIT179",
    "topic": "Look Back in Anger",
    "question": "The play is set mainly in",
    "options": [
      "England",
      "India",
      "Scotland",
      "Nigeria"
    ],
    "answer": "England"
  },
  {
    "id": "LIT180",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: the play is set mainly in",
    "options": [
      "England",
      "India",
      "Scotland",
      "Nigeria"
    ],
    "answer": "England"
  },
  {
    "id": "LIT181",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning setting?",
    "options": [
      "Nigeria",
      "Scotland",
      "England",
      "India"
    ],
    "answer": "England"
  },
  {
    "id": "LIT182",
    "topic": "Look Back in Anger",
    "question": "The domestic action takes place largely in a",
    "options": [
      "Village palace",
      "Country estate",
      "Hotel",
      "Small flat"
    ],
    "answer": "Small flat"
  },
  {
    "id": "LIT183",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: the domestic action takes place largely in a",
    "options": [
      "Hotel",
      "Village palace",
      "Country estate",
      "Small flat"
    ],
    "answer": "Small flat"
  },
  {
    "id": "LIT184",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning flat?",
    "options": [
      "Country estate",
      "Hotel",
      "Village palace",
      "Small flat"
    ],
    "answer": "Small flat"
  },
  {
    "id": "LIT185",
    "topic": "Look Back in Anger",
    "question": "The play reflects the mood of",
    "options": [
      "Post-war Britain",
      "Ancient Greece",
      "Colonial Nigeria",
      "Victorian England"
    ],
    "answer": "Post-war Britain"
  },
  {
    "id": "LIT186",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: the play reflects the mood of",
    "options": [
      "Victorian England",
      "Ancient Greece",
      "Colonial Nigeria",
      "Post-war Britain"
    ],
    "answer": "Post-war Britain"
  },
  {
    "id": "LIT187",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning context?",
    "options": [
      "Colonial Nigeria",
      "Post-war Britain",
      "Victorian England",
      "Ancient Greece"
    ],
    "answer": "Post-war Britain"
  },
  {
    "id": "LIT188",
    "topic": "Look Back in Anger",
    "question": "Jimmy's social background contrasts with Alison's",
    "options": [
      "More privileged upbringing",
      "Rural farming background",
      "Village leadership",
      "Military career"
    ],
    "answer": "More privileged upbringing"
  },
  {
    "id": "LIT189",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: jimmy's social background contrasts with Alison's",
    "options": [
      "Village leadership",
      "Rural farming background",
      "More privileged upbringing",
      "Military career"
    ],
    "answer": "More privileged upbringing"
  },
  {
    "id": "LIT190",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning class?",
    "options": [
      "Rural farming background",
      "Military career",
      "Village leadership",
      "More privileged upbringing"
    ],
    "answer": "More privileged upbringing"
  },
  {
    "id": "LIT191",
    "topic": "Look Back in Anger",
    "question": "Jimmy's anger is strongly associated with",
    "options": [
      "Scientific discovery",
      "Social and personal frustration",
      "Religious devotion",
      "Royal privilege"
    ],
    "answer": "Social and personal frustration"
  },
  {
    "id": "LIT192",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: jimmy's anger is strongly associated with",
    "options": [
      "Religious devotion",
      "Social and personal frustration",
      "Royal privilege",
      "Scientific discovery"
    ],
    "answer": "Social and personal frustration"
  },
  {
    "id": "LIT193",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning anger?",
    "options": [
      "Religious devotion",
      "Royal privilege",
      "Scientific discovery",
      "Social and personal frustration"
    ],
    "answer": "Social and personal frustration"
  },
  {
    "id": "LIT194",
    "topic": "Look Back in Anger",
    "question": "The title points to a critical attitude toward",
    "options": [
      "Astronomy",
      "Ancient mythology",
      "Agriculture",
      "The past and contemporary society"
    ],
    "answer": "The past and contemporary society"
  },
  {
    "id": "LIT195",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: the title points to a critical attitude toward",
    "options": [
      "The past and contemporary society",
      "Ancient mythology",
      "Astronomy",
      "Agriculture"
    ],
    "answer": "The past and contemporary society"
  },
  {
    "id": "LIT196",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning title?",
    "options": [
      "Ancient mythology",
      "The past and contemporary society",
      "Astronomy",
      "Agriculture"
    ],
    "answer": "The past and contemporary society"
  },
  {
    "id": "LIT197",
    "topic": "Look Back in Anger",
    "question": "Jimmy's teddy-boy identity suggests",
    "options": [
      "Military rank",
      "Working-class rebellion",
      "Aristocratic privilege",
      "Colonial authority"
    ],
    "answer": "Working-class rebellion"
  },
  {
    "id": "LIT198",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: jimmy's teddy-boy identity suggests",
    "options": [
      "Working-class rebellion",
      "Colonial authority",
      "Aristocratic privilege",
      "Military rank"
    ],
    "answer": "Working-class rebellion"
  },
  {
    "id": "LIT199",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning teddyboy?",
    "options": [
      "Military rank",
      "Working-class rebellion",
      "Aristocratic privilege",
      "Colonial authority"
    ],
    "answer": "Working-class rebellion"
  },
  {
    "id": "LIT200",
    "topic": "Look Back in Anger",
    "question": "Colonel Redfern represents",
    "options": [
      "An older generation and the fading imperial order",
      "Factory workers",
      "Young revolutionaries",
      "Village chiefs"
    ],
    "answer": "An older generation and the fading imperial order"
  },
  {
    "id": "LIT201",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: colonel Redfern represents",
    "options": [
      "Village chiefs",
      "An older generation and the fading imperial order",
      "Factory workers",
      "Young revolutionaries"
    ],
    "answer": "An older generation and the fading imperial order"
  },
  {
    "id": "LIT202",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning redfern?",
    "options": [
      "Village chiefs",
      "An older generation and the fading imperial order",
      "Young revolutionaries",
      "Factory workers"
    ],
    "answer": "An older generation and the fading imperial order"
  },
  {
    "id": "LIT203",
    "topic": "Look Back in Anger",
    "question": "Alison's silence often reflects",
    "options": [
      "Emotional pressure and conflict",
      "Military training",
      "Academic success",
      "Political authority"
    ],
    "answer": "Emotional pressure and conflict"
  },
  {
    "id": "LIT204",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: alison's silence often reflects",
    "options": [
      "Political authority",
      "Military training",
      "Emotional pressure and conflict",
      "Academic success"
    ],
    "answer": "Emotional pressure and conflict"
  },
  {
    "id": "LIT205",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning silence?",
    "options": [
      "Political authority",
      "Academic success",
      "Military training",
      "Emotional pressure and conflict"
    ],
    "answer": "Emotional pressure and conflict"
  },
  {
    "id": "LIT206",
    "topic": "Look Back in Anger",
    "question": "A major dramatic technique in the play is",
    "options": [
      "Ballad stanza",
      "Confrontational dialogue",
      "Epic narration",
      "Sonnet rhyme"
    ],
    "answer": "Confrontational dialogue"
  },
  {
    "id": "LIT207",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: a major dramatic technique in the play is",
    "options": [
      "Sonnet rhyme",
      "Confrontational dialogue",
      "Epic narration",
      "Ballad stanza"
    ],
    "answer": "Confrontational dialogue"
  },
  {
    "id": "LIT208",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning dialogue?",
    "options": [
      "Sonnet rhyme",
      "Epic narration",
      "Ballad stanza",
      "Confrontational dialogue"
    ],
    "answer": "Confrontational dialogue"
  },
  {
    "id": "LIT209",
    "topic": "Look Back in Anger",
    "question": "The cramped flat helps create a sense of",
    "options": [
      "Rural peace",
      "Confinement and domestic tension",
      "Political freedom",
      "International travel"
    ],
    "answer": "Confinement and domestic tension"
  },
  {
    "id": "LIT210",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: the cramped flat helps create a sense of",
    "options": [
      "International travel",
      "Political freedom",
      "Rural peace",
      "Confinement and domestic tension"
    ],
    "answer": "Confinement and domestic tension"
  },
  {
    "id": "LIT211",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning settingeffect?",
    "options": [
      "Confinement and domestic tension",
      "International travel",
      "Political freedom",
      "Rural peace"
    ],
    "answer": "Confinement and domestic tension"
  },
  {
    "id": "LIT212",
    "topic": "Look Back in Anger",
    "question": "The play explores",
    "options": [
      "Ancient warfare",
      "Class and generational tension",
      "Agricultural science",
      "Space travel"
    ],
    "answer": "Class and generational tension"
  },
  {
    "id": "LIT213",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: the play explores",
    "options": [
      "Ancient warfare",
      "Agricultural science",
      "Class and generational tension",
      "Space travel"
    ],
    "answer": "Class and generational tension"
  },
  {
    "id": "LIT214",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning classconflict?",
    "options": [
      "Ancient warfare",
      "Class and generational tension",
      "Agricultural science",
      "Space travel"
    ],
    "answer": "Class and generational tension"
  },
  {
    "id": "LIT215",
    "topic": "Look Back in Anger",
    "question": "The play's realism is evident in its",
    "options": [
      "Royal ceremonies",
      "Ordinary domestic setting and conversational speech",
      "Mythical creatures",
      "Epic battles"
    ],
    "answer": "Ordinary domestic setting and conversational speech"
  },
  {
    "id": "LIT216",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: the play's realism is evident in its",
    "options": [
      "Royal ceremonies",
      "Mythical creatures",
      "Epic battles",
      "Ordinary domestic setting and conversational speech"
    ],
    "answer": "Ordinary domestic setting and conversational speech"
  },
  {
    "id": "LIT217",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning realism?",
    "options": [
      "Ordinary domestic setting and conversational speech",
      "Epic battles",
      "Mythical creatures",
      "Royal ceremonies"
    ],
    "answer": "Ordinary domestic setting and conversational speech"
  },
  {
    "id": "LIT218",
    "topic": "Look Back in Anger",
    "question": "Alison's pregnancy changes",
    "options": [
      "The emotional stakes of the relationship",
      "The national constitution",
      "A military campaign",
      "The setting"
    ],
    "answer": "The emotional stakes of the relationship"
  },
  {
    "id": "LIT219",
    "topic": "Look Back in Anger",
    "question": "In Look Back in Anger, which option is correctly associated with the following description: alison's pregnancy changes",
    "options": [
      "The emotional stakes of the relationship",
      "The setting",
      "A military campaign",
      "The national constitution"
    ],
    "answer": "The emotional stakes of the relationship"
  },
  {
    "id": "LIT220",
    "topic": "Look Back in Anger",
    "question": "Which statement about Look Back in Anger is correct concerning pregnancy?",
    "options": [
      "A military campaign",
      "The national constitution",
      "The emotional stakes of the relationship",
      "The setting"
    ],
    "answer": "The emotional stakes of the relationship"
  },
  {
    "id": "LIT221",
    "topic": "Second Class Citizen",
    "question": "Who wrote Second Class Citizen?",
    "options": [
      "John Osborne",
      "Wole Soyinka",
      "Emily BrontÃ«",
      "Buchi Emecheta"
    ],
    "answer": "Buchi Emecheta"
  },
  {
    "id": "LIT222",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: who wrote Second Class Citizen?",
    "options": [
      "John Osborne",
      "Wole Soyinka",
      "Emily BrontÃ«",
      "Buchi Emecheta"
    ],
    "answer": "Buchi Emecheta"
  },
  {
    "id": "LIT223",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning author?",
    "options": [
      "Buchi Emecheta",
      "Wole Soyinka",
      "John Osborne",
      "Emily BrontÃ«"
    ],
    "answer": "Buchi Emecheta"
  },
  {
    "id": "LIT224",
    "topic": "Second Class Citizen",
    "question": "Who is the central female character?",
    "options": [
      "Catherine",
      "Alison",
      "Sidi",
      "Adah"
    ],
    "answer": "Adah"
  },
  {
    "id": "LIT225",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: who is the central female character?",
    "options": [
      "Alison",
      "Sidi",
      "Adah",
      "Catherine"
    ],
    "answer": "Adah"
  },
  {
    "id": "LIT226",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning adah?",
    "options": [
      "Catherine",
      "Alison",
      "Adah",
      "Sidi"
    ],
    "answer": "Adah"
  },
  {
    "id": "LIT227",
    "topic": "Second Class Citizen",
    "question": "Who is Adah's husband?",
    "options": [
      "Francis",
      "Jimmy",
      "Cliff",
      "Baroka"
    ],
    "answer": "Francis"
  },
  {
    "id": "LIT228",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: who is Adah's husband?",
    "options": [
      "Baroka",
      "Cliff",
      "Jimmy",
      "Francis"
    ],
    "answer": "Francis"
  },
  {
    "id": "LIT229",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning francis?",
    "options": [
      "Francis",
      "Jimmy",
      "Cliff",
      "Baroka"
    ],
    "answer": "Francis"
  },
  {
    "id": "LIT230",
    "topic": "Second Class Citizen",
    "question": "Adah's early life is rooted in",
    "options": [
      "India",
      "Nigeria",
      "Scotland",
      "Ghana"
    ],
    "answer": "Nigeria"
  },
  {
    "id": "LIT231",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: adah's early life is rooted in",
    "options": [
      "Scotland",
      "Nigeria",
      "Ghana",
      "India"
    ],
    "answer": "Nigeria"
  },
  {
    "id": "LIT232",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning origin?",
    "options": [
      "India",
      "Nigeria",
      "Scotland",
      "Ghana"
    ],
    "answer": "Nigeria"
  },
  {
    "id": "LIT233",
    "topic": "Second Class Citizen",
    "question": "Adah's aspirations are strongly connected with",
    "options": [
      "Traditional leadership",
      "Farming",
      "Military service",
      "Education and professional independence"
    ],
    "answer": "Education and professional independence"
  },
  {
    "id": "LIT234",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: adah's aspirations are strongly connected with",
    "options": [
      "Military service",
      "Education and professional independence",
      "Traditional leadership",
      "Farming"
    ],
    "answer": "Education and professional independence"
  },
  {
    "id": "LIT235",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning dream?",
    "options": [
      "Military service",
      "Traditional leadership",
      "Education and professional independence",
      "Farming"
    ],
    "answer": "Education and professional independence"
  },
  {
    "id": "LIT236",
    "topic": "Second Class Citizen",
    "question": "Adah's migration exposes her to",
    "options": [
      "Military promotion",
      "Royal privilege",
      "Racism and social discrimination",
      "Political office"
    ],
    "answer": "Racism and social discrimination"
  },
  {
    "id": "LIT237",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: adah's migration exposes her to",
    "options": [
      "Royal privilege",
      "Military promotion",
      "Racism and social discrimination",
      "Political office"
    ],
    "answer": "Racism and social discrimination"
  },
  {
    "id": "LIT238",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning britain?",
    "options": [
      "Military promotion",
      "Political office",
      "Royal privilege",
      "Racism and social discrimination"
    ],
    "answer": "Racism and social discrimination"
  },
  {
    "id": "LIT239",
    "topic": "Second Class Citizen",
    "question": "The title refers to being treated as",
    "options": [
      "Wealthy",
      "Socially inferior",
      "Politically powerful",
      "Academically superior"
    ],
    "answer": "Socially inferior"
  },
  {
    "id": "LIT240",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: the title refers to being treated as",
    "options": [
      "Wealthy",
      "Socially inferior",
      "Academically superior",
      "Politically powerful"
    ],
    "answer": "Socially inferior"
  },
  {
    "id": "LIT241",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning title?",
    "options": [
      "Socially inferior",
      "Academically superior",
      "Politically powerful",
      "Wealthy"
    ],
    "answer": "Socially inferior"
  },
  {
    "id": "LIT242",
    "topic": "Second Class Citizen",
    "question": "Francis's treatment of Adah reflects",
    "options": [
      "Gender liberation",
      "Political neutrality",
      "Complete equality",
      "Patriarchal control"
    ],
    "answer": "Patriarchal control"
  },
  {
    "id": "LIT243",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: francis's treatment of Adah reflects",
    "options": [
      "Political neutrality",
      "Complete equality",
      "Gender liberation",
      "Patriarchal control"
    ],
    "answer": "Patriarchal control"
  },
  {
    "id": "LIT244",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning patriarchy?",
    "options": [
      "Political neutrality",
      "Gender liberation",
      "Complete equality",
      "Patriarchal control"
    ],
    "answer": "Patriarchal control"
  },
  {
    "id": "LIT245",
    "topic": "Second Class Citizen",
    "question": "Adah is chiefly characterized by",
    "options": [
      "Indifference",
      "Passivity",
      "Cowardice",
      "Resilience and ambition"
    ],
    "answer": "Resilience and ambition"
  },
  {
    "id": "LIT246",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: adah is chiefly characterized by",
    "options": [
      "Cowardice",
      "Passivity",
      "Resilience and ambition",
      "Indifference"
    ],
    "answer": "Resilience and ambition"
  },
  {
    "id": "LIT247",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning resilience?",
    "options": [
      "Resilience and ambition",
      "Passivity",
      "Cowardice",
      "Indifference"
    ],
    "answer": "Resilience and ambition"
  },
  {
    "id": "LIT248",
    "topic": "Second Class Citizen",
    "question": "A major theme is",
    "options": [
      "Identity and belonging",
      "Scientific discovery",
      "Space travel",
      "Military warfare"
    ],
    "answer": "Identity and belonging"
  },
  {
    "id": "LIT249",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: a major theme is",
    "options": [
      "Space travel",
      "Military warfare",
      "Scientific discovery",
      "Identity and belonging"
    ],
    "answer": "Identity and belonging"
  },
  {
    "id": "LIT250",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning identity?",
    "options": [
      "Military warfare",
      "Scientific discovery",
      "Identity and belonging",
      "Space travel"
    ],
    "answer": "Identity and belonging"
  },
  {
    "id": "LIT251",
    "topic": "Second Class Citizen",
    "question": "The novel strongly examines",
    "options": [
      "Poetic meter",
      "Gender inequality",
      "Astronomy",
      "Stage dÃ©cor"
    ],
    "answer": "Gender inequality"
  },
  {
    "id": "LIT252",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: the novel strongly examines",
    "options": [
      "Stage dÃ©cor",
      "Poetic meter",
      "Gender inequality",
      "Astronomy"
    ],
    "answer": "Gender inequality"
  },
  {
    "id": "LIT253",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning gender?",
    "options": [
      "Astronomy",
      "Stage dÃ©cor",
      "Gender inequality",
      "Poetic meter"
    ],
    "answer": "Gender inequality"
  },
  {
    "id": "LIT254",
    "topic": "Second Class Citizen",
    "question": "Another major concern is",
    "options": [
      "Courtly love",
      "Racism",
      "Epic heroism",
      "Ancient mythology"
    ],
    "answer": "Racism"
  },
  {
    "id": "LIT255",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: another major concern is",
    "options": [
      "Racism",
      "Epic heroism",
      "Courtly love",
      "Ancient mythology"
    ],
    "answer": "Racism"
  },
  {
    "id": "LIT256",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning race?",
    "options": [
      "Racism",
      "Ancient mythology",
      "Courtly love",
      "Epic heroism"
    ],
    "answer": "Racism"
  },
  {
    "id": "LIT257",
    "topic": "Second Class Citizen",
    "question": "Migration changes Adah's understanding of",
    "options": [
      "Stage movement",
      "Military strategy",
      "Poetic rhyme",
      "Identity and social status"
    ],
    "answer": "Identity and social status"
  },
  {
    "id": "LIT258",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: migration changes Adah's understanding of",
    "options": [
      "Stage movement",
      "Identity and social status",
      "Poetic rhyme",
      "Military strategy"
    ],
    "answer": "Identity and social status"
  },
  {
    "id": "LIT259",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning migration?",
    "options": [
      "Stage movement",
      "Poetic rhyme",
      "Identity and social status",
      "Military strategy"
    ],
    "answer": "Identity and social status"
  },
  {
    "id": "LIT260",
    "topic": "Second Class Citizen",
    "question": "Education functions for Adah as a means of",
    "options": [
      "Political imprisonment",
      "Self-development and independence",
      "Military conquest",
      "Traditional authority"
    ],
    "answer": "Self-development and independence"
  },
  {
    "id": "LIT261",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: education functions for Adah as a means of",
    "options": [
      "Self-development and independence",
      "Military conquest",
      "Political imprisonment",
      "Traditional authority"
    ],
    "answer": "Self-development and independence"
  },
  {
    "id": "LIT262",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning education?",
    "options": [
      "Political imprisonment",
      "Traditional authority",
      "Self-development and independence",
      "Military conquest"
    ],
    "answer": "Self-development and independence"
  },
  {
    "id": "LIT263",
    "topic": "Second Class Citizen",
    "question": "Motherhood in the novel is linked with",
    "options": [
      "Royal succession",
      "Political campaigning",
      "Responsibility and sacrifice",
      "Military rank"
    ],
    "answer": "Responsibility and sacrifice"
  },
  {
    "id": "LIT264",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: motherhood in the novel is linked with",
    "options": [
      "Royal succession",
      "Responsibility and sacrifice",
      "Military rank",
      "Political campaigning"
    ],
    "answer": "Responsibility and sacrifice"
  },
  {
    "id": "LIT265",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning family?",
    "options": [
      "Military rank",
      "Political campaigning",
      "Responsibility and sacrifice",
      "Royal succession"
    ],
    "answer": "Responsibility and sacrifice"
  },
  {
    "id": "LIT266",
    "topic": "Second Class Citizen",
    "question": "The novel's social realism comes from its",
    "options": [
      "Mythical heroes",
      "Supernatural creatures",
      "Epic battles",
      "Treatment of everyday family and immigrant struggles"
    ],
    "answer": "Treatment of everyday family and immigrant struggles"
  },
  {
    "id": "LIT267",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: the novel's social realism comes from its",
    "options": [
      "Treatment of everyday family and immigrant struggles",
      "Mythical heroes",
      "Supernatural creatures",
      "Epic battles"
    ],
    "answer": "Treatment of everyday family and immigrant struggles"
  },
  {
    "id": "LIT268",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning realism?",
    "options": [
      "Treatment of everyday family and immigrant struggles",
      "Supernatural creatures",
      "Mythical heroes",
      "Epic battles"
    ],
    "answer": "Treatment of everyday family and immigrant struggles"
  },
  {
    "id": "LIT269",
    "topic": "Second Class Citizen",
    "question": "Adah's conflict with Francis is partly over",
    "options": [
      "Astronomy",
      "Sports",
      "Agriculture",
      "Control and personal freedom"
    ],
    "answer": "Control and personal freedom"
  },
  {
    "id": "LIT270",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: adah's conflict with Francis is partly over",
    "options": [
      "Control and personal freedom",
      "Astronomy",
      "Agriculture",
      "Sports"
    ],
    "answer": "Control and personal freedom"
  },
  {
    "id": "LIT271",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning conflict?",
    "options": [
      "Astronomy",
      "Control and personal freedom",
      "Sports",
      "Agriculture"
    ],
    "answer": "Control and personal freedom"
  },
  {
    "id": "LIT272",
    "topic": "Second Class Citizen",
    "question": "The title also reflects the experience of",
    "options": [
      "Village chiefs",
      "Military officers",
      "Immigrants facing social marginalization",
      "Royal families"
    ],
    "answer": "Immigrants facing social marginalization"
  },
  {
    "id": "LIT273",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: the title also reflects the experience of",
    "options": [
      "Immigrants facing social marginalization",
      "Village chiefs",
      "Royal families",
      "Military officers"
    ],
    "answer": "Immigrants facing social marginalization"
  },
  {
    "id": "LIT274",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning class?",
    "options": [
      "Immigrants facing social marginalization",
      "Village chiefs",
      "Military officers",
      "Royal families"
    ],
    "answer": "Immigrants facing social marginalization"
  },
  {
    "id": "LIT275",
    "topic": "Second Class Citizen",
    "question": "Adah's persistence demonstrates",
    "options": [
      "Complete helplessness",
      "Traditional rule",
      "Political power",
      "Personal agency under difficult conditions"
    ],
    "answer": "Personal agency under difficult conditions"
  },
  {
    "id": "LIT276",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: adah's persistence demonstrates",
    "options": [
      "Complete helplessness",
      "Traditional rule",
      "Political power",
      "Personal agency under difficult conditions"
    ],
    "answer": "Personal agency under difficult conditions"
  },
  {
    "id": "LIT277",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning agency?",
    "options": [
      "Personal agency under difficult conditions",
      "Traditional rule",
      "Political power",
      "Complete helplessness"
    ],
    "answer": "Personal agency under difficult conditions"
  },
  {
    "id": "LIT278",
    "topic": "Second Class Citizen",
    "question": "The novel links personal oppression with",
    "options": [
      "Epic conventions",
      "Poetic rhyme",
      "Wider social structures",
      "Stage dÃ©cor"
    ],
    "answer": "Wider social structures"
  },
  {
    "id": "LIT279",
    "topic": "Second Class Citizen",
    "question": "In Second Class Citizen, which option is correctly associated with the following description: the novel links personal oppression with",
    "options": [
      "Stage dÃ©cor",
      "Epic conventions",
      "Poetic rhyme",
      "Wider social structures"
    ],
    "answer": "Wider social structures"
  },
  {
    "id": "LIT280",
    "topic": "Second Class Citizen",
    "question": "Which statement about Second Class Citizen is correct concerning society?",
    "options": [
      "Epic conventions",
      "Stage dÃ©cor",
      "Wider social structures",
      "Poetic rhyme"
    ],
    "answer": "Wider social structures"
  },
  {
    "id": "LIT281",
    "topic": "Unexpected Joy at Dawn",
    "question": "Who wrote Unexpected Joy at Dawn?",
    "options": [
      "John Osborne",
      "Alex Agyei-Agyiri",
      "Buchi Emecheta",
      "Wole Soyinka"
    ],
    "answer": "Alex Agyei-Agyiri"
  },
  {
    "id": "LIT282",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: who wrote Unexpected Joy at Dawn?",
    "options": [
      "John Osborne",
      "Alex Agyei-Agyiri",
      "Buchi Emecheta",
      "Wole Soyinka"
    ],
    "answer": "Alex Agyei-Agyiri"
  },
  {
    "id": "LIT283",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning author?",
    "options": [
      "Alex Agyei-Agyiri",
      "Wole Soyinka",
      "Buchi Emecheta",
      "John Osborne"
    ],
    "answer": "Alex Agyei-Agyiri"
  },
  {
    "id": "LIT284",
    "topic": "Unexpected Joy at Dawn",
    "question": "The novel is set mainly across",
    "options": [
      "Ghana and Nigeria",
      "India and Pakistan",
      "England and Scotland",
      "Kenya and Uganda"
    ],
    "answer": "Ghana and Nigeria"
  },
  {
    "id": "LIT285",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the novel is set mainly across",
    "options": [
      "Kenya and Uganda",
      "England and Scotland",
      "India and Pakistan",
      "Ghana and Nigeria"
    ],
    "answer": "Ghana and Nigeria"
  },
  {
    "id": "LIT286",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning setting?",
    "options": [
      "Kenya and Uganda",
      "India and Pakistan",
      "England and Scotland",
      "Ghana and Nigeria"
    ],
    "answer": "Ghana and Nigeria"
  },
  {
    "id": "LIT287",
    "topic": "Unexpected Joy at Dawn",
    "question": "The work explores the effects of",
    "options": [
      "Space travel",
      "Political and economic crisis",
      "Royal succession",
      "Medieval warfare"
    ],
    "answer": "Political and economic crisis"
  },
  {
    "id": "LIT288",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the work explores the effects of",
    "options": [
      "Medieval warfare",
      "Space travel",
      "Royal succession",
      "Political and economic crisis"
    ],
    "answer": "Political and economic crisis"
  },
  {
    "id": "LIT289",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning context?",
    "options": [
      "Royal succession",
      "Space travel",
      "Political and economic crisis",
      "Medieval warfare"
    ],
    "answer": "Political and economic crisis"
  },
  {
    "id": "LIT290",
    "topic": "Unexpected Joy at Dawn",
    "question": "A major concern is",
    "options": [
      "Poetic meter",
      "Identity and displacement",
      "Ancient mythology",
      "Stage comedy"
    ],
    "answer": "Identity and displacement"
  },
  {
    "id": "LIT291",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: a major concern is",
    "options": [
      "Stage comedy",
      "Identity and displacement",
      "Ancient mythology",
      "Poetic meter"
    ],
    "answer": "Identity and displacement"
  },
  {
    "id": "LIT292",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning identity?",
    "options": [
      "Poetic meter",
      "Identity and displacement",
      "Stage comedy",
      "Ancient mythology"
    ],
    "answer": "Identity and displacement"
  },
  {
    "id": "LIT293",
    "topic": "Unexpected Joy at Dawn",
    "question": "The border setting highlights",
    "options": [
      "Migration and identity",
      "A battlefield",
      "A royal court",
      "A school campus"
    ],
    "answer": "Migration and identity"
  },
  {
    "id": "LIT294",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the border setting highlights",
    "options": [
      "A royal court",
      "A school campus",
      "Migration and identity",
      "A battlefield"
    ],
    "answer": "Migration and identity"
  },
  {
    "id": "LIT295",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning border?",
    "options": [
      "A royal court",
      "A school campus",
      "Migration and identity",
      "A battlefield"
    ],
    "answer": "Migration and identity"
  },
  {
    "id": "LIT296",
    "topic": "Unexpected Joy at Dawn",
    "question": "The title suggests that joy can emerge",
    "options": [
      "From military victory",
      "Only through wealth",
      "Before conflict",
      "Unexpectedly after hardship"
    ],
    "answer": "Unexpectedly after hardship"
  },
  {
    "id": "LIT297",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the title suggests that joy can emerge",
    "options": [
      "Before conflict",
      "From military victory",
      "Unexpectedly after hardship",
      "Only through wealth"
    ],
    "answer": "Unexpectedly after hardship"
  },
  {
    "id": "LIT298",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning title?",
    "options": [
      "From military victory",
      "Unexpectedly after hardship",
      "Only through wealth",
      "Before conflict"
    ],
    "answer": "Unexpectedly after hardship"
  },
  {
    "id": "LIT299",
    "topic": "Unexpected Joy at Dawn",
    "question": "The novel reflects",
    "options": [
      "Ancient Greece",
      "Postcolonial West African society",
      "Medieval Scotland",
      "Victorian court life"
    ],
    "answer": "Postcolonial West African society"
  },
  {
    "id": "LIT300",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the novel reflects",
    "options": [
      "Postcolonial West African society",
      "Victorian court life",
      "Ancient Greece",
      "Medieval Scotland"
    ],
    "answer": "Postcolonial West African society"
  },
  {
    "id": "LIT301",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning society?",
    "options": [
      "Ancient Greece",
      "Medieval Scotland",
      "Victorian court life",
      "Postcolonial West African society"
    ],
    "answer": "Postcolonial West African society"
  },
  {
    "id": "LIT302",
    "topic": "Unexpected Joy at Dawn",
    "question": "Economic hardship contributes to",
    "options": [
      "Academic certainty",
      "Social vulnerability",
      "Military promotion",
      "Royal privilege"
    ],
    "answer": "Social vulnerability"
  },
  {
    "id": "LIT303",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: economic hardship contributes to",
    "options": [
      "Military promotion",
      "Royal privilege",
      "Academic certainty",
      "Social vulnerability"
    ],
    "answer": "Social vulnerability"
  },
  {
    "id": "LIT304",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning economy?",
    "options": [
      "Military promotion",
      "Social vulnerability",
      "Academic certainty",
      "Royal privilege"
    ],
    "answer": "Social vulnerability"
  },
  {
    "id": "LIT305",
    "topic": "Unexpected Joy at Dawn",
    "question": "The novel raises questions about",
    "options": [
      "Poetic rhyme",
      "Where people belong",
      "Scientific discovery",
      "Stage lighting"
    ],
    "answer": "Where people belong"
  },
  {
    "id": "LIT306",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the novel raises questions about",
    "options": [
      "Where people belong",
      "Scientific discovery",
      "Stage lighting",
      "Poetic rhyme"
    ],
    "answer": "Where people belong"
  },
  {
    "id": "LIT307",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning belonging?",
    "options": [
      "Scientific discovery",
      "Poetic rhyme",
      "Where people belong",
      "Stage lighting"
    ],
    "answer": "Where people belong"
  },
  {
    "id": "LIT308",
    "topic": "Unexpected Joy at Dawn",
    "question": "A major thematic contrast is between",
    "options": [
      "Meter and rhyme",
      "Comedy and farce",
      "Prose and drama",
      "Despair and hope"
    ],
    "answer": "Despair and hope"
  },
  {
    "id": "LIT309",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: a major thematic contrast is between",
    "options": [
      "Prose and drama",
      "Comedy and farce",
      "Meter and rhyme",
      "Despair and hope"
    ],
    "answer": "Despair and hope"
  },
  {
    "id": "LIT310",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning hope?",
    "options": [
      "Despair and hope",
      "Comedy and farce",
      "Prose and drama",
      "Meter and rhyme"
    ],
    "answer": "Despair and hope"
  },
  {
    "id": "LIT311",
    "topic": "Unexpected Joy at Dawn",
    "question": "Political events affect characters by",
    "options": [
      "Ending migration",
      "Shaping their opportunities and security",
      "Guaranteeing wealth",
      "Removing all conflict"
    ],
    "answer": "Shaping their opportunities and security"
  },
  {
    "id": "LIT312",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: political events affect characters by",
    "options": [
      "Ending migration",
      "Guaranteeing wealth",
      "Removing all conflict",
      "Shaping their opportunities and security"
    ],
    "answer": "Shaping their opportunities and security"
  },
  {
    "id": "LIT313",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning politics?",
    "options": [
      "Shaping their opportunities and security",
      "Guaranteeing wealth",
      "Ending migration",
      "Removing all conflict"
    ],
    "answer": "Shaping their opportunities and security"
  },
  {
    "id": "LIT314",
    "topic": "Unexpected Joy at Dawn",
    "question": "Nationality becomes complicated when",
    "options": [
      "Characters dance",
      "Poems rhyme",
      "A play has scenes",
      "Lives cross political borders"
    ],
    "answer": "Lives cross political borders"
  },
  {
    "id": "LIT315",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: nationality becomes complicated when",
    "options": [
      "Characters dance",
      "Lives cross political borders",
      "Poems rhyme",
      "A play has scenes"
    ],
    "answer": "Lives cross political borders"
  },
  {
    "id": "LIT316",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning nationality?",
    "options": [
      "Poems rhyme",
      "Lives cross political borders",
      "Characters dance",
      "A play has scenes"
    ],
    "answer": "Lives cross political borders"
  },
  {
    "id": "LIT317",
    "topic": "Unexpected Joy at Dawn",
    "question": "A major social issue is",
    "options": [
      "Theatre architecture",
      "Epic meter",
      "Sonnet form",
      "Displacement"
    ],
    "answer": "Displacement"
  },
  {
    "id": "LIT318",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: a major social issue is",
    "options": [
      "Epic meter",
      "Displacement",
      "Theatre architecture",
      "Sonnet form"
    ],
    "answer": "Displacement"
  },
  {
    "id": "LIT319",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning displacement?",
    "options": [
      "Displacement",
      "Sonnet form",
      "Theatre architecture",
      "Epic meter"
    ],
    "answer": "Displacement"
  },
  {
    "id": "LIT320",
    "topic": "Unexpected Joy at Dawn",
    "question": "Social realism appears through attention to",
    "options": [
      "Superheroes",
      "Mythical creatures",
      "Magic",
      "Everyday economic and political pressures"
    ],
    "answer": "Everyday economic and political pressures"
  },
  {
    "id": "LIT321",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: social realism appears through attention to",
    "options": [
      "Superheroes",
      "Mythical creatures",
      "Everyday economic and political pressures",
      "Magic"
    ],
    "answer": "Everyday economic and political pressures"
  },
  {
    "id": "LIT322",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning realism?",
    "options": [
      "Magic",
      "Superheroes",
      "Mythical creatures",
      "Everyday economic and political pressures"
    ],
    "answer": "Everyday economic and political pressures"
  },
  {
    "id": "LIT323",
    "topic": "Unexpected Joy at Dawn",
    "question": "The narrative emphasizes",
    "options": [
      "Political apathy",
      "Scientific certainty",
      "Human resilience",
      "Royal luxury"
    ],
    "answer": "Human resilience"
  },
  {
    "id": "LIT324",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the narrative emphasizes",
    "options": [
      "Scientific certainty",
      "Political apathy",
      "Royal luxury",
      "Human resilience"
    ],
    "answer": "Human resilience"
  },
  {
    "id": "LIT325",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning resilience?",
    "options": [
      "Scientific certainty",
      "Human resilience",
      "Political apathy",
      "Royal luxury"
    ],
    "answer": "Human resilience"
  },
  {
    "id": "LIT326",
    "topic": "Unexpected Joy at Dawn",
    "question": "The setting connects",
    "options": [
      "Stage costumes with actors",
      "Science with mathematics",
      "Private lives with political events",
      "Only poems with rhyme"
    ],
    "answer": "Private lives with political events"
  },
  {
    "id": "LIT327",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the setting connects",
    "options": [
      "Stage costumes with actors",
      "Only poems with rhyme",
      "Private lives with political events",
      "Science with mathematics"
    ],
    "answer": "Private lives with political events"
  },
  {
    "id": "LIT328",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning settingrole?",
    "options": [
      "Only poems with rhyme",
      "Stage costumes with actors",
      "Private lives with political events",
      "Science with mathematics"
    ],
    "answer": "Private lives with political events"
  },
  {
    "id": "LIT329",
    "topic": "Unexpected Joy at Dawn",
    "question": "Migration affects",
    "options": [
      "Stage dÃ©cor",
      "Meter",
      "Rhyme",
      "Identity and relationships"
    ],
    "answer": "Identity and relationships"
  },
  {
    "id": "LIT330",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: migration affects",
    "options": [
      "Stage dÃ©cor",
      "Identity and relationships",
      "Meter",
      "Rhyme"
    ],
    "answer": "Identity and relationships"
  },
  {
    "id": "LIT331",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning migration?",
    "options": [
      "Rhyme",
      "Identity and relationships",
      "Stage dÃ©cor",
      "Meter"
    ],
    "answer": "Identity and relationships"
  },
  {
    "id": "LIT332",
    "topic": "Unexpected Joy at Dawn",
    "question": "The work highlights the human cost of",
    "options": [
      "Political and economic instability",
      "Theatre rehearsal",
      "Poetic meter",
      "Literary criticism"
    ],
    "answer": "Political and economic instability"
  },
  {
    "id": "LIT333",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the work highlights the human cost of",
    "options": [
      "Theatre rehearsal",
      "Political and economic instability",
      "Literary criticism",
      "Poetic meter"
    ],
    "answer": "Political and economic instability"
  },
  {
    "id": "LIT334",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning politicalcost?",
    "options": [
      "Political and economic instability",
      "Poetic meter",
      "Literary criticism",
      "Theatre rehearsal"
    ],
    "answer": "Political and economic instability"
  },
  {
    "id": "LIT335",
    "topic": "Unexpected Joy at Dawn",
    "question": "The positive word 'Joy' contrasts with",
    "options": [
      "The hardships faced by characters",
      "The use of rhyme",
      "The use of dialogue",
      "A school setting"
    ],
    "answer": "The hardships faced by characters"
  },
  {
    "id": "LIT336",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: the positive word 'Joy' contrasts with",
    "options": [
      "A school setting",
      "The use of dialogue",
      "The use of rhyme",
      "The hardships faced by characters"
    ],
    "answer": "The hardships faced by characters"
  },
  {
    "id": "LIT337",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning titlecontrast?",
    "options": [
      "A school setting",
      "The use of dialogue",
      "The hardships faced by characters",
      "The use of rhyme"
    ],
    "answer": "The hardships faced by characters"
  },
  {
    "id": "LIT338",
    "topic": "Unexpected Joy at Dawn",
    "question": "Citizenship is relevant through the theme of",
    "options": [
      "Poetic rhyme",
      "Stage movement",
      "Musical tempo",
      "National belonging"
    ],
    "answer": "National belonging"
  },
  {
    "id": "LIT339",
    "topic": "Unexpected Joy at Dawn",
    "question": "In Unexpected Joy at Dawn, which option is correctly associated with the following description: citizenship is relevant through the theme of",
    "options": [
      "Poetic rhyme",
      "Musical tempo",
      "National belonging",
      "Stage movement"
    ],
    "answer": "National belonging"
  },
  {
    "id": "LIT340",
    "topic": "Unexpected Joy at Dawn",
    "question": "Which statement about Unexpected Joy at Dawn is correct concerning citizenship?",
    "options": [
      "National belonging",
      "Musical tempo",
      "Stage movement",
      "Poetic rhyme"
    ],
    "answer": "National belonging"
  },
  {
    "id": "LIT341",
    "topic": "Wuthering Heights",
    "question": "Who wrote Wuthering Heights?",
    "options": [
      "Emily BrontÃ«",
      "Buchi Emecheta",
      "John Osborne",
      "Wole Soyinka"
    ],
    "answer": "Emily BrontÃ«"
  },
  {
    "id": "LIT342",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: who wrote Wuthering Heights?",
    "options": [
      "Buchi Emecheta",
      "John Osborne",
      "Emily BrontÃ«",
      "Wole Soyinka"
    ],
    "answer": "Emily BrontÃ«"
  },
  {
    "id": "LIT343",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning author?",
    "options": [
      "John Osborne",
      "Wole Soyinka",
      "Emily BrontÃ«",
      "Buchi Emecheta"
    ],
    "answer": "Emily BrontÃ«"
  },
  {
    "id": "LIT344",
    "topic": "Wuthering Heights",
    "question": "Who is Catherine's intense childhood companion?",
    "options": [
      "Lockwood",
      "Hareton",
      "Heathcliff",
      "Edgar Linton"
    ],
    "answer": "Heathcliff"
  },
  {
    "id": "LIT345",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: who is Catherine's intense childhood companion?",
    "options": [
      "Lockwood",
      "Heathcliff",
      "Edgar Linton",
      "Hareton"
    ],
    "answer": "Heathcliff"
  },
  {
    "id": "LIT346",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning heathcliff?",
    "options": [
      "Edgar Linton",
      "Hareton",
      "Heathcliff",
      "Lockwood"
    ],
    "answer": "Heathcliff"
  },
  {
    "id": "LIT347",
    "topic": "Wuthering Heights",
    "question": "Who is the central female character connected to Heathcliff?",
    "options": [
      "Young Cathy",
      "Nelly Dean",
      "Catherine Earnshaw",
      "Isabella"
    ],
    "answer": "Catherine Earnshaw"
  },
  {
    "id": "LIT348",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: who is the central female character connected to Heathcliff?",
    "options": [
      "Isabella",
      "Nelly Dean",
      "Catherine Earnshaw",
      "Young Cathy"
    ],
    "answer": "Catherine Earnshaw"
  },
  {
    "id": "LIT349",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning catherine?",
    "options": [
      "Isabella",
      "Young Cathy",
      "Nelly Dean",
      "Catherine Earnshaw"
    ],
    "answer": "Catherine Earnshaw"
  },
  {
    "id": "LIT350",
    "topic": "Wuthering Heights",
    "question": "Who marries Catherine Earnshaw?",
    "options": [
      "Hareton",
      "Edgar Linton",
      "Lockwood",
      "Heathcliff"
    ],
    "answer": "Edgar Linton"
  },
  {
    "id": "LIT351",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: who marries Catherine Earnshaw?",
    "options": [
      "Edgar Linton",
      "Lockwood",
      "Hareton",
      "Heathcliff"
    ],
    "answer": "Edgar Linton"
  },
  {
    "id": "LIT352",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning edgar?",
    "options": [
      "Hareton",
      "Heathcliff",
      "Edgar Linton",
      "Lockwood"
    ],
    "answer": "Edgar Linton"
  },
  {
    "id": "LIT353",
    "topic": "Wuthering Heights",
    "question": "Who is an important narrator within the story?",
    "options": [
      "Joseph",
      "Nelly Dean",
      "Young Cathy",
      "Isabella"
    ],
    "answer": "Nelly Dean"
  },
  {
    "id": "LIT354",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: who is an important narrator within the story?",
    "options": [
      "Nelly Dean",
      "Young Cathy",
      "Joseph",
      "Isabella"
    ],
    "answer": "Nelly Dean"
  },
  {
    "id": "LIT355",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning nelly?",
    "options": [
      "Young Cathy",
      "Joseph",
      "Nelly Dean",
      "Isabella"
    ],
    "answer": "Nelly Dean"
  },
  {
    "id": "LIT356",
    "topic": "Wuthering Heights",
    "question": "Who is the outsider who begins the framed narrative?",
    "options": [
      "Heathcliff",
      "Hareton",
      "Edgar",
      "Lockwood"
    ],
    "answer": "Lockwood"
  },
  {
    "id": "LIT357",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: who is the outsider who begins the framed narrative?",
    "options": [
      "Heathcliff",
      "Lockwood",
      "Hareton",
      "Edgar"
    ],
    "answer": "Lockwood"
  },
  {
    "id": "LIT358",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning lockwood?",
    "options": [
      "Hareton",
      "Lockwood",
      "Edgar",
      "Heathcliff"
    ],
    "answer": "Lockwood"
  },
  {
    "id": "LIT359",
    "topic": "Wuthering Heights",
    "question": "The novel is mainly set in",
    "options": [
      "Yorkshire, England",
      "Scotland",
      "Nigeria",
      "London"
    ],
    "answer": "Yorkshire, England"
  },
  {
    "id": "LIT360",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: the novel is mainly set in",
    "options": [
      "Nigeria",
      "London",
      "Scotland",
      "Yorkshire, England"
    ],
    "answer": "Yorkshire, England"
  },
  {
    "id": "LIT361",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning setting?",
    "options": [
      "Yorkshire, England",
      "London",
      "Nigeria",
      "Scotland"
    ],
    "answer": "Yorkshire, England"
  },
  {
    "id": "LIT362",
    "topic": "Wuthering Heights",
    "question": "The two principal houses are",
    "options": [
      "Wuthering Hall and Red House",
      "Pemberley and Thornfield",
      "Highgate and Grange End",
      "Wuthering Heights and Thrushcross Grange"
    ],
    "answer": "Wuthering Heights and Thrushcross Grange"
  },
  {
    "id": "LIT363",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: the two principal houses are",
    "options": [
      "Pemberley and Thornfield",
      "Wuthering Heights and Thrushcross Grange",
      "Highgate and Grange End",
      "Wuthering Hall and Red House"
    ],
    "answer": "Wuthering Heights and Thrushcross Grange"
  },
  {
    "id": "LIT364",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning houses?",
    "options": [
      "Pemberley and Thornfield",
      "Wuthering Heights and Thrushcross Grange",
      "Wuthering Hall and Red House",
      "Highgate and Grange End"
    ],
    "answer": "Wuthering Heights and Thrushcross Grange"
  },
  {
    "id": "LIT365",
    "topic": "Wuthering Heights",
    "question": "Catherine's marriage to Edgar is influenced by",
    "options": [
      "Political office",
      "Military duty",
      "Religious law",
      "Social status and security"
    ],
    "answer": "Social status and security"
  },
  {
    "id": "LIT366",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: catherine's marriage to Edgar is influenced by",
    "options": [
      "Political office",
      "Social status and security",
      "Military duty",
      "Religious law"
    ],
    "answer": "Social status and security"
  },
  {
    "id": "LIT367",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning class?",
    "options": [
      "Military duty",
      "Political office",
      "Social status and security",
      "Religious law"
    ],
    "answer": "Social status and security"
  },
  {
    "id": "LIT368",
    "topic": "Wuthering Heights",
    "question": "A major motive driving Heathcliff is",
    "options": [
      "Charity",
      "Religious conversion",
      "Political ambition",
      "Revenge"
    ],
    "answer": "Revenge"
  },
  {
    "id": "LIT369",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: a major motive driving Heathcliff is",
    "options": [
      "Political ambition",
      "Revenge",
      "Charity",
      "Religious conversion"
    ],
    "answer": "Revenge"
  },
  {
    "id": "LIT370",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning revenge?",
    "options": [
      "Charity",
      "Religious conversion",
      "Political ambition",
      "Revenge"
    ],
    "answer": "Revenge"
  },
  {
    "id": "LIT371",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: a major theme is",
    "options": [
      "Economic theory",
      "Electoral politics",
      "Colonial administration",
      "Love and obsession"
    ],
    "answer": "Love and obsession"
  },
  {
    "id": "LIT372",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning love?",
    "options": [
      "Love and obsession",
      "Electoral politics",
      "Economic theory",
      "Colonial administration"
    ],
    "answer": "Love and obsession"
  },
  {
    "id": "LIT373",
    "topic": "Wuthering Heights",
    "question": "The moors symbolize",
    "options": [
      "Urban order",
      "Freedom, wildness and emotional intensity",
      "Scientific progress",
      "Political bureaucracy"
    ],
    "answer": "Freedom, wildness and emotional intensity"
  },
  {
    "id": "LIT374",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: the moors symbolize",
    "options": [
      "Urban order",
      "Political bureaucracy",
      "Freedom, wildness and emotional intensity",
      "Scientific progress"
    ],
    "answer": "Freedom, wildness and emotional intensity"
  },
  {
    "id": "LIT375",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning moors?",
    "options": [
      "Urban order",
      "Freedom, wildness and emotional intensity",
      "Political bureaucracy",
      "Scientific progress"
    ],
    "answer": "Freedom, wildness and emotional intensity"
  },
  {
    "id": "LIT376",
    "topic": "Wuthering Heights",
    "question": "The landscape contributes to the novel's",
    "options": [
      "Comic tone",
      "Gothic atmosphere",
      "Legal structure",
      "Political realism"
    ],
    "answer": "Gothic atmosphere"
  },
  {
    "id": "LIT377",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: the landscape contributes to the novel's",
    "options": [
      "Gothic atmosphere",
      "Legal structure",
      "Political realism",
      "Comic tone"
    ],
    "answer": "Gothic atmosphere"
  },
  {
    "id": "LIT378",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning gothic?",
    "options": [
      "Gothic atmosphere",
      "Political realism",
      "Legal structure",
      "Comic tone"
    ],
    "answer": "Gothic atmosphere"
  },
  {
    "id": "LIT379",
    "topic": "Wuthering Heights",
    "question": "The novel uses",
    "options": [
      "Multiple layers of narration",
      "Only poetry",
      "Only diary form",
      "Only dramatic dialogue"
    ],
    "answer": "Multiple layers of narration"
  },
  {
    "id": "LIT380",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: the novel uses",
    "options": [
      "Only poetry",
      "Multiple layers of narration",
      "Only dramatic dialogue",
      "Only diary form"
    ],
    "answer": "Multiple layers of narration"
  },
  {
    "id": "LIT381",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning narration?",
    "options": [
      "Only diary form",
      "Only poetry",
      "Only dramatic dialogue",
      "Multiple layers of narration"
    ],
    "answer": "Multiple layers of narration"
  },
  {
    "id": "LIT382",
    "topic": "Wuthering Heights",
    "question": "Heathcliff's treatment of Hareton shows",
    "options": [
      "Academic success",
      "Political reform",
      "Complete forgiveness",
      "A continuing cycle of revenge"
    ],
    "answer": "A continuing cycle of revenge"
  },
  {
    "id": "LIT383",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: heathcliff's treatment of Hareton shows",
    "options": [
      "Political reform",
      "Complete forgiveness",
      "Academic success",
      "A continuing cycle of revenge"
    ],
    "answer": "A continuing cycle of revenge"
  },
  {
    "id": "LIT384",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning revengecycle?",
    "options": [
      "A continuing cycle of revenge",
      "Academic success",
      "Political reform",
      "Complete forgiveness"
    ],
    "answer": "A continuing cycle of revenge"
  },
  {
    "id": "LIT385",
    "topic": "Wuthering Heights",
    "question": "Young Cathy and Hareton represent",
    "options": [
      "Permanent hatred",
      "Military conquest",
      "The possibility of reconciliation",
      "Political rebellion"
    ],
    "answer": "The possibility of reconciliation"
  },
  {
    "id": "LIT386",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: young Cathy and Hareton represent",
    "options": [
      "Military conquest",
      "Permanent hatred",
      "Political rebellion",
      "The possibility of reconciliation"
    ],
    "answer": "The possibility of reconciliation"
  },
  {
    "id": "LIT387",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning younggeneration?",
    "options": [
      "Military conquest",
      "Political rebellion",
      "The possibility of reconciliation",
      "Permanent hatred"
    ],
    "answer": "The possibility of reconciliation"
  },
  {
    "id": "LIT388",
    "topic": "Wuthering Heights",
    "question": "Heathcliff is best described as",
    "options": [
      "Politically neutral",
      "Completely comic",
      "Gentle and passive",
      "Passionate, vengeful and complex"
    ],
    "answer": "Passionate, vengeful and complex"
  },
  {
    "id": "LIT389",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: heathcliff is best described as",
    "options": [
      "Gentle and passive",
      "Politically neutral",
      "Passionate, vengeful and complex",
      "Completely comic"
    ],
    "answer": "Passionate, vengeful and complex"
  },
  {
    "id": "LIT390",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning heathcharacter?",
    "options": [
      "Passionate, vengeful and complex",
      "Politically neutral",
      "Gentle and passive",
      "Completely comic"
    ],
    "answer": "Passionate, vengeful and complex"
  },
  {
    "id": "LIT391",
    "topic": "Wuthering Heights",
    "question": "Catherine Earnshaw is portrayed as",
    "options": [
      "Politically ambitious",
      "Unemotional",
      "Passionate and conflicted",
      "Entirely submissive"
    ],
    "answer": "Passionate and conflicted"
  },
  {
    "id": "LIT392",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: catherine Earnshaw is portrayed as",
    "options": [
      "Unemotional",
      "Entirely submissive",
      "Politically ambitious",
      "Passionate and conflicted"
    ],
    "answer": "Passionate and conflicted"
  },
  {
    "id": "LIT393",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning catherinecharacter?",
    "options": [
      "Unemotional",
      "Politically ambitious",
      "Entirely submissive",
      "Passionate and conflicted"
    ],
    "answer": "Passionate and conflicted"
  },
  {
    "id": "LIT394",
    "topic": "Wuthering Heights",
    "question": "Edgar Linton represents",
    "options": [
      "Wild isolation",
      "Working-class rebellion",
      "Vengeance",
      "Social refinement and stability"
    ],
    "answer": "Social refinement and stability"
  },
  {
    "id": "LIT395",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: edgar Linton represents",
    "options": [
      "Vengeance",
      "Wild isolation",
      "Working-class rebellion",
      "Social refinement and stability"
    ],
    "answer": "Social refinement and stability"
  },
  {
    "id": "LIT396",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning edgarcharacter?",
    "options": [
      "Working-class rebellion",
      "Vengeance",
      "Social refinement and stability",
      "Wild isolation"
    ],
    "answer": "Social refinement and stability"
  },
  {
    "id": "LIT397",
    "topic": "Wuthering Heights",
    "question": "Gothic features include",
    "options": [
      "Courtroom realism",
      "Political speeches",
      "Scientific reports",
      "Dark atmosphere and supernatural suggestions"
    ],
    "answer": "Dark atmosphere and supernatural suggestions"
  },
  {
    "id": "LIT398",
    "topic": "Wuthering Heights",
    "question": "In Wuthering Heights, which option is correctly associated with the following description: gothic features include",
    "options": [
      "Scientific reports",
      "Political speeches",
      "Courtroom realism",
      "Dark atmosphere and supernatural suggestions"
    ],
    "answer": "Dark atmosphere and supernatural suggestions"
  },
  {
    "id": "LIT399",
    "topic": "Wuthering Heights",
    "question": "Which statement about Wuthering Heights is correct concerning gothicfeatures?",
    "options": [
      "Political speeches",
      "Courtroom realism",
      "Dark atmosphere and supernatural suggestions",
      "Scientific reports"
    ],
    "answer": "Dark atmosphere and supernatural suggestions"
  },
  {
    "id": "LIT400",
    "topic": "The Lion and the Jewel",
    "question": "Baroka's power also reflects",
    "options": [
      "Military democracy",
      "Scientific authority",
      "Parliamentary government",
      "Traditional patriarchal authority"
    ],
    "answer": "Traditional patriarchal authority"
  }

]
  };
  

  // ================= VARIABLES =================

  List<String> selectedSubjects = [];
  String activeSubject = "";

  Map<String, int> subjectIndex = {};
  Map<String, Map<int, int>> selectedAnswers = {};

  Map<String, int> subjectScores = {};
  int totalScore = 0;

  bool quizStarted = false;
  bool quizFinished = false;

  // ================= TIMER =================

  

  late int remainingSeconds;

  Timer? timer;

  // ================= START QUIZ =================

  void startQuiz() {
    if (selectedSubjects.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Select exactly 4 subjects")),
      );
      return;
    }

    for (String subject in selectedSubjects) {
      subjectIndex[subject] = 0;
      selectedAnswers[subject] = {};
      subjectScores[subject] = 0;
    }

    // START TIMER
    remainingSeconds = selectedMinutes * 60;

    startTimer();

    setState(() {
      quizStarted = true;
      quizFinished = false;
      activeSubject = selectedSubjects[0];
    });
  }

  // ================= TIMER FUNCTIONS =================

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (remainingSeconds > 0) {
          setState(() {
            remainingSeconds--;
          });
        } else {
          timer.cancel();

          submitQuiz();
        }
      },
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;

    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }

  // ================= SELECT ANSWER =================

  void selectAnswer(int optionIndex) {
    final qIndex = subjectIndex[activeSubject]!;

    selectedAnswers[activeSubject]![qIndex] = optionIndex;

    setState(() {});
  }

  // ================= NEXT =================

  void nextQuestion() {
    final maxIndex = questionBank[activeSubject]!.length - 1;

    if (subjectIndex[activeSubject]! < maxIndex) {
      setState(() {
        subjectIndex[activeSubject] =
            subjectIndex[activeSubject]! + 1;
      });
    }
  }

  // ================= PREVIOUS =================

  void previousQuestion() {
    if (subjectIndex[activeSubject]! > 0) {
      setState(() {
        subjectIndex[activeSubject] =
            subjectIndex[activeSubject]! - 1;
      });
    }
  }

  // ================= SUBMIT QUIZ =================

  void submitQuiz() {

    timer?.cancel();

    totalScore = 0;

    for (String subject in selectedSubjects) {
      int score = 0;

      final questions = questionBank[subject]!;

      for (int i = 0; i < questions.length; i++) {

        final correct = questions[i]["answer"];

        final userAnswer = selectedAnswers[subject]?[i];

        if (userAnswer != null && userAnswer == correct) {
          score++;
          totalScore++;
        }
      }

      subjectScores[subject] = score;
    }

    setState(() {
      quizStarted = false;
      quizFinished = true;
    });
  }

  // ================= BUILD =================

  @override
  Widget build(BuildContext context) {
    if (quizFinished) return resultScreen();
    if (!quizStarted) return startScreen();
    return quizBody();
  }

  // ================= START SCREEN =================

  Widget startScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
                ),
                (route) => false,
                );
          },),
        title: Text(
          "Select Subjects",
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 24,
          letterSpacing: 0.5, 
        ),),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 2,
        toolbarHeight: 70,
        
      ),
      body: Column(
        children: [

          const SizedBox(height: 20),

          Text("Selected: ${selectedSubjects.length}/4"),

          // ================= TIME SELECTION =================

          const SizedBox(height: 20),

          const Text(
            "Select Time",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          DropdownButton<int>(
  
  value: selectedMinutes,
  
  items: const [
    DropdownMenuItem(
      value: 20,
      child: Text("20 Minutes"),
    ),
    DropdownMenuItem(
      value: 40,
      child: Text("40 Minutes"),
    ),
    DropdownMenuItem(
      value: 60,
      child: Text("60 Minutes"),
    ),
    DropdownMenuItem(
      value: 80,
      child: Text("80 Minutes"),
    ),
    DropdownMenuItem(
      value: 120,
      child: Text("120 Minutes"),
    ),
  ],
  onChanged: (value) {
    setState(() {
      selectedMinutes = value!;
    });
  },
),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                subjectCard("Physics", Icons.science, Colors.blue),
                subjectCard("Chemistry", Icons.biotech, Colors.orange),
                subjectCard("Mathematics", Icons.calculate, Colors.purple),
                subjectCard("English", Icons.menu_book, Colors.red),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: startQuiz,
            child: const Text("Start Quiz"),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ================= SUBJECT CARD =================

  Widget subjectCard(
      String subject,
      IconData icon,
      Color color,
      ) {

    bool isSelected = selectedSubjects.contains(subject);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSubjects.remove(subject);
          } else if (selectedSubjects.length < 4) {
            selectedSubjects.add(subject);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),

            const SizedBox(height: 10),

            Text(
              subject,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // ================= QUIZ BODY =================

  Widget quizBody() {

    final question =
        questionBank[activeSubject]![subjectIndex[activeSubject]!];

    final total = questionBank[activeSubject]!.length;

    final current = subjectIndex[activeSubject]! + 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        backgroundColor: Colors.green,

        actions: [

          // ================= TIMER DISPLAY =================

          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                formatTime(remainingSeconds),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          TextButton(
            onPressed: submitQuiz,
            child: const Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: selectedSubjects.map((subject) {

                  bool isActive = subject == activeSubject;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isActive ? Colors.green : Colors.white,

                        foregroundColor:
                        isActive ? Colors.white : Colors.black,
                      ),

                      onPressed: () {
                        setState(() {
                          activeSubject = subject;
                        });
                      },

                      child: Text(subject),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Q$current / $total",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(
              question["question"],
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 20),

            ...List.generate(4, (i) {

              String label = ["A", "B", "C", "D"][i];

              bool isSelected =
                  selectedAnswers[activeSubject]
                  ?[subjectIndex[activeSubject]!] == i;

              return GestureDetector(
                onTap: () => selectAnswer(i),

                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),

                  padding: const EdgeInsets.all(14),

                  decoration: BoxDecoration(
                    color:
                    isSelected ? Colors.green : Colors.white,

                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Text(
                    "$label. ${question["options"][i]}",

                    style: TextStyle(
                      color:
                      isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                ElevatedButton(
                  onPressed: previousQuestion,
                  child: const Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= RESULT SCREEN =================

  Widget resultScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Text(
              "Total Score: $totalScore",

              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: selectedSubjects.map((subject) {

                  return Card(
                    child: ListTile(
                      title: Text(subject),

                      subtitle: Text(
                        "Score: ${subjectScores[subject]} / ${questionBank[subject]!.length}",
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            ElevatedButton(
              onPressed: () {

                timer?.cancel();

                setState(() {
                  quizFinished = false;
                  selectedSubjects.clear();
                  totalScore = 0;
                });
              },

              child: const Text("Restart"),
            )
          ],
        ),
      ),
    );
  }

  // ================= DISPOSE =================

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}