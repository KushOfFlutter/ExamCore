887777l7llll0njimport 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
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
{"id":"PHY200","topic":"Electricity - Power","question":"Which of the following best explains why transformers are used to step up voltage for long-distance power transmission?","options":["Higher voltage reduces current, minimizing power loss due to resistance in transmission lines","Higher voltage increases current, improving efficiency","Higher voltage reduces the need for insulation","Higher voltage eliminates resistance in wires"],"answer":"Higher voltage reduces current, minimizing power loss due to resistance in transmission lines"}
  ],

"Chemistry":[
  {
  "id": "CHEM001",
  "topic": "Basic Chemistry",
  "question": "H2O is called?",
  "options": ["Salt", "Water", "Hydrogen", "Oxygen"],
  "answer": "Water"
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
{"id":"ENG200","topic":"Lexis and Structure - Synonyms","question":"The old palace was known for its OPULENCE.","options":["Luxury","Poverty","Simplicity","Age"],"answer":"Luxury"}
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
{"id":"BIO200","topic":"Nutrition","question":"Which of the following best describes the role of enzymes in digestion?","options":["They speed up the breakdown of food molecules","They provide energy directly","They store nutrients","They transport oxygen"],"answer":"They speed up the breakdown of food molecules"}
],

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